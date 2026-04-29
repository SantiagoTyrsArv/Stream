class EventStrings {
  // Labels
  static const titleLabel        = 'Nombre del evento';
  static const descriptionLabel  = 'Descripción';
  static const locationLabel     = 'Ubicación';
  static const dateLabel         = 'Fecha y hora';
  static const capacityLabel     = 'Aforo máximo';
  static const categoryLabel     = 'Categoría';
  static const colorLabel        = 'Color del tema';
  static const publishBtn        = 'Publicar Evento';
  static const publishing        = 'Publicando...';

  // Hints
  static const titleHint       = 'Ej: Flutter Summit 2025';
  static const descriptionHint = 'Describe tu evento...';
  static const locationHint    = 'Ej: Auditorio Central, Bogotá';
  static const capacityHint    = 'Ej: 200';

  // Errores - Título
  static const titleEmpty   = 'El nombre del evento es obligatorio';
  static const titleShort   = 'Mínimo 5 caracteres';
  static const titleLong    = 'Máximo 60 caracteres';

  // Errores - Descripción
  static const descEmpty = 'Agrega una descripción';
  static const descShort = 'Mínimo 20 caracteres';

  // Errores - Ubicación
  static const locationEmpty = 'La ubicación es obligatoria';
  static const locationShort = 'Mínimo 5 caracteres';

  // Errores - Fecha
  static const dateEmpty  = 'Selecciona la fecha del evento';
  static const datePast   = 'La fecha debe ser en el futuro';

  // Errores - Aforo
  static const capacityEmpty   = 'Ingresa el aforo';
  static const capacityInvalid = 'Debe ser un número entre 1 y 100,000';

  // Éxito
  static const successTitle    = '¡Evento creado!';
  static const successSubtitle = 'Tu evento ha sido publicado exitosamente.';
  static const backBtn         = 'Crear otro evento';

  // Placeholder poster
  static const posterTitle    = 'Nombre del evento';
  static const posterLocation = 'Ubicación del evento';
  static const posterDate     = 'Fecha por definir';
  static const posterCapacity = '—';
}
