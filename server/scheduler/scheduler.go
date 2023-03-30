package scheduler
import (
  "fmt"
	"google.golang.org/protobuf/proto"
)

import "multiplayer/pbtypes"

/**
* On_message: called when we any active client sends a message
*   can be called on an arbitrary thread
*
* On_newClient: called when a new client connects
*   can be called on an arbitrary thread
*
* On_clientClosed: called when a client disconnects
*   called on the Scheduler thread 
*/
type SchedulerConfig struct{
  On_message func(*pbtypes.ClientMessage)
  On_newClient func(string)
  On_clientClosed func(string)
}

type Scheduler struct {
  config SchedulerConfig
  pending_connections chan IConnection
  destroyed_connections chan int32
  
  //maps id to the specific connection
  client_map map[string] Client
  open_connections map[int32]ConnectionInstance 
  handles int32
}

func Create(config SchedulerConfig) Scheduler{
  var res = Scheduler{
    config : config,
    pending_connections : make(chan IConnection),
    destroyed_connections : make(chan int32),
    client_map : make(map[string] Client),
    open_connections : make(map[int32] *ConnectionInstance),
    handles : 0
  }
  go res.MainThread()
  return res;
}

func (self* Scheduler) AddConnection(connection IConnection) {
  fmt.Println("New connection has been added ", connection)
  self.pending_connections <- connection
}

/**
* Send a message to the specified client, or to all clients
*/
func(self* Scheduler) SendMessage(connection_uuid string, msg* pbtypes.ClientMsg){

}

func (self* Scheduler) MainThread() {
  for{
    select{
      case connection := <- self.pending_connections:
        fmt.Println("Starting read thread for connection ", connection)

        instance := new(ConnectionInstance)
        instance.raw_connection = connection
        instance.linked_clients = make([]string,0)
        instance.handle = self.handles
        self.handles+=1

        self.open_connections[instance.handle] = instance
        go self.reader(instance)
      case connection_handle := <- self.destroyed_connections:
        fmt.Println("Connection has been destroyed ", connection_handle)
    }
  }
}


func (self* Scheduler) createClient(uuid string, con* ConnectionInstance){
  con.linked_clients = append(con.linked_clients,uuid)

  client := Client{
    connection : con,
    uuid : uuid
  }
  self.client_map[uuid] = client
}

func(self* Scheduler) handleMessage(msg* pbtypes.ClientMsg, con* ConnectionInstance){
  switch msg.Msg.(type) {
    case pbtypes.CreateClient:
      self.createClient(msg.Uuid(),con)
      self.config.On_newClient(msg.Uuid())
      break  
    default:
      self.config.On_message(msg)
      break
  }
}

func(self* Scheduler) reader(conn *ConnectionInstance){
  data := make([]byte, 4096)
  
  for{
	  msg_len, err := conn.raw_connection.Read(data)
    if err == true{
      fmt.Println("Read() has returned error, closing connection")
      self.destroyed_connections <- conn.handle
      return
    }
    msg := &pbtypes.ClientMsg{}
    if err := proto.Unmarshal(data[0:msg_len], msg); err != nil {
      fmt.Println("Failed to parse message:", err)
      continue
    }
    self.handleMessage(conn,msg)
  }
}


