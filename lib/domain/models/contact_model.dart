import 'user_model.dart';

class Contact {
  final String uid;
  final String username;
  final String email;

  Contact({required this.uid, required this.username, required this.email});

  factory Contact.fromUser(User user) {
    return Contact(uid: user.uid, username: user.username, email: user.email);
  }
}
