use test_proto_rust;
use connect;

fn main(){
    println!("Hello World");
    let mut stream = protocol_v1::protocol::ProtocolV1::<connect::tcp::TcpConnection>::new("127.0.0.1:9001").unwrap();
    stream.SendInit();
    loop{}
}
