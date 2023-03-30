use std::thread;
use std::sync::{Arc,Mutex,Condvar};
use std::boxed::Box;



struct QueueImpl<T>{
    client_id : i32,
    queue : Box<Vec<T>>,
}

pub struct QueueClient<T>{
    client : Arc<Mutex<QueueImpl<T>>>,
    signal : Condvar,
    signal_mutex : Mutex<bool>,
} 

unsafe impl<T> Send for QueueImpl<T>{}
unsafe impl<T> Send for QueueClient<T>{}
unsafe impl<T> Sync for QueueClient<T>{}

impl<T : Copy> QueueClient<T>{ 
    pub fn new() -> Self{
        let client = Arc::new(Mutex::new( 
            QueueImpl{
                client_id : 0,
                queue : Box::new(Vec::<T>::new()),
            }
        )); 
        
        return Self{
            client : client,
            signal : Condvar::new(),
            signal_mutex : Mutex::new(false),
        }
    }    

    pub fn Queue(&self, msg : &T){
        let mut client = self.client.lock().unwrap();
        client.queue.push(msg.clone());
        self.signal.notify_one();
    }
    
    pub fn Interrupt(&self){
        self.signal.notify_one();
    }

    pub fn WaitForNext(&self) -> Box<Vec<T>>{
        let mut client = self.client.lock().unwrap();
        if client.queue.len() > 0 {
            let mut res = Box::new(Vec::<T>::new());
            std::mem::swap(&mut res, &mut client.queue);
            return res;  
        }


        let mut lock_guard= self.signal_mutex.lock().unwrap();        
        self.signal.wait(lock_guard).unwrap();
        let mut res = Box::new(Vec::<T>::new());
        std::mem::swap(&mut res, &mut client.queue);
        return res;  
    }
}

