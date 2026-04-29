import '../entities/event_form.dart';
import '../repositories/event_repository.dart';

class PublishEvent {
  final EventRepository repository;
  PublishEvent(this.repository);
  Future<bool> call(EventForm form) => repository.publish(form);
}
