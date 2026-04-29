import '../entities/registration_form.dart';

/// Contrato abstracto para el repositorio de registro.
/// La presentación depende de esta abstracción, no de la implementación.
abstract class RegistrationRepository {
  Future<bool> register(RegistrationForm form);
}
