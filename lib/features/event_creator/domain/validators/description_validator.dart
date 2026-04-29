import 'dart:async';
import '../../core/event_strings.dart';

class DescriptionValidator {
  static StreamTransformer<String, String> get transformer =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
          if (value.isEmpty) {
            sink.addError(EventStrings.descEmpty);
          } else if (value.length < 20) {
            sink.addError(EventStrings.descShort);
          } else {
            sink.add(value);
          }
        },
      );
}
