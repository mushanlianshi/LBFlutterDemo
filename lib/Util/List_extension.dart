
extension Flatten<T> on Iterable<T> {
  Iterable<T> flatten() {
    Iterable<T> _flatten(Iterable<T> list) sync* {
      for (final value in list) {
        if (value is List<T>) {
          yield* _flatten(value);
        } else {
          yield value;
        }
      }
    }
    return _flatten(this);
  }
}

extension Flatten22<T extends Object> on Iterable<T> {
  Iterable<T> flatten22() {
    Iterable<T> _flatten(Iterable<T> list) sync* {
      for (final value in list) {
        if (value is List<T>) {
          yield* _flatten(value);
        } else {
          yield value;
        }
      }
    }
    return _flatten(this);
  }
}


void testIterable(){
    List<String> list = ["1", "2"];
    list.where((item) => item.isNotEmpty).flatten();
    list.where((item) => item.isNotEmpty).flatten22();
}