import '../../../../core/settings_controller.dart';

class EventStrings {
  static AppLanguage get _lang => SettingsController().language;

  // Labels
  static String get titleLabel => _lang == AppLanguage.es ? 'Nombre del evento' : _lang == AppLanguage.en ? 'Event Name' : 'Nom de l\'événement';
  static String get descriptionLabel => _lang == AppLanguage.es ? 'Descripción' : _lang == AppLanguage.en ? 'Description' : 'Description';
  static String get locationLabel => _lang == AppLanguage.es ? 'Ubicación' : _lang == AppLanguage.en ? 'Location' : 'Lieu';
  static String get dateLabel => _lang == AppLanguage.es ? 'Fecha y hora' : _lang == AppLanguage.en ? 'Date and Time' : 'Date et heure';
  static String get capacityLabel => _lang == AppLanguage.es ? 'Aforo máximo' : _lang == AppLanguage.en ? 'Max Capacity' : 'Capacité maximale';
  static String get categoryLabel => _lang == AppLanguage.es ? 'Categoría' : _lang == AppLanguage.en ? 'Category' : 'Catégorie';
  static String get colorLabel => _lang == AppLanguage.es ? 'Color del tema' : _lang == AppLanguage.en ? 'Theme Color' : 'Couleur du thème';
  static String get publishBtn => _lang == AppLanguage.es ? 'Publicar Evento' : _lang == AppLanguage.en ? 'Publish Event' : 'Publier l\'événement';
  static String get publishing => _lang == AppLanguage.es ? 'Publicando...' : _lang == AppLanguage.en ? 'Publishing...' : 'Publication en cours...';

  // Hints
  static String get titleHint => _lang == AppLanguage.es ? 'Ej: Flutter Summit 2025' : _lang == AppLanguage.en ? 'Ex: Flutter Summit 2025' : 'Ex: Flutter Summit 2025';
  static String get descriptionHint => _lang == AppLanguage.es ? 'Describe tu evento...' : _lang == AppLanguage.en ? 'Describe your event...' : 'Décrivez votre événement...';
  static String get locationHint => _lang == AppLanguage.es ? 'Ej: Auditorio Central, Bogotá' : _lang == AppLanguage.en ? 'Ex: Central Auditorium, Bogota' : 'Ex: Auditorium Central, Bogota';
  static String get capacityHint => _lang == AppLanguage.es ? 'Ej: 200' : _lang == AppLanguage.en ? 'Ex: 200' : 'Ex: 200';

  // Errores - Título
  static String get titleEmpty => _lang == AppLanguage.es ? 'El nombre del evento es obligatorio' : _lang == AppLanguage.en ? 'Event name is required' : 'Le nom de l\'événement est obligatoire';
  static String get titleShort => _lang == AppLanguage.es ? 'Mínimo 5 caracteres' : _lang == AppLanguage.en ? 'Minimum 5 characters' : 'Minimum 5 caractères';
  static String get titleLong => _lang == AppLanguage.es ? 'Máximo 60 caracteres' : _lang == AppLanguage.en ? 'Maximum 60 characters' : 'Maximum 60 caractères';

  // Errores - Descripción
  static String get descEmpty => _lang == AppLanguage.es ? 'Agrega una descripción' : _lang == AppLanguage.en ? 'Add a description' : 'Ajoutez une description';
  static String get descShort => _lang == AppLanguage.es ? 'Mínimo 20 caracteres' : _lang == AppLanguage.en ? 'Minimum 20 characters' : 'Minimum 20 caractères';

  // Errores - Ubicación
  static String get locationEmpty => _lang == AppLanguage.es ? 'La ubicación es obligatoria' : _lang == AppLanguage.en ? 'Location is required' : 'Le lieu est obligatoire';
  static String get locationShort => _lang == AppLanguage.es ? 'Mínimo 5 caracteres' : _lang == AppLanguage.en ? 'Minimum 5 characters' : 'Minimum 5 caractères';

