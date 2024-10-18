import 'package:dart_fsm/turnstile.dart';
import 'package:test/test.dart';

void main() {
  group("finite state machine", () {
    group("state(locked)", () {
      test("input(coin)", () {
        expect(nextState(const Locked(), const Coin()), const Unlocked());
      });

      test("input(push)", () {
        expect(nextState(const Locked(), const Push()), const Locked());
      });
    });

    group("state(unlocked)", () {
      test("input(coin)", () {
        expect(nextState(const Unlocked(), const Coin()), const Unlocked());
      });

      test("input(push)", () {
        expect(nextState(const Unlocked(), const Push()), const Locked());
      });
    });
  });
}
