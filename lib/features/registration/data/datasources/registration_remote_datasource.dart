import '../../domain/entities/registration_form.dart';

/// DataSource mock que simula una llamada a una API remota.
/// En producción, esto se reemplaza por HTTP sin tocar las capas superiores.
class RegistrationRemoteDataSource {
  // Emails que ya están "registrados" para demostrar el caso de error
  static const _registeredEmails = {'test@test.com', 'admin@stream.com'};

  Future<bool> register(RegistrationForm form) async {
    // Simula latencia de red
    await Future.delayed(const Duration(seconds: 2));

    if (_registeredEmails.contains(form.email)) {
      throw Exception('El correo ya está registrado.');
    }
    return true;
  }
}
