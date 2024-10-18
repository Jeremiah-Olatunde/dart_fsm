sealed class State {}

class Locked implements State {}

class Unlocked implements State {}

sealed class Event {}

class Push implements Event {}

class Coin implements Event {}
