use std::net::{TcpStream};
use crate::client::QueueClient;
use std::sync::atomic::{AtomicI8, Ordering};
use std::sync::{Arc,Mutex,Condvar};
use std::thread;
use crate::num::FromPrimitive;
use std::io::Write;

pub trait Message<T>{
    fn Encode(&self) -> &[u8];
    fn Decode() -> T;
}

#[derive(PartialEq)]
#[derive(FromPrimitive)]
enum State{
    OFFLINE,
    CONNECTING,
    READY,
    DESTROYED
}

#[derive(Clone)]
struct Config{
    addr : String,
}

struct MsgClientImpl<T>{
    config : Config,
    tcp : Option<TcpStream>,
    queue : QueueClient<T>,
    state : AtomicI8,
    signal : Condvar,
    signal_mutex : Mutex<bool>,
}

unsafe impl<T> Send for MsgClientImpl<T>{}
unsafe impl<T> Sync for MsgClientImpl<T>{}

impl<T> MsgClientImpl<T>
    where T : Message<T> + Copy
    {
    /**
     * Thread that reads of the tcp socket and manages connection state
     */
    fn RxThread(&mut self){
        loop{
            let state = State::from_i8(self.state.load(Ordering::Acquire)).unwrap();
            match state{
                State::OFFLINE => {},
                State::CONNECTING => {},
                State::READY => {},
                State::DESTROYED => {},
            }
        }
    }
    
    /*
     * Tat writes to the tcp_socket
     */
    fn TxThread(&self){
        loop{
            let connection_state = State::from_i8(self.state.load(Ordering::Acquire)).unwrap();
            if connection_state != State::READY {
                let mut lock_guard = self.signal_mutex.lock().unwrap();
                self.signal.wait(lock_guard).unwrap();
            }
            
            let pending_messages = self.queue.WaitForNext();
            for msg in pending_messages.iter() {
                let buffer = msg.Encode();
                self.tcp.as_ref().unwrap().write(buffer);
            }    
        }
    }

    fn TryConnect(&mut self){
        match TcpStream::connect(self.config.addr.clone()){
            Ok(socket) => {
                self.tcp = Some(socket);
                self.state.store(State::READY as i8,Ordering::Release);
            },
            Err(e) =>{},
        }
    }

}

struct MsgClient<T>{
    client : Arc<MsgClientImpl<T>>
}

impl<T : Message<T> + Copy + 'static> MsgClient<T>{
    pub fn  new(config : &Config) -> Self {
        let client =  Arc::new(MsgClientImpl{
            config : config.clone(),
            tcp : None,
            state : AtomicI8::new(State::OFFLINE as i8),
            queue : QueueClient::<T>::new(),
            signal : Condvar::new(),
            signal_mutex : Mutex::new(false),
        });
        
        let cp = client.clone();
        thread::spawn(move || {
            let thread_copy = cp.clone();
            thread_copy.TxThread();   
        });
        
        return Self{
            client : client
        };
    }

    pub fn Send(&self, msg : &T){
        self.client.queue.Queue(msg);
    }
}


