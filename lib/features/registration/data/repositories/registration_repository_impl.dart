import '../../domain/entities/registration_form.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasources/registration_remote_datasource.dart';

/// Implementación concreta del repositorio.
/// Delega al DataSource y traduce excepciones al contrato.
class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationRemoteDataSource dataSource;

  RegistrationRepositoryImpl(this.dataSource);

  @override
  Future<bool> register(RegistrationForm form) async {
    try {
      return await dataSource.register(form);
    } catch (e) {
      rethrow;
    }
  }
}
