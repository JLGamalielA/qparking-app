import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qparking/core/constants/constants_exports.dart';

class CreateSpecialUserRequest extends StatelessWidget {
  const CreateSpecialUserRequest({super.key});

  // Etiqueta de sección
  Text _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: SECONDARY_COLOR,
      ),
    );
  }

  // Decoración estándar para inputs
  InputDecoration _input({String? hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: SECONDARY_COLOR),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: SECONDARY_COLOR, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: SECONDARY_COLOR, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: PRIMARY_COLOR, width: 1.2),
      ),
    );
  }

  // Campo "select" visual sin iconos internos
  Widget _fakeSelect(String placeholder) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SECONDARY_COLOR, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        placeholder,
        style: const TextStyle(
          fontSize: 14,
          color: SECONDARY_COLOR,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        backgroundColor: WHITE_COLOR,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Solicitud de Proveedor',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: SECONDARY_COLOR,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _sectionLabel('Placas del Carro'),
              const SizedBox(height: 8),
              SizedBox(
                height: 60,
                child: TextField(
                  decoration: _input(hint: 'Ej: ABC-123'),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 24),

              _sectionLabel('Tipo de usuario'),
              const SizedBox(height: 8),
              _fakeSelect('Seleccione un tipo'),
              const SizedBox(height: 24),

              _sectionLabel('Descripción de la solicitud'),
              const SizedBox(height: 8),
              SizedBox(
                height: 140,
                child: TextField(
                  decoration: _input(hint: 'Añada una breve descripción...'),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
              const SizedBox(height: 24),

              _sectionLabel('Seleccionar Estacionamiento'),
              const SizedBox(height: 8),
              _fakeSelect('Seleccione una opción'),
              const SizedBox(height: 48),

              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    foregroundColor: WHITE_COLOR,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    context.go('/home');
                  },
                  child: const Text(
                    'Enviar Solicitud',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
