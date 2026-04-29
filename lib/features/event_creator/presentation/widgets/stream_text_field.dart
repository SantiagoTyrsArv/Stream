import 'package:flutter/material.dart';

/// Widget reutilizable que conecta un [TextField] a un [Stream].
/// 
/// Usa [StreamBuilder] para mostrar/ocultar el error dinámicamente
/// sin necesidad de [setState]. El sink recibe el input del usuario.
class StreamTextField extends StatefulWidget {
  final Stream<String> stream;
  final Function(String) onChanged;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;

  const StreamTextField({
    super.key,
    required this.stream,
    required this.onChanged,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<StreamTextField> createState() => _StreamTextFieldState();
}

class _StreamTextFieldState extends State<StreamTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.obscureText;

    return StreamBuilder<String>(
      stream: widget.stream,
      builder: (context, snapshot) {
        final hasError = snapshot.hasError;
        final hasData = snapshot.hasData;
        final errorText = hasError ? snapshot.error.toString() : null;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: TextField(
            onChanged: widget.onChanged,
            obscureText: isPassword && _obscure,
            keyboardType: widget.keyboardType,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
              errorText: errorText,
              prefixIcon: Icon(widget.icon),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white38,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : hasData
                      ? const Icon(Icons.check_circle, color: Color(0xFF4CAF50))
                      : null,
            ),
          ),
        );
      },
    );
  }
}
