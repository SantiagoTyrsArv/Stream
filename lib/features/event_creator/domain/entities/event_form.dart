import 'dart:typed_data';
import 'package:flutter/material.dart';

/// Entidad inmutable que representa un evento.
class EventForm {
  final String title;
  final String description;
  final String location;
  final DateTime? date;
  final int capacity;
  final String category;
  final Color themeColor;
  final Uint8List? imageBytes;

  const EventForm({
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.capacity,
    required this.category,
    required this.themeColor,
    this.imageBytes,
  });

  EventForm copyWith({
    String? title,
    String? description,
    String? location,
    DateTime? date,
    int? capacity,
    String? category,
    Color? themeColor,
    Uint8List? imageBytes,
  }) {
    return EventForm(
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      date: date ?? this.date,
      capacity: capacity ?? this.capacity,
      category: category ?? this.category,
      themeColor: themeColor ?? this.themeColor,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }
}
