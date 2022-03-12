// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import '../../domain/api_client/api_client.dart';
import '../../domain/data_providers/session_data_provider.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMassege;
  String? get errorMassege => _errorMassege;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMassege = 'Введіть логін і пароль';
      notifyListeners();
      return;
    }

    _errorMassege = null;
    _isAuthProgress = true;
    notifyListeners();

    String? sessionId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } catch (e) {
      _errorMassege = 'Наперавильний логін або пароль';
    }
    _isAuthProgress = false;
    if (_errorMassege != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMassege = 'Невідома помилка, спробуйте ще раз';
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSessionId(sessionId);
    unawaited(Navigator.of(context).pushNamed('/main_screen'));
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthProvider({
    Key? key,
    required this.model,
    required this.child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  final Widget child;

  static AuthProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
