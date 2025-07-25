import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_panela/features/auth/domin/entities/authenticated_user.dart';
import 'package:registro_panela/features/auth/domin/enums/user_role.dart';
import 'package:registro_panela/features/auth/domin/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<AuthenticatedUser> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user?.uid;
    if (uid == null) throw Exception('Error al obtener UID del usuario');

    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) throw Exception('Usuario no encontrado en Firestore');

    final data = doc.data()!;
    final role = UserRole.values.firstWhere(
      (user) => user.name == data['role'],
      orElse: () => throw Exception('Rol no reconocido: ${data['role']}'),
    );
    return AuthenticatedUser(
      id: uid,
      name: data['name'],
      email: data['email'],
      role: role,
      token: await credential.user!.getIdToken() ?? '',
    );
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
