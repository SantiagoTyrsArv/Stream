import 'dart:async';
import '../../core/event_strings.dart';

class CapacityValidator {
  static StreamTransformer<String, String> get transformer =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
          if (value.isEmpty) {
            sink.addError(EventStrings.capacityEmpty);
          } else {
            final n = int.tryParse(value);
            if (n == null || n < 1 || n > 100000) {
              sink.addError(EventStrings.capacityInvalid);
            } else {
              sink.add(value);
            }
          }
        },
      );
}
