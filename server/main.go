package main

import (
  "log"
  "fmt"
  "net"
)
import "multiplayer/server/http"
import "multiplayer/server/tcp"
import "multiplayer/server/connection_manager"
const (
  HOST = "127.0.0.1"
  PORT = "9001"
  TYPE = "tcp"
)


type DummySession struct{}

func (session* DummySession) Create(manager connection_manager.ConnectionDataHandler) connection_manager.IConnection {
  return nil
}

func main() {
  fmt.Println("hello world")
  connection_manager := connection_manager.Create()
  go connection_manager.Run()

  http_config := http.Config{Connection_request_handler : connection_manager.StartSession}
  a := http.NewContext(http_config)
  go a.Start()
  
  connection, err := net.Listen(TYPE, HOST+":"+PORT)
  
  for{
    if err != nil {
      log.Fatal(err)
      return
    }
    c,_ := connection.Accept();
    connection_manager.StartSession(tcp_connection.CreatePendingTcpSession(c))
    fmt.Println("Opened new tcp connection, ", c) 
  }
}
