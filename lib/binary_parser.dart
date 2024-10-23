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
