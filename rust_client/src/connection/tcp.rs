use std::net::TcpStream;
use crate::connection::ITransport;
use crate::connection::IConnection;
use std::io::Write;
use std::io::Read;

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
}

impl ITransport for TcpConnection{
      fn Send(&mut self,data : &[u8]) -> bool{
        self.tcp.write(data);
        return true;
    }

    fn Close(&mut self){

    }

    fn Read(&mut self, data : &mut [u8]) -> usize {
        let res = self.tcp.read(data);
        return res.unwrap();
    }
}



unsafe impl std::marker::Send for TcpConnection{}
unsafe impl std::marker::Sync for TcpConnection{}

