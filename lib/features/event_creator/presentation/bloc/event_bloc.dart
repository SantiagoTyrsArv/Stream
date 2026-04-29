import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../domain/entities/event_form.dart';
import '../../domain/usecases/publish_event.dart';
import '../../domain/validators/title_validator.dart';
import '../../domain/validators/description_validator.dart';
import '../../domain/validators/location_validator.dart';
import '../../domain/validators/capacity_validator.dart';
import '../../domain/validators/date_validator.dart';

class EventBloc {
  final PublishEvent _publishEvent;

  EventBloc(this._publishEvent) {
    // Valores por defecto
    _themeColorController.add(Colors.deepPurple);
  }

  // --- Controllers ---
  final _titleController = BehaviorSubject<String>();
  final _descriptionController = BehaviorSubject<String>();
  final _locationController = BehaviorSubject<String>();
  final _capacityController = BehaviorSubject<String>();
  final _dateController = BehaviorSubject<DateTime?>();
  final _themeColorController = BehaviorSubject<Color>();

  // --- Sinks (Inputs) ---
  Function(String) get changeTitle => _titleController.sink.add;
  Function(String) get changeDescription => _descriptionController.sink.add;
  Function(String) get changeLocation => _locationController.sink.add;
  Function(String) get changeCapacity => _capacityController.sink.add;
  Function(DateTime?) get changeDate => _dateController.sink.add;
  Function(Color) get changeThemeColor => _themeColorController.sink.add;

  // --- Streams (Raw for Live Preview) ---
  Stream<String> get rawTitleStream => _titleController.stream;
  Stream<String> get rawDescriptionStream => _descriptionController.stream;
  Stream<String> get rawLocationStream => _locationController.stream;
  Stream<DateTime?> get rawDateStream => _dateController.stream;
  Stream<String> get rawCapacityStream => _capacityController.stream;
  Stream<Color> get themeColorStream => _themeColorController.stream;

  // --- Streams (Validated for Form fields) ---
  Stream<String> get titleStream =>
      _titleController.stream.transform(TitleValidator.transformer);
  Stream<String> get descriptionStream =>
      _descriptionController.stream.transform(DescriptionValidator.transformer);
  Stream<String> get locationStream =>
      _locationController.stream.transform(LocationValidator.transformer);
  Stream<String> get capacityStream =>
      _capacityController.stream.transform(CapacityValidator.transformer);
  Stream<DateTime> get dateStream =>
      _dateController.stream.transform(DateValidator.transformer);

  // --- CombineLatest for Form Validation ---
  Stream<bool> get isFormValid => Rx.combineLatest5(
        titleStream,
        descriptionStream,
        locationStream,
        capacityStream,
        dateStream,
        (t, d, l, c, dt) => true,
      ).onErrorReturn(false);

  // --- Submit ---
  Future<bool> submit() async {
    final form = EventForm(
      title: _titleController.value,
      description: _descriptionController.value,
      location: _locationController.value,
      date: _dateController.value,
      capacity: int.tryParse(_capacityController.value) ?? 0,
      category: 'General', // Simplificado para el ejemplo
      themeColor: _themeColorController.value,
    );
    return await _publishEvent(form);
  }

  void dispose() {
    _titleController.close();
    _descriptionController.close();
    _locationController.close();
    _capacityController.close();
    _dateController.close();
    _themeColorController.close();
  }
}
