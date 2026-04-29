import '../../domain/entities/event_form.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_datasource.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource dataSource;
  EventRepositoryImpl(this.dataSource);

  @override
  Future<bool> publish(EventForm form) => dataSource.publish(form);
}
