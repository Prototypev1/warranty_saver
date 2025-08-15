import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warranty_saver/feature/register_page/domain/repository/register_page_repository.dart';

class RegisterPageRepositoryImpl implements RegisterPageRepository {
  RegisterPageRepositoryImpl(this._auth, this._firestore);
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<UserCredential> registerUser({required String email, required String password}) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final uid = cred.user?.uid;
    if (uid == null) {
      throw Exception('User ID i missing');
    }
    await _firestore.collection('users').doc(uid).set({'userId': uid, 'email': email});
    return cred;
  }
}
