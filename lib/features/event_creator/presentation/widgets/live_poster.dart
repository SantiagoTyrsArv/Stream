import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../core/event_strings.dart';
import '../bloc/event_bloc.dart';

class LivePoster extends StatelessWidget {
  final EventBloc bloc;

  const LivePoster({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color>(
      stream: bloc.themeColorStream,
      initialData: Colors.deepPurple,
      builder: (context, colorSnapshot) {
        final themeColor = colorSnapshot.data!;

        return StreamBuilder<Uint8List?>(
          stream: bloc.imageStream,
          builder: (context, imageSnapshot) {
            final imageBytes = imageSnapshot.data;

            return Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: imageBytes != null
                    ? DecorationImage(
                        image: MemoryImage(imageBytes),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          themeColor.withOpacity(0.6),
                          BlendMode.srcOver,
                        ),
                      )
                    : null,
                gradient: imageBytes == null
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          themeColor.withOpacity(0.8),
                          themeColor.withOpacity(0.3),
                          const Color(0xFF1C1C2E),
                        ],
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: themeColor.withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border.all(
                  color: themeColor.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
          child: Stack(
            children: [
              // Elementos decorativos de fondo
              Positioned(
                top: -50,
                right: -50,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: themeColor.withOpacity(0.2),
                ),
              ),
              Positioned(
                bottom: -20,
                left: -20,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: themeColor.withOpacity(0.2),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge VIP/Categoría
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: themeColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: themeColor),
                      ),
                      child: Text(
                        EventStrings.exclusiveBadge,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const Spacer(),

                    // Título dinámico
                    StreamBuilder<String>(
                      stream: bloc.rawTitleStream,
                      builder: (context, snapshot) {
                        final text = snapshot.data?.isNotEmpty == true
                            ? snapshot.data!
                            : EventStrings.posterTitle;
                        return Text(
                          text.toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            height: 1.1,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),

                    // Fila de detalles: Fecha y Ubicación
                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailItem(
                            icon: Icons.calendar_month_rounded,
                            stream: bloc.rawDateStream.map((date) => date != null
                                ? DateFormat('dd MMM yyyy\nHH:mm').format(date)
                                : EventStrings.posterDate),
                            themeColor: themeColor,
                          ),
                        ),
                        Expanded(
                          child: _buildDetailItem(
                            icon: Icons.location_on_rounded,
                            stream: bloc.rawLocationStream.map((loc) =>
                                loc.isNotEmpty ? loc : EventStrings.posterLocation),
                            themeColor: themeColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    
                    // Aforo
                    _buildDetailItem(
                      icon: Icons.people_alt_rounded,
                      stream: bloc.rawCapacityStream.map((cap) =>
                          cap.isNotEmpty ? '${EventStrings.capacityPoster}: $cap ${EventStrings.persons}' : '${EventStrings.capacityPoster}: ${EventStrings.posterCapacity}'),
                      themeColor: themeColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
          },
        );
      },
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required Stream<String> stream,
    required Color themeColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: themeColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StreamBuilder<String>(
            stream: stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.white70,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
      ],
    );
  }
}
