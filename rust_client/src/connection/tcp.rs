use std::net::TcpStream;
use crate::connection::IConnection;
use std::io::Write;

pub struct TcpConnection{
    tcp : std::net::TcpStream,
}

impl IConnection<TcpConnection> for TcpConnection{
    fn new(address : &str) -> Option<TcpConnection>{
        match TcpStream::connect(address){
            Ok(tcp) => {
                return Some(
                    Self{
                        tcp : tcp
                    }
                )
            }
            Err(e) =>{
                println!("Failed to open tcp socket");
                return None;
            } 
        }
    }

    fn Send(&mut self,data : &[u8]) -> bool{
        self.tcp.write(data);
        return true;
    }

    fn Close(&mut self){

    }
}


