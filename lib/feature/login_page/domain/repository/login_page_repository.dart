import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginPageRepository {
  Future<UserCredential> login({required String email, required String password, required bool rememberMe});
}
