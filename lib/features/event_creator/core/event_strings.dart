import '../../../../core/settings_controller.dart';

class EventStrings {
  static AppLanguage get _lang => SettingsController().language;

  static String _t({
    required String es,
    required String en,
    required String fr,
    required String ru,
    required String zh,
    required String de,
    required String ja,
    required String it,
    required String la,
  }) {
    switch (_lang) {
      case AppLanguage.es: return es;
      case AppLanguage.en: return en;
      case AppLanguage.fr: return fr;
      case AppLanguage.ru: return ru;
      case AppLanguage.zh: return zh;
      case AppLanguage.de: return de;
      case AppLanguage.ja: return ja;
      case AppLanguage.it: return it;
      case AppLanguage.la: return la;
    }
  }

  // General / UI
  static String get pageTitle => _t(
    es: 'Creador de Eventos', en: 'Event Creator', fr: 'Créateur d\'événements',
    ru: 'Создатель Событий', zh: '活动创建者', de: 'Event-Ersteller',
    ja: 'イベント作成者', it: 'Creatore di Eventi', la: 'CREATOR EVENTVVM',
  );
  
  static String get detailsTitle => _t(
    es: 'Detalles del Evento', en: 'Event Details', fr: 'Détails de l\'événement',
    ru: 'Детали События', zh: '活动详情', de: 'Event-Details',
    ja: 'イベントの詳細', it: 'Dettagli dell\'Evento', la: 'SINGVLA EVENTVS',
  );

  // Labels
  static String get titleLabel => _t(
    es: 'Nombre del evento', en: 'Event Name', fr: 'Nom de l\'événement',
    ru: 'Название события', zh: '活动名称', de: 'Event-Name',
    ja: 'イベント名', it: 'Nome dell\'evento', la: 'NOMEN EVENTVS',
  );
  static String get descriptionLabel => _t(
    es: 'Descripción', en: 'Description', fr: 'Description',
    ru: 'Описание', zh: '描述', de: 'Beschreibung',
    ja: '説明', it: 'Descrizione', la: 'DESCRIPTIO',
  );
  static String get locationLabel => _t(
    es: 'Ubicación', en: 'Location', fr: 'Lieu',
    ru: 'Место нахождения', zh: '地点', de: 'Ort',
    ja: '場所', it: 'Posizione', la: 'LOCVS',
  );
  static String get dateLabel => _t(
    es: 'Fecha y hora', en: 'Date and Time', fr: 'Date et heure',
    ru: 'Дата и время', zh: '日期和时间', de: 'Datum und Uhrzeit',
    ja: '日時', it: 'Data e Ora', la: 'DIES ET HORA',
  );
  static String get capacityLabel => _t(
    es: 'Aforo máximo', en: 'Max Capacity', fr: 'Capacité maximale',
    ru: 'Макс. вместимость', zh: '最大容量', de: 'Maximale Kapazität',
    ja: '最大定員', it: 'Capacità Massima', la: 'CAPACITAS MAXIMA',
  );
  static String get categoryLabel => _t(
    es: 'Categoría', en: 'Category', fr: 'Catégorie',
    ru: 'Категория', zh: '类别', de: 'Kategorie',
    ja: 'カテゴリー', it: 'Categoria', la: 'CATEGORIA',
  );
  static String get colorLabel => _t(
    es: 'Color del tema', en: 'Theme Color', fr: 'Couleur du thème',
    ru: 'Цвет темы', zh: '主题颜色', de: 'Themenfarbe',
    ja: 'テーマカラー', it: 'Colore Tema', la: 'COLOR THEMATIS',
  );
  
  // Hints
  static String get titleHint => _t(
    es: 'Ej: Flutter Summit 2025', en: 'Ex: Flutter Summit 2025', fr: 'Ex: Flutter Summit 2025',
    ru: 'Пример: Flutter Summit 2025', zh: '例如：Flutter Summit 2025', de: 'Bsp: Flutter Summit 2025',
    ja: '例：Flutter Summit 2025', it: 'Es: Flutter Summit 2025', la: 'EX: FLVTTER SVMMIT MMXXV',
  );
  static String get descriptionHint => _t(
    es: 'Describe tu evento...', en: 'Describe your event...', fr: 'Décrivez votre événement...',
    ru: 'Опишите ваше событие...', zh: '描述您的活动...', de: 'Beschreiben Sie Ihr Event...',
    ja: 'イベントを説明してください...', it: 'Descrivi il tuo evento...', la: 'DESCRIBE EVENTVM TVVM...',
  );
  static String get locationHint => _t(
    es: 'Ej: Auditorio Central, Bogotá', en: 'Ex: Central Auditorium, Bogota', fr: 'Ex: Auditorium Central, Bogota',
    ru: 'Пример: Центральный зал, Богота', zh: '例如：波哥大中央礼堂', de: 'Bsp: Zentrales Auditorium, Bogota',
    ja: '例：ボゴタ中央講堂', it: 'Es: Auditorium Centrale, Bogota', la: 'EX: AVDITORIVM CENTRALE',
  );
  static String get capacityHint => _t(
    es: 'Ej: 200', en: 'Ex: 200', fr: 'Ex: 200',
    ru: 'Пример: 200', zh: '例如：200', de: 'Bsp: 200',
    ja: '例：200', it: 'Es: 200', la: 'EX: CC',
  );

