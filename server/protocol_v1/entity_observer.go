package protocol_v1

type OnLocationUpdated func(self* EntityObserver)

type EntityObserver struct {
  x float32
  y float32
  z float32
  location_observer OnLocationUpdated
  state* State
}

func Create(observer OnLocationUpdated) EntityObserver {
  return EntityObserver{
    x : 0,
    y : 0,
    z : 0,
    location_observer : observer
  }
}

func (self* EntityObserver) UpdateLocation() {

}


