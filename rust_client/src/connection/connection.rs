use std::io::prelude::*;
use std::boxed::Box;
use std::thread;

pub struct ConnectionParams{
    pub addr : String,
}

pub trait ITxTransport : std::marker::Send + std::marker::Sync{
    fn Send(&mut self, data : &[u8]) -> bool;
}

pub trait IRxTransport : std::marker::Send + std::marker::Sync{
    fn Read(&mut self, data : &mut [u8]) -> usize;
}


pub trait IConnection<T>{
    fn new(addr : &str) -> Option<T>;
    fn Close(&mut self);
    fn GetRx(&mut self) -> Box<dyn IRxTransport>;
    fn GetTx(&mut self) -> Box<dyn ITxTransport>; 
}



pub trait BaseConnection<T> : IConnection<T>  + std::marker::Send + std::marker::Sync {}
impl<T : IConnection<T> + std::marker::Send + std::marker::Sync>  BaseConnection<T> for T {}


