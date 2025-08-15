import 'package:firebase_auth/firebase_auth.dart';
import 'package:warranty_saver/feature/register_page/domain/repository/register_page_repository.dart';

class RegisterPageRepositoryImpl implements RegisterPageRepository {
  RegisterPageRepositoryImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  Future<UserCredential> registerUser({required String email, required String password}) async {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
