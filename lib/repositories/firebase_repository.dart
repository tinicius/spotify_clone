import 'package:firebase_core/firebase_core.dart';
import 'package:spotify_clone/services/firebase_service.dart';

class FirebaseRepository {
  final FirebaseService _service = FirebaseService();

  Future<void> initialize(FirebaseOptions options) =>
      _service.initialize(options);
}
