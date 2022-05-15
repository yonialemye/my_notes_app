import 'package:my_notes_app/services/auth/auth_provider.dart';
import 'package:my_notes_app/services/auth/auth_user.dart';

class AuthServices implements AuthProvider {
  final AuthProvider authProvider;

  AuthServices(this.authProvider);

  @override
  Future<AuthUser> createUser({required String email, required String password}) {
    return authProvider.createUser(email: email, password: password);
  }

  @override
  AuthUser? get currentUser {
    return authProvider.currentUser;
  }

  @override
  Future<AuthUser> login({required String email, required String password}) {
    return authProvider.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return authProvider.logout();
  }

  @override
  Future<void> sendEmailVerification() {
    return authProvider.sendEmailVerification();
  }
}
