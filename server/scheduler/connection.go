package scheduler

const (
  STATE_IDLE int = iota
  STATE_CONNECTED
  STAET_DESTROYED
)

type IConnection interface { 
  Uuid() string
  Write(data [] byte) bool  
  Read(data [] byte) (int, bool)
  Close()
  State() int
}

type IScheduler interface {
  AddConnection(connection IConnection)
}



