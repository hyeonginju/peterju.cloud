import 'dart:js_interop';

@JS('initPhysicsWithData')
external void _jsInitPhysics(String containerId, String quotesJson);

@JS('destroyPhysics')
external void _jsDestroy();

@JS('setPhysicsClickCallback')
external void _jsSetClickCallback(JSFunction fn);

@JS('innerWidth')
external int get _innerWidth;

int get viewportWidth => _innerWidth;

void initPhysics(String containerId, String quotesJson) {
  _jsInitPhysics(containerId, quotesJson);
}

void destroyPhysics() {
  _jsDestroy();
}

void setClickCallback(void Function(int) callback) {
  _jsSetClickCallback(((JSNumber idx) {
    callback(idx.toDartInt);
  }).toJS);
}
