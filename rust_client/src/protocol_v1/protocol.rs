use connect::connection::BaseConnection;
use std::thread;
use world_sync_rust;

struct ProtocolV1State<T : BaseConnection<T>> {
    connection : T,
    version : i32,
}
unsafe impl<T : BaseConnection<T>> std::marker::Send for ProtocolV1State<T>{}
unsafe impl<T : BaseConnection<T>> std::marker::Sync for ProtocolV1State<T>{}



pub struct ProtocolV1<T : BaseConnection<T>> {
    state : ProtocolV1State<T>
}

impl<T : BaseConnection<T> + 'static> ProtocolV1<T> {
    pub fn new(addr : &str) -> Option<Self>{
        match T::new(addr){
            Some(c) => {
                return Some(
                    Self{

                        state : ProtocolV1State::<T>{
                            connection : c,
                            version : 0,
                        }
                    }
                )
            },
            None => {
                return None;
            }

        }
    }

    pub fn SendInit(&mut self) -> bool {
        let mut init_msg = world_sync_rust::ClientMsg::new();
        init_msg.seq_num = 1;

        let rx = self.state.connection.GetRx();
        std::thread::spawn(move ||{
            let mut r_x = rx; 
            let mut data = [0;1024];
            r_x.Read(&mut data);
            //println!("Version: {}", state.version)
        });
        
        return true;
    }
}
