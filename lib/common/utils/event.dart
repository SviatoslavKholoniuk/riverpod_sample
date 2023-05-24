class Event<T> {
  final T content;
  bool _isConsumed = false;

  Event(this.content);

  T? get getContent {
    if (_isConsumed) {
      return null;
    } else {
      _isConsumed = true;
      return content;
    }
  }
}

class NoData {}
