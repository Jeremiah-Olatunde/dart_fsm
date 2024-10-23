sealed class State {}


class One implements State {
  const One();
}

class Zero implements State {
  const Zero();
}

class Err implements State {
  const Err();
}

State eventOne(State state){
  return switch(state) {
    Err() => const Err(),
    One() => const Err(),
    Zero() => const One(),
  };
}

State eventZero(State state){
  return switch(state) {
    Err() => const Err(),
    One() => const Zero(),
    Zero() => const Err(),
  };
}

State bitToEvent(State state, int n){
  return switch(n){
    0 => eventZero(state),
    1 => eventOne(state),
    _ => throw "non-binary digit"
  };
}