/// Entidad inmutable del formulario de registro.
/// Pertenece a la capa de dominio — sin dependencias externas.
class RegistrationForm {
  final String name;
  final String email;
  final String password;

  const RegistrationForm({
    required this.name,
    required this.email,
    required this.password,
  });

  RegistrationForm copyWith({String? name, String? email, String? password}) {
    return RegistrationForm(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationForm &&
          name == other.name &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => Object.hash(name, email, password);
}
