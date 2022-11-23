use std::io::prelude::*;
use std::boxed::Box;
use std::thread;

pub struct ConnectionParams{
    pub addr : String,
}

pub trait IConnection<T>{
    fn new(addr : &str) -> Option<T>;
    fn Send(&mut self, data : &[u8]) -> bool;
    fn Close(&mut self);
}


pub struct ProtocolV1<T : IConnection<T>>{
    connection : T
}

impl<T : IConnection<T>> ProtocolV1<T> {
    pub fn new(addr : &str) -> Option<Self>{
        match T::new(addr){
            Some(c) => {
                return Some(
                    Self{
                        connection : c
                    }
                )
            },
            None => {
                return None;
            }

        }
    }
        
    pub fn Send(&mut self,data : &[u8]) -> bool{
        return self.connection.Send(data);
    }
}


