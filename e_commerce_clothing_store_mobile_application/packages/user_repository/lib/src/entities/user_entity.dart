// class MyUserEntity {
//   String userId;
//   String email;
//   String name;
//   bool hasActiveCart;

//   MyUserEntity({
//     required this.userId,
//     required this.email,
//     required this.name,
//     required this.hasActiveCart,
//   });
//   Map<String, Object?> toDocument() {
//     return {
//       'userId': userId,
//       'email': email,
//       'name': name,
//       'hasActiveCart': hasActiveCart,
//     };
//   }

//   static MyUserEntity fromDocument(Map<String, dynamic> doc) {
//     return MyUserEntity(
//         userId: doc['userId'],
//         email: doc['email'],
//         name: doc['name'],
//         hasActiveCart: doc['hasActiveCart']
//     );
//   }
// }


// // export 'user_entity.dart';

// // import 'package:user_repository/src/models/user.dart';

// class MyUserEntity {
//   String userId;
//   String email;
//   // String password;
//   String name;
//   bool hasActiveCart;

//   MyUserEntity({
//     required this.userId,
//     required this.email,
//     required this.name,
//     required this.hasActiveCart,
//   });

//   Map<String, Object?> toDocument() {
//     return {
//       'userId': userId,
//       'email': email,
//       'name': name,
//       'hasActiveCart': hasActiveCart,
//     };
//   }

//   static MyUserEntity fromDocument(Map<String, dynamic> doc) {
//     return MyUserEntity(
//       userId: doc['userId'],
//       email: doc['email'],
//       name: doc['name'],
//       hasActiveCart: doc['hasActiveCart'],
//     );
//   }
// }




class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'], 
      email: doc['email'], 
      name: doc['name'], 
      hasActiveCart: doc['hasActiveCart'],
    );
  }
}