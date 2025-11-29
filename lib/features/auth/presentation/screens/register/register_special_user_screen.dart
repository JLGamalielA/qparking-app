/**
 * Company: CETAM
 * Project: QParking
 * File: register_normal_user_screen.dart
 * Created on: 15/11/2025
 * Created by: Daniel Yair Mendoza Alvarez
 * Approved by: Daniel Yair Mendoza Alvarez
 *
 * Changelog:
 * - ID: 1 | Modified on: 25/11/2025 |
 * Modified by: Gamaliel Alejandro Juarez |
 * Description: UI standardization  (Forms & Layout) |
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/themes/app_theme.dart';

final specialRegisterLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);

class RegisterSpecialUserScreen extends ConsumerStatefulWidget {
  const RegisterSpecialUserScreen({super.key});

  @override
  ConsumerState<RegisterSpecialUserScreen> createState() => _RegisterSpecialUserScreenState();
}

class _RegisterSpecialUserScreenState extends ConsumerState<RegisterSpecialUserScreen> {
  // Business Controllers
  final _companyNameCtrl = TextEditingController();
  final _rfcCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    _companyNameCtrl.dispose();
    _rfcCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    if (!_formKey.currentState!.validate()) return;
    ref.read(specialRegisterLoadingProvider.notifier).state = true;
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    ref.read(specialRegisterLoadingProvider.notifier).state = false;
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(specialRegisterLoadingProvider);

    return Scaffold(
      backgroundColor: AppTheme.gray50,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Registro Empresarial',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppTheme.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Usuario Especial',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ingresa los datos de la empresa o convenio.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: AppTheme.gray600),
                    ),
                    const SizedBox(height: 32),

                    // Input: Company Name
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: _companyNameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Razón Social / Empresa',
                          prefixIcon: Icon(Icons.business),
                        ),
                        validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Input: RFC / Tax ID
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: _rfcCtrl,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          labelText: 'RFC / Identificación Fiscal',
                          prefixIcon: Icon(Icons.badge_outlined),
                        ),
                        validator: (v) => v!.length < 12 ? 'RFC incompleto' : null,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Input: Contact Email
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Correo de Contacto',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (v) => v!.contains('@') ? null : 'Correo inválido',
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Input: Password
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: _passCtrl,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Contraseña de Acceso',
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        validator: (v) => v!.length < 6 ? 'Mínimo 6 caracteres' : null,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Action Button
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _onRegister,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(color: AppTheme.white)
                            : const Text('Registrar Empresa'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}