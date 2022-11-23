package connection_manager
import(
  "fmt"
)
 
type ConnectionManager struct{
  connections []IConnection
  pending_transport chan IPendingConnection
  recv_data chan []byte
}

func Create() ConnectionManager {
  return ConnectionManager{
    pending_transport : make(chan IPendingConnection),
    recv_data : make(chan []byte),
  }
}

func (manager* ConnectionManager) StartSession(pending_connection IPendingConnection) {
  fmt.Println("Starting new session")
  manager.pending_transport <- pending_connection
}

func (manager* ConnectionManager) onConnectionData(source IConnection, data []byte){
  fmt.Println("Connection ", source, " sent data ", data)
}

func (manager* ConnectionManager) Run() {
  for{
    select{
      case pending_transport := <- manager.pending_transport:
        fmt.Println("Allocating new transport", pending_transport)
        pending_transport.Create(manager.onConnectionData)
    }
  }
}

