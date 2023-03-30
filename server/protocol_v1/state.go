package protocol_v1
import (
  "fmt"
	"google.golang.org/protobuf/proto"
  "google.golang.org/protobuf/reflect/protoreflect"
)
import "multiplayer/pbtypes"


type State struct{
  device_state map[int64]pbtypes.EntityState
}

func (self* State) Update(update pbtypes.EntityUpdate){
  for i, entity := update.update() {
    reflection := entity.state().ProtoReflect()
    mask := entity.field_mask()

    fields := extractFields(reflection,mask)
    for i,field_descriptor : fields {
      value := entity.state().Get(field_descriptor)
      device_state[entity.uuid()].Set(field_descriptor,value);
    }
  }
}

func (self* State) CreateObserver(observer IEntityObserver) {

}


func extractFields(m protoreflect.Message, field_mask uint64) []protoreflect.FieldDescriptor{
  result := make([]protoreflect.FieldDescriptor,0)
  m.Range(
    func (field protoreflect.FieldDescriptor, value protoreflect.Value) bool {
      number := field.FieldNumber()
      mask uint64 := 1 << number
      if (( mask & field_mask) != 0) {
        result = append(result,field)
      }
    }
  )
  return result
}
