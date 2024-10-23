import 'package:dart_fsm/turnstile.dart' as ts;
import 'package:dart_fsm/binary_parser.dart' as bp;
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

  group('binary parser', () {
    test("state(1) | event(0)", (){
      expect(bp.nextState(const bp.One(), 0), const bp.Zero());
    });

    test("state(0) | event(1)", (){
      expect(bp.nextState(const bp.Zero(), 1), const bp.One());
    });

    test("state(1) | event(1)", (){
      expect(bp.nextState(const bp.One(), 1), const bp.Err());
    });

    test("state(0) | event(0)", (){
      expect(bp.nextState(const bp.Zero(), 0), const bp.Err());
    });    

    test("state(error) | event(1)", (){
      expect(bp.nextState(const bp.Err(), 1), const bp.Err());
    });

    test("state(error) | event(0)", (){
      expect(bp.nextState(const bp.Err(), 0), const bp.Err());
    });    
  });
}
