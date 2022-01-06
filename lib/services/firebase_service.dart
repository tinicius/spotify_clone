import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  Future<void> initialize(FirebaseOptions options) async {
    await Firebase.initializeApp(
      options: options,
    );
  }
}
