use connect::connection::BaseConnection;
use std::thread;



struct ProtocolV1State<T : BaseConnection<T>> {
    connection : std::sync::Arc<T>
}


pub struct ProtocolV1<T : BaseConnection<T>> {
    state : ProtocolV1State<T>
}

impl<T : BaseConnection<T>> ProtocolV1<T> {
    pub fn new(addr : &str) -> Option<Self>{
        match T::new(addr){
            Some(c) => {
                return Some(
                    Self{
                        state : ProtocolV1State::<T>{
                            connection : std::sync::Arc::new(c)
                                
                        }
                    }
                )
            },
            None => {
                return None;
            }

        }
    }
            
    pub fn SendInit(&mut self) -> bool{
        let connection = self.state.connection.clone();
        return true;
    }
}
