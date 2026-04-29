class AppStrings {
  // General
  static const appName = 'StreamForm';
  static const register = 'Crear cuenta';
  static const submitting = 'Registrando...';

  // Labels
  static const nameLabel = 'Nombre completo';
  static const emailLabel = 'Correo electrónico';
  static const passwordLabel = 'Contraseña';
  static const confirmPasswordLabel = 'Confirmar contraseña';

  // Hints
  static const nameHint = 'Ej: Juan Pérez';
  static const emailHint = 'Ej: juan@correo.com';
  static const passwordHint = 'Mínimo 8 caracteres';
  static const confirmPasswordHint = 'Repite tu contraseña';

  // Errores – Nombre
  static const nameEmpty = 'El nombre es obligatorio';
  static const nameShort = 'Mínimo 2 caracteres';
  static const nameInvalid = 'Solo letras y espacios';

  // Errores – Email
  static const emailEmpty = 'El correo es obligatorio';
  static const emailInvalid = 'Ingresa un correo válido';

  // Errores – Contraseña
  static const passwordEmpty = 'La contraseña es obligatoria';
  static const passwordShort = 'Mínimo 8 caracteres';
  static const passwordWeak = 'Debe incluir mayúscula, número y carácter especial';

  // Errores – Confirmar contraseña
  static const confirmPasswordEmpty = 'Confirma tu contraseña';
  static const confirmPasswordMismatch = 'Las contraseñas no coinciden';

  // Éxito
  static const successTitle = '¡Registro exitoso!';
  static const successSubtitle = 'Tu cuenta ha sido creada correctamente.';
  static const backToForm = 'Volver al inicio';
}
