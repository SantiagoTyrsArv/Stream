import 'dart:async';
import '../../core/event_strings.dart';

class DateValidator {
  /// StreamTransformer que valida que la fecha seleccionada sea en el futuro.
  static StreamTransformer<DateTime?, DateTime> get transformer =>
      StreamTransformer<DateTime?, DateTime>.fromHandlers(
        handleData: (date, sink) {
          if (date == null) {
            sink.addError(EventStrings.dateEmpty);
          } else if (date.isBefore(DateTime.now())) {
            sink.addError(EventStrings.datePast);
          } else {
            sink.add(date);
          }
        },
      );
}
