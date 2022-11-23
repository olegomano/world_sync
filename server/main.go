package main

import (
  "log"
  "fmt"
  "net"
)
import "multiplayer/server/tcp"
import "multiplayer/server/connection_manager"
const (
  HOST = "127.0.0.1"
  PORT = "9001"
  TYPE = "tcp"
)

func main() {
  fmt.Println("hello world")
  connection_manager := connection_manager.Create()
  go connection_manager.Run()
  
  connection, err := net.Listen(TYPE, HOST+":"+PORT)

  for{
    if err != nil {
      log.Fatal(err)
      return
    }
    c,_ := connection.Accept();
    connection_manager.StartSession(tcp.CreatePendingTcpSession(c))
    fmt.Println("Opened new tcp connection, ", c) 
  }
}
