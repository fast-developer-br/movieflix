import 'dart:async';

abstract class DebouncerUtils {
  run(Function() action);
}

class IDebouncerUtils implements DebouncerUtils {
  final int milliseconds;
  Timer? _timer;

  IDebouncerUtils({required this.milliseconds});

  @override
  run(Function() action) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
