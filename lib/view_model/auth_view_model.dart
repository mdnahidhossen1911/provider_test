import 'package:flutter/cupertino.dart';
import 'package:provider_test/repository/auth_repository.dart';
import 'package:provider_test/service_locator.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:provider_test/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context, dynamic data) async {
    isLoading = true;
    _authRepository
        .loginApi(data)
        .then((value) {
          isLoading = false;
          debugPrint(value.toString());
          Utils.showToast(value['msg'].toString());
        })
        .onError((error, stackTrace) {
          isLoading = false;
          debugPrint(error.toString());
          Utils.showFlushBar(context, error.toString());
        });
  }

  Future<void> signUp(BuildContext context, dynamic data) async {
    isLoading = true;
    _authRepository
        .registerApi(data)
        .then((value) {
          isLoading = false;
          Utils.showToast('Account created successfully! Please login.');
          Navigator.pushNamed(context, RoutesName.login);
        })
        .onError((error, stackTrace) {
          isLoading = false;
          debugPrint(error.toString());
          Utils.showFlushBar(context, error.toString());
        });
  }
}
