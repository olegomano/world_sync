use std::io::prelude::*;
use std::boxed::Box;
use std::thread;

pub struct ConnectionParams{
    pub addr : String,
}

pub trait IConnection<T>{
    fn new(addr : &str) -> Option<T>;
}

pub trait ITransport{
    fn Send(&mut self, data : &[u8]) -> bool;
    fn Close(&mut self);
    fn Read(&mut self, data : &mut [u8]) -> usize;
}

pub trait BaseConnection<T> : IConnection<T>  + ITransport + std::marker::Send + std::marker::Sync {} 
impl<T : IConnection<T> + ITransport + std::marker::Send + std::marker::Sync>  BaseConnection<T> for T {}

