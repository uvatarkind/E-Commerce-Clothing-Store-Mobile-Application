// // import 'package:user_repository/src/models/models.dart';
// import 'package:user_repository/src/models/user.dart';

// abstract class UserRepository{
//   Stream<MyUser?> get user;

//   Future<MyUser> signUp(MyUser myUser, String password);

//   Future<void> setUserData(MyUser user);

//   Future<void> signIn(String email, String password);

//   Future<void> logOut();
// }


import 'package:user_repository/src/models/user.dart';
abstract class UserRepository {
  Stream<MyUser?> get user;

	Future<MyUser> signUp(MyUser myUser, String password);

	Future<void> setUserData(MyUser user);

	Future<void> signIn(String email, String password);

	Future<void> logOut();
}