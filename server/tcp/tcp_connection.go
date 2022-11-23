package tcp
import (
  "net"
)
import "multiplayer/server/connection_manager"


type TcpSession struct {
  connection net.Conn
  handler connection_manager.ConnectionDataHandler
}

type PendingTcpSession struct {
  connection net.Conn
}

func CreatePendingTcpSession(conn net.Conn) connection_manager.IPendingConnection{
  return &PendingTcpSession{ connection : conn}
}


func HandleSession(session* TcpSession) {
  for{
    buf := make([]byte, 1024)
    session.connection.Read(buf)
    session.handler(session,buf)
  }
}

func (pending_session* PendingTcpSession) Create(handler connection_manager.ConnectionDataHandler) connection_manager.IConnection {
  session := TcpSession{
    connection : pending_session.connection,
    handler : handler,
  }
  go HandleSession(&session)
  return &session
}


func (session* TcpSession) Send(data []byte) {
  session.connection.Write(data)
}

