import 'package:firebase_auth/firebase_auth.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/repository/login_page_repository.dart';

class LoginRepositoryImpl implements LoginPageRepository {
  LoginRepositoryImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  Future<UserCredential> login({required String email, required String password}) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
