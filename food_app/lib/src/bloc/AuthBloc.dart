import 'package:food_app/src/repository/AuthRepo.dart';
import 'package:food_app/src/ui/main/Login.dart';

class AuthBloc {
  final _authRepo = AuthRepo();

  getValidateEmail(String email) {
    return _authRepo.getValidateEmail(email);
  }

  login(String email, String password) {
    return _authRepo.login(email, password);
  }

  register(String nama, String no_telp, String email, String password) {
    return _authRepo.register(nama, no_telp, email, password);
  }

  simpanPassword(String id, String password) {
    return _authRepo.simpanPassword(id, password);
  }
}

final authBloc = AuthBloc();
