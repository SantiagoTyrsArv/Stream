import 'dart:async';
import '../../core/event_strings.dart';

class TitleValidator {
  static StreamTransformer<String, String> get transformer =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
          if (value.isEmpty) {
            sink.addError(EventStrings.titleEmpty);
          } else if (value.length < 5) {
            sink.addError(EventStrings.titleShort);
          } else if (value.length > 60) {
            sink.addError(EventStrings.titleLong);
          } else {
            sink.add(value);
          }
        },
      );
}