  // Buttons
  static String get publishBtn => _t(
    es: 'Publicar Evento', en: 'Publish Event', fr: 'Publier l\'événement',
    ru: 'Опубликовать Событие', zh: '发布活动', de: 'Event veröffentlichen',
    ja: 'イベントを公開', it: 'Pubblica Evento', la: 'PVBLICA EVENTVM',
  );
  static String get publishing => _t(
    es: 'Publicando...', en: 'Publishing...', fr: 'Publication...',
    ru: 'Публикация...', zh: '发布中...', de: 'Veröffentlichen...',
    ja: '公開中...', it: 'Pubblicazione...', la: 'PVBLICANDO...',
  );
  static String get selectDate => _t(
    es: 'Seleccionar fecha y hora', en: 'Select date and time', fr: 'Sélectionner la date et l\'heure',
    ru: 'Выберите дату и время', zh: '选择日期和时间', de: 'Datum und Uhrzeit auswählen',
    ja: '日時を選択', it: 'Seleziona data e ora', la: 'SELIGE DIEM ET HORAM',
  );
  static String get addImage => _t(
    es: 'Añadir imagen de fondo', en: 'Add background image', fr: 'Ajouter une image de fond',
    ru: 'Добавить фоновое изображение', zh: '添加背景图片', de: 'Hintergrundbild hinzufügen',
    ja: '背景画像を追加', it: 'Aggiungi immagine di sfondo', la: 'ADDE IMAGINEM',
  );
  static String get changeImage => _t(
    es: 'Cambiar imagen', en: 'Change image', fr: 'Changer l\'image',
    ru: 'Изменить изображение', zh: '更改图片', de: 'Bild ändern',
    ja: '画像を変更', it: 'Cambia immagine', la: 'MVTA IMAGINEM',
  );
  static String get removeImageTooltip => _t(
    es: 'Eliminar imagen', en: 'Remove image', fr: 'Supprimer l\'image',
    ru: 'Удалить изображение', zh: '移除图片', de: 'Bild entfernen',
    ja: '画像を削除', it: 'Rimuovi immagine', la: 'DELE IMAGINEM',
  );

  // Errors
  static String get titleEmpty => _t(
    es: 'El nombre es obligatorio', en: 'Name is required', fr: 'Le nom est obligatoire',
    ru: 'Имя обязательно', zh: '名称是必填项', de: 'Name ist erforderlich',
    ja: '名前は必須です', it: 'Il nome è obbligatorio', la: 'NOMEN REQVIRITVR',
  );
  static String get titleShort => _t(
    es: 'Mínimo 5 caracteres', en: 'Minimum 5 characters', fr: 'Minimum 5 caractères',
    ru: 'Минимум 5 символов', zh: '最少5个字符', de: 'Mindestens 5 Zeichen',
    ja: '5文字以上', it: 'Minimo 5 caratteri', la: 'MINIMVM V LITTERAE',
  );
  static String get titleLong => _t(
    es: 'Máximo 60 caracteres', en: 'Maximum 60 characters', fr: 'Maximum 60 caractères',
    ru: 'Максимум 60 символов', zh: '最多60个字符', de: 'Maximal 60 Zeichen',
    ja: '最大60文字', it: 'Massimo 60 caratteri', la: 'MAXIMVM LX LITTERAE',
  );
  static String get descEmpty => _t(
    es: 'Agrega una descripción', en: 'Add a description', fr: 'Ajoutez une description',
    ru: 'Добавьте описание', zh: '添加描述', de: 'Fügen Sie eine Beschreibung hinzu',
    ja: '説明を追加してください', it: 'Aggiungi una descrizione', la: 'ADDE DESCRIPTIONEM',
  );
  static String get descShort => _t(
    es: 'Mínimo 20 caracteres', en: 'Minimum 20 characters', fr: 'Minimum 20 caractères',
    ru: 'Минимум 20 символов', zh: '最少20个字符', de: 'Mindestens 20 Zeichen',
    ja: '20文字以上', it: 'Minimo 20 caratteri', la: 'MINIMVM XX LITTERAE',
  );
  static String get locationEmpty => _t(
    es: 'La ubicación es obligatoria', en: 'Location is required', fr: 'Le lieu est obligatoire',
    ru: 'Местоположение обязательно', zh: '地点是必填项', de: 'Ort ist erforderlich',
    ja: '場所は必須です', it: 'La posizione è obbligatoria', la: 'LOCVS REQVIRITVR',
  );
  static String get locationShort => _t(
    es: 'Mínimo 5 caracteres', en: 'Minimum 5 characters', fr: 'Minimum 5 caractères',
    ru: 'Минимум 5 символов', zh: '最少5个字符', de: 'Mindestens 5 Zeichen',
    ja: '5文字以上', it: 'Minimo 5 caratteri', la: 'MINIMVM V LITTERAE',
  );
  static String get dateEmpty => _t(
    es: 'Selecciona la fecha', en: 'Select date', fr: 'Sélectionnez la date',
    ru: 'Выберите дату', zh: '选择日期', de: 'Datum auswählen',
    ja: '日付を選択', it: 'Seleziona la data', la: 'SELIGE DIEM',
  );
  static String get datePast => _t(
    es: 'La fecha debe ser futura', en: 'Date must be future', fr: 'La date doit être future',
    ru: 'Дата должна быть в будущем', zh: '日期必须是将来的时间', de: 'Datum muss in der Zukunft liegen',
    ja: '日付は未来でなければなりません', it: 'La data deve essere futura', la: 'DIES FVTVRVS ESSE DEBET',
  );
  static String get capacityEmpty => _t(
    es: 'Ingresa el aforo', en: 'Enter capacity', fr: 'Entrez la capacité',
    ru: 'Введите вместимость', zh: '输入容量', de: 'Kapazität eingeben',
    ja: '定員を入力', it: 'Inserisci la capacità', la: 'INSERE CAPACITATEM',
  );
  static String get capacityInvalid => _t(
    es: 'Entre 1 y 100,000', en: 'Between 1 and 100,000', fr: 'Entre 1 et 100 000',
    ru: 'От 1 до 100 000', zh: '1到100,000之间', de: 'Zwischen 1 und 100.000',
    ja: '1〜100,000の間', it: 'Tra 1 e 100.000', la: 'INTER I ET C.000',
  );

