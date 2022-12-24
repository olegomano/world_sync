package main

import (
  "fmt"
)
import "multiplayer/server/tcp"
import "multiplayer/server/scheduler"

func main() {
  fmt.Println("hello world") 
  var scheduler_instance = scheduler.Create(scheduler.SchedulerConfig{}) 
  var tcp_manager = tcp.CreateTcpManager(tcp.TcpManagerConfig{
    Tcp_opened_handler : func (tcp_connection  tcp.TcpConnection){
      fmt.Println("New tcp connection opened")
      scheduler_instance.AddConnection(&tcp_connection)
    },
  })
  tcp_manager.Start()
}
