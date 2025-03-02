import 'package:flutter/material.dart';
import 'package:inventory_app/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProviders extends ChangeNotifier {
  AuthProviders() {
    _isLoading = false;
    email = '';
    password = '';
  }

  final formKey = GlobalKey<FormState>();
  final AuthServices _authServices = AuthServices();

  late bool _isLoading;
  bool get isLoading => _isLoading;
  set isLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  late String email = '';
  late String password = '';

  Future<bool> login() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      final response = await _authServices.login(email, password);

      if (response.sukses) {
        // simpan data user login
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('login', true);
      }

      isLoading = false;
      return response.sukses;
    }
    return false;
  }
}
