import 'package:firebase_auth/firebase_auth.dart';
import 'package:warranty_saver/core/domain/repository/local_repository.dart';
import 'package:warranty_saver/feature/login_page/domain/repository/login_page_repository.dart';

class LoginRepositoryImpl implements LoginPageRepository {
  LoginRepositoryImpl(this._auth, this._localRepository);

  final FirebaseAuth _auth;
  final LocalRepository _localRepository;

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    await _localRepository.saveUser(email);
    await _localRepository.setDeviceRemembered(remembered: rememberMe);
    return userCredential;
  }
}
