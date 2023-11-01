import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrainingsRemoteDataSource {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings')
        .doc(id)
        .delete();
  }

  Future<void> addexercise(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings')
        .add(
      {
        'name': exerciseName,
        'series': series,
        'repeat': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream1() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings1')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete1({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings1')
        .doc(id)
        .delete();
  }

  Future<void> addexercise1(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings1')
        .add(
      {
        'name1': exerciseName,
        'series1': series,
        'repeat1': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream2() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings2')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete2({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings2')
        .doc(id)
        .delete();
  }

  Future<void> addexercise2(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings2')
        .add(
      {
        'name2': exerciseName,
        'series2': series,
        'repeat2': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream3() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings3')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete3({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings3')
        .doc(id)
        .delete();
  }

  Future<void> addexercise3(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings3')
        .add(
      {
        'name3': exerciseName,
        'series3': series,
        'repeat3': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream4() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings4')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete4({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings4')
        .doc(id)
        .delete();
  }

  Future<void> addexercise4(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings4')
        .add(
      {
        'name4': exerciseName,
        'series4': series,
        'repeat4': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream5() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings5')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete5({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings5')
        .doc(id)
        .delete();
  }

  Future<void> addexercise5(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings5')
        .add(
      {
        'name5': exerciseName,
        'series5': series,
        'repeat5': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsStream6() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings6')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> delete6({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings6')
        .doc(id)
        .delete();
  }

  Future<void> addexercise6(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trainings6')
        .add(
      {
        'name6': exerciseName,
        'series6': series,
        'repeat6': repeat,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }
}
