/// Form validators. Each returns an error message, or null when valid.
abstract final class Validators {
  static final _email = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');

  static String? notEmpty(String? value, String message) =>
      (value ?? '').trim().isEmpty ? message : null;

  static String? username(String? value) => (value ?? '').trim().length < 4
      ? 'Username must be at least 4 characters'
      : null;

  static String? email(String? value) => _email.hasMatch((value ?? '').trim())
      ? null
      : 'Enter a valid email address';

  static String? password(String? value) {
    final v = value ?? '';
    final strong = v.length >= 8 &&
        v.contains(RegExp(r'[A-Z]')) &&
        v.contains(RegExp(r'[a-z]')) &&
        v.contains(RegExp(r'[0-9]'));
    return strong
        ? null
        : 'Use 8+ characters with upper and lower case letters and a number';
  }

  static String? Function(String?) matches(String Function() original) =>
      (value) => value == original() ? null : 'Passwords do not match';
}
