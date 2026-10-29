import 'package:flutter_test/flutter_test.dart';
import 'package:reddit583/utils/validators.dart';

void main() {
  group('username', () {
    test('rejects short names',
        () => expect(Validators.username('abc'), isNotNull));
    test('accepts 4+ characters',
        () => expect(Validators.username('abcd'), isNull));
  });

  group('email', () {
    test('accepts valid addresses', () {
      expect(Validators.email('user@example.com'), isNull);
      expect(Validators.email('first.last+tag@mail.example.org'), isNull);
    });
    test('rejects invalid addresses', () {
      expect(Validators.email('user'), isNotNull);
      expect(Validators.email('user@'), isNotNull);
      expect(Validators.email('user@example'), isNotNull);
      expect(Validators.email(null), isNotNull);
    });
  });

  group('password', () {
    test('requires length, upper, lower and a digit', () {
      expect(Validators.password('Short1'), isNotNull);
      expect(Validators.password('alllowercase1'), isNotNull);
      expect(Validators.password('ALLUPPERCASE1'), isNotNull);
      expect(Validators.password('NoDigitsHere'), isNotNull);
      expect(Validators.password('GoodPass123'), isNull);
    });
  });

  test('matches compares against the original', () {
    final validate = Validators.matches(() => 'secret');
    expect(validate('secret'), isNull);
    expect(validate('other'), isNotNull);
  });

  test('notEmpty trims whitespace', () {
    expect(Validators.notEmpty('  ', 'msg'), 'msg');
    expect(Validators.notEmpty('x', 'msg'), isNull);
  });
}