  // Success
  static String get successTitle => _t(
    es: '¡Evento creado!', en: 'Event created!', fr: 'Événement créé !',
    ru: 'Событие создано!', zh: '活动已创建！', de: 'Event erstellt!',
    ja: 'イベント作成！', it: 'Evento creato!', la: 'EVENTVS CREATVS!',
  );
  static String get successSubtitle => _t(
    es: 'Tu evento se publicó exitosamente.', en: 'Event published successfully.', fr: 'Événement publié avec succès.',
    ru: 'Событие успешно опубликовано.', zh: '活动发布成功。', de: 'Event erfolgreich veröffentlicht.',
    ja: 'イベントが正常に公開されました。', it: 'Evento pubblicato con successo.', la: 'EVENTVS FELICITER PVBLICATVS EST.',
  );
  static String get backBtn => _t(
    es: 'Crear otro', en: 'Create another', fr: 'Créer un autre',
    ru: 'Создать еще', zh: '创建另一个', de: 'Weiteres erstellen',
    ja: '別のものを作成', it: 'Crea un altro', la: 'CREA ALIVD',
  );

  // Poster placeholders
  static String get posterTitle => _t(
    es: 'Nombre del evento', en: 'Event Name', fr: 'Nom de l\'événement',
    ru: 'Название события', zh: '活动名称', de: 'Event-Name',
    ja: 'イベント名', it: 'Nome dell\'evento', la: 'NOMEN EVENTVS',
  );
  static String get posterLocation => _t(
    es: 'Ubicación del evento', en: 'Event Location', fr: 'Lieu de l\'événement',
    ru: 'Место проведения', zh: '活动地点', de: 'Event-Ort',
    ja: 'イベントの場所', it: 'Luogo dell\'evento', la: 'LOCVS EVENTVS',
  );
  static String get posterDate => _t(
    es: 'Fecha por definir', en: 'Date TBA', fr: 'Date à définir',
    ru: 'Дата будет объявлена', zh: '日期待定', de: 'Datum TBA',
    ja: '後日発表', it: 'Data da definire', la: 'DIES INCERTVS',
  );
  static String get posterCapacity => _t(
    es: '—', en: '—', fr: '—',
    ru: '—', zh: '—', de: '—',
    ja: '—', it: '—', la: '—',
  );
  static String get exclusiveBadge => _t(
    es: 'EVENTO EXCLUSIVO', en: 'EXCLUSIVE EVENT', fr: 'ÉVÉNEMENT EXCLUSIF',
    ru: 'ЭКСКЛЮЗИВНОЕ СОБЫТИЕ', zh: '独家活动', de: 'EXKLUSIVES EVENT',
    ja: '限定イベント', it: 'EVENTO ESCLUSIVO', la: 'EVENTVS EXCLVSIVVS',
  );
  static String get capacityPoster => _t(
    es: 'Aforo', en: 'Capacity', fr: 'Capacité',
    ru: 'Вместимость', zh: '容量', de: 'Kapazität',
    ja: '定員', it: 'Capacità', la: 'CAPACITAS',
  );
  static String get persons => _t(
    es: 'personas', en: 'people', fr: 'personnes',
    ru: 'человек', zh: '人', de: 'Personen',
    ja: '人', it: 'persone', la: 'populi',
  );
}
