import 'dart:async';
import '../../core/event_strings.dart';

class LocationValidator {
  static StreamTransformer<String, String> get transformer =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
          if (value.isEmpty) {
            sink.addError(EventStrings.locationEmpty);
          } else if (value.length < 5) {
            sink.addError(EventStrings.locationShort);
          } else {
            sink.add(value);
          }
        },
      );
}
