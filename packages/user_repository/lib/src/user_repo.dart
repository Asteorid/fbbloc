import 'models/models.dart';

abstract class UserReporitory {
  Stream<User?> get User;

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser);

  Future<void> signIn(String email, String password);
}
