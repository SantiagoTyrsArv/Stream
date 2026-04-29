import '../entities/event_form.dart';

abstract class EventRepository {
  Future<bool> publish(EventForm form);
}
