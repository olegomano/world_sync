use std::net::TcpStream;
use crate::connection::ITxTransport;
use crate::connection::IRxTransport;
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

    fn Close(&mut self){
    }
    
    fn GetTx(&mut self) -> std::boxed::Box<dyn ITxTransport>{
        return std::boxed::Box::new(self.tcp.try_clone().unwrap());
    }

    fn GetRx(&mut self) -> std::boxed::Box<dyn IRxTransport>{
        return std::boxed::Box::new(self.tcp.try_clone().unwrap());
    }


}

impl ITxTransport for std::net::TcpStream{
      fn Send(&mut self,data : &[u8]) -> bool{
        self.write(data);
        return true;
    }
}


impl IRxTransport for std::net::TcpStream{
    fn Read(&mut self, data : &mut [u8]) -> usize {
        let res = self.read(data);
        return res.unwrap();
    }
}



unsafe impl std::marker::Send for TcpConnection{}
unsafe impl std::marker::Sync for TcpConnection{}

