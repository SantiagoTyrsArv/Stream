import '../../domain/entities/event_form.dart';

class EventRemoteDataSource {
  Future<bool> publish(EventForm form) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
