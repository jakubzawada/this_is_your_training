import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_model.freezed.dart';
part 'training_model.g.dart';

@freezed
class TrainingModel with _$TrainingModel {
  factory TrainingModel(
    String name,
    String id,
    int series,
    int repeat,
  ) = _TrainingModel;

  factory TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingModelFromJson(json);

  factory TrainingModel.fromJson1(Map<String, dynamic> json) =>
      _$TrainingModelFromJson1(json);

  factory TrainingModel.fromJson2(Map<String, dynamic> json) =>
      _$TrainingModelFromJson2(json);

  factory TrainingModel.fromJson3(Map<String, dynamic> json) =>
      _$TrainingModelFromJson3(json);

  factory TrainingModel.fromJson4(Map<String, dynamic> json) =>
      _$TrainingModelFromJson4(json);

  factory TrainingModel.fromJson5(Map<String, dynamic> json) =>
      _$TrainingModelFromJson5(json);

  factory TrainingModel.fromJson6(Map<String, dynamic> json) =>
      _$TrainingModelFromJson6(json);
}
