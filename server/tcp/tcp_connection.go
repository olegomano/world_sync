package tcp
import (
  "net"
  "fmt"
  "bufio"
  "io" 
  "encoding/binary"
)

type TcpConnection struct{
  connection net.Conn
  reader* bufio.Reader
}

func NewTcpConnection(connection net.Conn) TcpConnection {
  return TcpConnection{
    connection : connection,
    reader : bufio.NewReader(connection),
  }
}

func (self* TcpConnection) Uuid() string {
  return ""
}

func (self* TcpConnection) Write(data []byte) bool {
  return false
}

func (self* TcpConnection) Read(data []byte ) (int,bool){
  var msg_len int32

  err := binary.Read(self.reader,binary.BigEndian,&msg_len)
  if err != nil {
    fmt.Println("read error:", err)
    return 0,true
  }
  
  read_bytes, err := io.ReadFull(self.reader,data[0:msg_len])
  if err != nil{
    fmt.Println("read error:", err)
    return 0,true
  }

  return read_bytes,false
}

func (self* TcpConnection) Close(){

}

func (self* TcpConnection) State() int {
  return 0
}



