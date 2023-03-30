package scheduler
import "multiplayer/pbtypes"

type Client{
  connection *ConnectionInstance
  uuid string
}

type TxMessage{
  target []string
  message pbtypes.ClientMsg
}


