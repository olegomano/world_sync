package tcp
import (
  "net"
  "os"
  "fmt"
)

const (
  HOST = "127.0.0.1"
  PORT = "9001"
  TYPE = "tcp"
)

type TcpManager struct {
  config TcpManagerConfig
}

type TcpConnection struct{
  connection net.Conn
}

func (self* TcpConnection) Uuid() string {
  return ""
}

func (self* TcpConnection) Write(data []byte) bool {
  return false
}

func (self* TcpConnection) Read(data []byte ) (int,bool){
   return 0,false
}

func (self* TcpConnection) Close(){

}

func (self* TcpConnection) State() int {
  return 0
}


type NewTcpConnectionHandler func(TcpConnection) 
type TcpManagerConfig struct{
  Tcp_opened_handler NewTcpConnectionHandler
}

func CreateTcpManager(config TcpManagerConfig) TcpManager {
  var res = TcpManager{
    config : config,
  }
  return res
}

func (self* TcpManager) Start(){
  self.connectionListener()
}


func (self* TcpManager) connectionListener(){
  connection, err := net.Listen(TYPE, HOST+":"+PORT)
  if err != nil {
    fmt.Println("Failed start tcp server")
    os.Exit(1)
  } 
  for{
    c,_ := connection.Accept()
    var tcp_connection = TcpConnection{
      connection : c,
    }
    self.config.Tcp_opened_handler(tcp_connection)
  }
}
