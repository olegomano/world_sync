package scheduler
import (
"fmt"
)

type SchedulerConfig struct{

}

type Scheduler struct {
  config SchedulerConfig
  pending_connections chan IConnection
  pending_interrupts chan IConnection
  destroyed_connections chan IConnection
  active_connections map[string] IConnection
  input_messages chan []byte
}

func Create(config SchedulerConfig) Scheduler{
  var res = Scheduler{
    config : config,
    pending_connections : make(chan IConnection),
    pending_interrupts : make(chan IConnection),
    destroyed_connections : make(chan IConnection),
    input_messages : make(chan []byte),
    active_connections : make(map[string] IConnection),
  }
  go res.MainThread()
  go res.RxThread()
  return res;
}

func (self* Scheduler) AddConnection(connection IConnection) {
  
}

func (self* Scheduler) CloseConnection(connection IConnection){

}

func (self* Scheduler) HandleData(data []byte){
  //decode protobuf 
}

func (self* Scheduler) MainThread() {
  for{
    select{
      case connection := <- self.pending_connections:
        fmt.Println("Got new pending connection")
        go self.Reader(connection)
      case connection := <- self.destroyed_connections:
        fmt.Println("Connection has been destroyed ", connection)
      case connection := <- self.pending_interrupts:
        fmt.Println("Connection has been interrupted")
        connection.Close()
    }
  }
}


func (self* Scheduler) RxThread() {  
  for{
    select{
      case message := <- self.input_messages:
        fmt.Println("Got new message",message)
      }
    }
}


func(self* Scheduler) Reader(conn IConnection){
  for{
    data := make([]byte, 4096)
	  _, err := conn.Read(data)
    if err == true{
      fmt.Println("Read() has returned error, closing connection")
      self.destroyed_connections <- conn
    }
  }
}
