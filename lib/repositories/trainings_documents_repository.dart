import 'package:this_is_your_training/data/forum_data_sources/training_remote_data_source.dart';
import 'package:this_is_your_training/models/training_model.dart';

class TrainingsDocumentsRepository {
  TrainingsDocumentsRepository(this._trainingsDataSource);
  final TrainingsRemoteDataSource _trainingsDataSource;

  Stream<List<TrainingModel>> getDocumentsStream() {
    return _trainingsDataSource.getDocumentsStream().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name'],
            series: doc['series'],
            repeat: doc['repeat'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) async {
    await _trainingsDataSource.delete(id: id);
  }

  Future<void> addexercise(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise(exerciseName, series, repeat);
  }

  Stream<List<TrainingModel>> getDocumentsStream1() {
    return _trainingsDataSource.getDocumentsStream1().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name1'],
            series: doc['series1'],
            repeat: doc['repeat1'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete1({required String id}) async {
    await _trainingsDataSource.delete1(id: id);
  }

  Future<void> addexercise1(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise1(exerciseName, series, repeat);
  }

  Stream<List<TrainingModel>> getDocumentsStream2() {
    return _trainingsDataSource.getDocumentsStream2().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name2'],
            series: doc['series2'],
            repeat: doc['repeat2'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete2({required String id}) async {
    await _trainingsDataSource.delete2(id: id);
  }

  Future<void> addexercise2(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise2(exerciseName, series, repeat);
  }

  Stream<List<TrainingModel>> getDocumentsStream3() {
    return _trainingsDataSource.getDocumentsStream3().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name3'],
            series: doc['series3'],
            repeat: doc['repeat3'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete3({required String id}) async {
    await _trainingsDataSource.delete3(id: id);
  }

  Future<void> addexercise3(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise3(exerciseName, series, repeat);
  }

  Stream<List<TrainingModel>> getDocumentsStream4() {
    return _trainingsDataSource.getDocumentsStream4().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name4'],
            series: doc['series4'],
            repeat: doc['repeat4'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete4({required String id}) async {
    await _trainingsDataSource.delete4(id: id);
  }

  Future<void> addexercise4(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise4(exerciseName, series, repeat);
  }

  Stream<List<TrainingModel>> getDocumentsStream5() {
    return _trainingsDataSource.getDocumentsStream5().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name5'],
            series: doc['series5'],
            repeat: doc['repeat5'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete5({required String id}) async {
    await _trainingsDataSource.delete5(id: id);
  }

  Future<void> addexercise5(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise5(exerciseName, series, repeat);
  }

  Stream<List<TrainingModel>> getDocumentsStream6() {
    return _trainingsDataSource.getDocumentsStream6().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return TrainingModel(
            id: doc.id,
            name: doc['name6'],
            series: doc['series6'],
            repeat: doc['repeat6'],
          );
        },
      ).toList();
    });
  }

  Future<void> delete6({required String id}) async {
    await _trainingsDataSource.delete6(id: id);
  }

  Future<void> addexercise6(
    String exerciseName,
    int series,
    int repeat,
  ) async {
    await _trainingsDataSource.addexercise6(exerciseName, series, repeat);
  }
}
