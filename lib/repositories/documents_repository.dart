import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:this_is_your_training/models/document_model.dart';

class DocumentsRepository {
  Stream<List<DocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('trainings')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name'],
            series: doc['series'],
            repeat: doc['repeat'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('trainings').doc(id).delete();
  }

  Future<void> addexercise(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings').add(
      {
        'name': exerciseName,
        'series': series,
        'repeat': repeat,
      },
    );
  }

  Stream<List<DocumentModel>> getDocumentsStream1() {
    return FirebaseFirestore.instance
        .collection('trainings1')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name1'],
            series: doc['series1'],
            repeat: doc['repeat1'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete1({required String id}) {
    return FirebaseFirestore.instance.collection('trainings1').doc(id).delete();
  }

  Future<void> addexercise1(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings1').add(
      {
        'name1': exerciseName,
        'series1': series,
        'repeat1': repeat,
      },
    );
  }

  Stream<List<DocumentModel>> getDocumentsStream2() {
    return FirebaseFirestore.instance
        .collection('trainings2')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name2'],
            series: doc['series2'],
            repeat: doc['repeat2'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete2({required String id}) {
    return FirebaseFirestore.instance.collection('trainings2').doc(id).delete();
  }

  Future<void> addexercise2(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings2').add(
      {
        'name2': exerciseName,
        'series2': series,
        'repeat2': repeat,
      },
    );
  }

  Stream<List<DocumentModel>> getDocumentsStream3() {
    return FirebaseFirestore.instance
        .collection('trainings3')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name3'],
            series: doc['series3'],
            repeat: doc['repeat3'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete3({required String id}) {
    return FirebaseFirestore.instance.collection('trainings3').doc(id).delete();
  }

  Future<void> addexercise3(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings3').add(
      {
        'name3': exerciseName,
        'series3': series,
        'repeat3': repeat,
      },
    );
  }

  Stream<List<DocumentModel>> getDocumentsStream4() {
    return FirebaseFirestore.instance
        .collection('trainings4')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name4'],
            series: doc['series4'],
            repeat: doc['repeat4'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete4({required String id}) {
    return FirebaseFirestore.instance.collection('trainings4').doc(id).delete();
  }

  Future<void> addexercise4(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings4').add(
      {
        'name4': exerciseName,
        'series4': series,
        'repeat4': repeat,
      },
    );
  }

  Stream<List<DocumentModel>> getDocumentsStream5() {
    return FirebaseFirestore.instance
        .collection('trainings5')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name5'],
            series: doc['series5'],
            repeat: doc['repeat5'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete5({required String id}) {
    return FirebaseFirestore.instance.collection('trainings5').doc(id).delete();
  }

  Future<void> addexercise5(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings5').add(
      {
        'name5': exerciseName,
        'series5': series,
        'repeat5': repeat,
      },
    );
  }

  Stream<List<DocumentModel>> getDocumentsStream6() {
    return FirebaseFirestore.instance
        .collection('trainings6')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return DocumentModel(
            id: doc.id,
            name: doc['name6'],
            series: doc['series6'],
            repeat: doc['repeat6'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete6({required String id}) {
    return FirebaseFirestore.instance.collection('trainings6').doc(id).delete();
  }

  Future<void> addexercise6(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await FirebaseFirestore.instance.collection('trainings6').add(
      {
        'name6': exerciseName,
        'series6': series,
        'repeat6': repeat,
      },
    );
  }
}