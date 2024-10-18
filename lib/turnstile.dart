sealed class State {}

class Locked implements State {
  const Locked();
}

class Unlocked implements State {
  const Unlocked();
}

sealed class Event {}

class Push implements Event {
  const Push();
}

class Coin implements Event {
  const Coin();
}

State nextState(State state, Event event) {
  return switch (state) {
    Locked() => isLocked(event),
    Unlocked() => isUnlocked(event),
  };
}

State isLocked(Event event) {
  return switch (event) {
    Push() => const Locked(),
    Coin() => const Unlocked(),
  };
}

State isUnlocked(Event event) {
  return switch (event) {
    Push() => const Locked(),
    Coin() => const Unlocked(),
  };
}
