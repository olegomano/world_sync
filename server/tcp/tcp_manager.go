package tcp
import (
  "net"
  "os"
  "fmt"
)

type TcpManager struct {
  config TcpManagerConfig
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
    var tcp_connection = NewTcpConnection(c)
    self.config.Tcp_opened_handler(tcp_connection)
  }
}
