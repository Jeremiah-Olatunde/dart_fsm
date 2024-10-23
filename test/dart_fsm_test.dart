import 'package:dart_fsm/turnstile.dart' as ts;
import 'package:test/test.dart';

void main() {
  group("turnstile", () {
    group("state(locked)", () {
      test("input(coin)", () {
        expect(ts.nextState(const ts.Locked(), const ts.Coin()), const ts.Unlocked());
      });

      test("input(push)", () {
        expect(ts.nextState(const ts.Locked(), const ts.Push()), const ts.Locked());
      });
    });

    group("state(unlocked)", () {
      test("input(coin)", () {
        expect(ts.nextState(const ts.Unlocked(), const ts.Coin()), const ts.Unlocked());
      });

      test("input(push)", () {
        expect(ts.nextState(const ts.Unlocked(), const ts.Push()), const ts.Locked());
      });
    });
  });
}
