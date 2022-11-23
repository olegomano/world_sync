use test_proto_rust;
use connect;

fn main(){
    println!("Hello World");
    let mut stream = connect::connection::ProtocolV1::<connect::tcp::TcpConnection>::new("127.0.0.1:9001").unwrap();
    while true{
        stream.Send(&[1]);
    }


}
