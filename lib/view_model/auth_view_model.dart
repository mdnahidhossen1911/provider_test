import 'package:flutter/cupertino.dart';
import 'package:provider_test/repository/auth_repository.dart';
import 'package:provider_test/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  AuthRepository _authRepository = AuthRepository();
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
}
