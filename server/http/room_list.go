package http

import "github.com/gin-gonic/gin"
import "net/http"
import "multiplayer/server/connection_manager"

type OnConnectionRequested func(pending_connection connection_manager.IPendingConnection)


type PendingConnection struct{}
type Connection struct{}

func (self* PendingConnection) Create( handler connection_manager.ConnectionDataHandler  ) connection_manager.IConnection {
  connection := new(Connection)
  return connection
} 

func (self* Connection) Send(data []byte) {
  
} 

type Config struct{
  Connection_request_handler OnConnectionRequested
}

type Context struct{
  name string
  engine *gin.Engine
  config Config
}

func NewContext(config Config) Context {
  return Context{name : "Name",engine : gin.Default(), config : config}
}

func (context* Context) Start() {
  context.engine.GET("/ping",func (c *gin.Context){
    context.config.Connection_request_handler(  &PendingConnection{}  )

    c.JSON(http.StatusOK, gin.H{
      "message": "pong",
      "name" : context.Name(),
    })
  })
  context.engine.Run()
}

func (context* Context) GetInfo(c *gin.Context) {
    c.IndentedJSON(http.StatusOK, context.name)
}

func (context* Context) Name() string {
  return context.name
}



