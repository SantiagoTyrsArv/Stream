import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../core/event_strings.dart';
import '../../data/datasources/event_remote_datasource.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../domain/usecases/publish_event.dart';
import '../bloc/event_bloc.dart';
import '../widgets/live_poster.dart';

import '../widgets/stream_text_field.dart';
class EventCreatorPage extends StatefulWidget {
  const EventCreatorPage({super.key});

  @override
  State<EventCreatorPage> createState() => _EventCreatorPageState();
}

class _EventCreatorPageState extends State<EventCreatorPage> {
  late final EventBloc _bloc;
  bool _isLoading = false;

  final List<Color> _themeColors = [
    Colors.deepPurple,
    const Color(0xFFE91E63), // Pink
    const Color(0xFFFF5722), // Deep Orange
    const Color(0xFF00BCD4), // Cyan
    const Color(0xFF4CAF50), // Green
  ];

  @override
  void initState() {
    super.initState();
    final dataSource = EventRemoteDataSource();
    final repository = EventRepositoryImpl(dataSource);
    final publishEvent = PublishEvent(repository);
    _bloc = EventBloc(publishEvent);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF6C63FF),
              onPrimary: Colors.white,
              surface: Color(0xFF1C1C2E),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && mounted) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _bloc.changeDate(finalDateTime);
      }
    }
  }

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    try {
      final success = await _bloc.submit();
      if (mounted && success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(EventStrings.successTitle),
            backgroundColor: Colors.green,
          ),
        );
        // Aquí podrías navegar a una pantalla de éxito
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determinar si es una pantalla ancha (Web/Desktop) o móvil
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Creador de Eventos',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: _buildForm()),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: LivePoster(bloc: _bloc),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: LivePoster(bloc: _bloc),
                    ),
                    _buildForm(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detalles del Evento',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          
          StreamTextField(
            stream: _bloc.titleStream,
            onChanged: _bloc.changeTitle,
            label: EventStrings.titleLabel,
            hint: EventStrings.titleHint,
            icon: Icons.title_rounded,
          ),
          const SizedBox(height: 16),
          
          // Custom StreamBuilder for Description (multiline)
          StreamBuilder<String>(
            stream: _bloc.descriptionStream,
            builder: (context, snapshot) {
              return TextField(
                onChanged: _bloc.changeDescription,
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: EventStrings.descriptionLabel,
                  hintText: EventStrings.descriptionHint,
                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                  alignLabelWithHint: true,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                flex: 2,
                child: StreamTextField(
                  stream: _bloc.locationStream,
                  onChanged: _bloc.changeLocation,
                  label: EventStrings.locationLabel,
                  hint: EventStrings.locationHint,
                  icon: Icons.location_on_outlined,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: StreamTextField(
                  stream: _bloc.capacityStream,
                  onChanged: _bloc.changeCapacity,
                  label: EventStrings.capacityLabel,
                  hint: EventStrings.capacityHint,
                  icon: Icons.people_outline,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Date Picker Reactivo
          StreamBuilder<DateTime?>(
            stream: _bloc.rawDateStream,
            builder: (context, snapshot) {
              final date = snapshot.data;
              return StreamBuilder<DateTime>(
                stream: _bloc.dateStream,
                builder: (context, validationSnapshot) {
                   return InkWell(
                    onTap: () => _selectDate(context),
                    borderRadius: BorderRadius.circular(14),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: EventStrings.dateLabel,
                        errorText: validationSnapshot.hasError ? validationSnapshot.error.toString() : null,
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                      ),
                      child: Text(
                        date != null
                            ? DateFormat('dd/MM/yyyy HH:mm').format(date)
                            : 'Seleccionar fecha y hora',
                        style: TextStyle(
                          color: date != null ? Colors.white : const Color(0xFF55556A),
                        ),
                      ),
                    ),
                  );
                }
              );
            },
          ),
          
          const SizedBox(height: 24),
          
          Text(
            EventStrings.colorLabel,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9090B0),
            ),
          ),
          const SizedBox(height: 12),
          
          // Selector de color reactivo
          StreamBuilder<Color>(
            stream: _bloc.themeColorStream,
            initialData: _themeColors.first,
            builder: (context, snapshot) {
              final selectedColor = snapshot.data!;
              return Row(
                children: _themeColors.map((color) {
                  final isSelected = color == selectedColor;
                  return GestureDetector(
                    onTap: () => _bloc.changeThemeColor(color),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: Colors.white, width: 3)
                            : null,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: color.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          
          const SizedBox(height: 40),
          
          // Submit Button
          StreamBuilder<bool>(
            stream: _bloc.isFormValid,
            builder: (context, snapshot) {
              final isValid = snapshot.data == true;
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isValid ? 1.0 : 0.4,
                child: ElevatedButton(
                  onPressed: (isValid && !_isLoading) ? _onSubmit : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(EventStrings.publishBtn),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
