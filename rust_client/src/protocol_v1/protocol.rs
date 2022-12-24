use connect::connection::BaseConnection;
use std::thread;
use world_sync_rust;
use protobuf::Message;
use byteorder::{ByteOrder, BigEndian};

struct ProtocolV1State<T : BaseConnection<T>> {
    connection : T,
    version : i32,
    message_handler : std::rc::Rc<dyn Fn(i32)>,
}

unsafe impl<T : BaseConnection<T>> std::marker::Send for ProtocolV1State<T>{}
unsafe impl<T : BaseConnection<T>> std::marker::Sync for ProtocolV1State<T>{}



pub struct ProtocolV1<T : BaseConnection<T>> {
    state : ProtocolV1State<T>
}

impl<T : BaseConnection<T> + 'static> ProtocolV1<T> {
    pub fn new(addr : &str, handler : std::rc::Rc<dyn Fn(i32)>) -> Option<Self>{
        match T::new(addr){
            Some(c) => {
                return Some(
                    Self{

                        state : ProtocolV1State::<T>{
                            connection : c,
                            version : 0,
                            message_handler : handler,
                        }
                    }
                )
            },
            None => {
                return None;
            }
        }
    }

    pub fn StartConnection(&mut self) -> bool {
        let rx = self.state.connection.GetRx();
        std::thread::spawn(move ||{
            let mut r_x = rx; 
            loop {
                let mut data = [0;1024];
                r_x.Read(&mut data);
            }
            //println!("Version: {}", state.version)
        });

        let tx = self.state.connection.GetTx();
        std::thread::spawn(move ||{
            let mut t_x = tx;            
            let mut send_buffer = vec![0;2050];
            let mut seq_num = 0;

            loop{

                let mut init_msg = world_sync_rust::ClientMsg::new();
                init_msg.seq_num = seq_num;
                seq_num+=1;

                let msg_bytes = init_msg.write_to_bytes().unwrap();
                BigEndian::write_u32(&mut send_buffer[0..4],msg_bytes.len() as u32);
                send_buffer[4..(4+msg_bytes.len())].copy_from_slice(&msg_bytes);
                
                t_x.Send(&send_buffer[..(msg_bytes.len() + 4)]);
            }
            //println!("Version: {}", state.version)
        });
        return true;
    }
}
