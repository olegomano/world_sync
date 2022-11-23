package connection_manager

type ConnectionDataHandler func(source IConnection, data []byte)

type IConnection interface{
  Send(data []byte)
}

type IPendingConnection interface{
  Create(handler ConnectionDataHandler) IConnection
}