  // Errores - Fecha
  static String get dateEmpty => _lang == AppLanguage.es ? 'Selecciona la fecha del evento' : _lang == AppLanguage.en ? 'Select event date' : 'Sélectionnez la date de l\'événement';
  static String get datePast => _lang == AppLanguage.es ? 'La fecha debe ser en el futuro' : _lang == AppLanguage.en ? 'Date must be in the future' : 'La date doit être dans le futur';

  // Errores - Aforo
  static String get capacityEmpty => _lang == AppLanguage.es ? 'Ingresa el aforo' : _lang == AppLanguage.en ? 'Enter capacity' : 'Entrez la capacité';
  static String get capacityInvalid => _lang == AppLanguage.es ? 'Debe ser un número entre 1 y 100,000' : _lang == AppLanguage.en ? 'Must be a number between 1 and 100,000' : 'Doit être un nombre entre 1 et 100 000';

  // Éxito
  static String get successTitle => _lang == AppLanguage.es ? '¡Evento creado!' : _lang == AppLanguage.en ? 'Event created!' : 'Événement créé !';
  static String get successSubtitle => _lang == AppLanguage.es ? 'Tu evento ha sido publicado exitosamente.' : _lang == AppLanguage.en ? 'Your event has been successfully published.' : 'Votre événement a été publié avec succès.';
  static String get backBtn => _lang == AppLanguage.es ? 'Crear otro evento' : _lang == AppLanguage.en ? 'Create another event' : 'Créer un autre événement';

  // Placeholder poster
  static String get posterTitle => _lang == AppLanguage.es ? 'Nombre del evento' : _lang == AppLanguage.en ? 'Event Name' : 'Nom de l\'événement';
  static String get posterLocation => _lang == AppLanguage.es ? 'Ubicación del evento' : _lang == AppLanguage.en ? 'Event Location' : 'Lieu de l\'événement';
  static String get posterDate => _lang == AppLanguage.es ? 'Fecha por definir' : _lang == AppLanguage.en ? 'Date TBA' : 'Date à définir';
  static String get posterCapacity => _lang == AppLanguage.es ? '—' : _lang == AppLanguage.en ? '—' : '—';
  
  // Novedades (Extra buttons)
  static String get addImage => _lang == AppLanguage.es ? 'Añadir imagen de fondo' : _lang == AppLanguage.en ? 'Add background image' : 'Ajouter une image de fond';
  static String get changeImage => _lang == AppLanguage.es ? 'Cambiar imagen' : _lang == AppLanguage.en ? 'Change image' : 'Changer l\'image';
  static String get removeImageTooltip => _lang == AppLanguage.es ? 'Eliminar imagen' : _lang == AppLanguage.en ? 'Remove image' : 'Supprimer l\'image';
  static String get selectDate => _lang == AppLanguage.es ? 'Seleccionar fecha y hora' : _lang == AppLanguage.en ? 'Select date and time' : 'Sélectionner la date et l\'heure';
  static String get detailsTitle => _lang == AppLanguage.es ? 'Detalles del Evento' : _lang == AppLanguage.en ? 'Event Details' : 'Détails de l\'événement';
  static String get pageTitle => _lang == AppLanguage.es ? 'Creador de Eventos' : _lang == AppLanguage.en ? 'Event Creator' : 'Créateur d\'événements';
  static String get exclusiveBadge => _lang == AppLanguage.es ? 'EVENTO EXCLUSIVO' : _lang == AppLanguage.en ? 'EXCLUSIVE EVENT' : 'ÉVÉNEMENT EXCLUSIF';
  static String get capacityPoster => _lang == AppLanguage.es ? 'Aforo' : _lang == AppLanguage.en ? 'Capacity' : 'Capacité';
  static String get persons => _lang == AppLanguage.es ? 'personas' : _lang == AppLanguage.en ? 'people' : 'personnes';
}
