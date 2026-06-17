import 'dart:js_interop';

@JS('localStorage.getItem')
external String? _lsGet(String key);

@JS('localStorage.setItem')
external void _lsSet(String key, String value);

String? lsGet(String key) {
  try {
    return _lsGet(key);
  } catch (_) {
    return null;
  }
}

void lsSet(String key, String value) {
  try {
    _lsSet(key, value);
  } catch (_) {}
}
