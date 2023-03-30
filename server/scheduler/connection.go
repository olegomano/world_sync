package scheduler

const (
  STATE_IDLE int = iota
  STATE_CONNECTED
  STAET_DESTROYED
)

/**
* Read(): reads one message from the connection. How messages are delimted is up
* to the connection. A TCP connection can put senitnels into the steeam to
* figure out message boundires. A UDP conneciion can choose to chunk messages
*
* Write(): write out a slice of bytes. The bytes will be delimited as one
* message by the underlying connection implementation
*
* CLose(): close the connection. Connection will transition to STATE_DESTROYED
*
*/
type IConnection interface { 
  Uuid() string
  Write(data [] byte) bool  
  Read(data [] byte) (int, bool)
  Close()
  State() int
}



/**
* Represents a instance of a connection
* Tracks metadata associated with the raw connection
*
* linked_clients: list of uuid of clients associated with this connection
*
*/
type ConnectionInstance struct {
  handle int32
  raw_connection IConnection
  linked_clients []string 

}
