import 'package:json_annotation/json_annotation.dart';

part 'training_model.g.dart';

@JsonSerializable()
class TrainingModel {
  TrainingModel({
    required this.name,
    required this.id,
    required this.series,
    required this.repeat,
  });

  final String name;
  final String id;
  final int series;
  final int repeat;

  factory TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingModelToJson(this);

  factory TrainingModel.fromJson1(Map<String, dynamic> json) =>
      _$TrainingModelFromJson1(json);

  Map<String, dynamic> toJson1() => _$TrainingModelToJson1(this);

  factory TrainingModel.fromJson2(Map<String, dynamic> json) =>
      _$TrainingModelFromJson2(json);

  Map<String, dynamic> toJson2() => _$TrainingModelToJson2(this);

  factory TrainingModel.fromJson3(Map<String, dynamic> json) =>
      _$TrainingModelFromJson3(json);

  Map<String, dynamic> toJson3() => _$TrainingModelToJson3(this);

  factory TrainingModel.fromJson4(Map<String, dynamic> json) =>
      _$TrainingModelFromJson4(json);

  Map<String, dynamic> toJson4() => _$TrainingModelToJson4(this);

  factory TrainingModel.fromJson5(Map<String, dynamic> json) =>
      _$TrainingModelFromJson5(json);

  Map<String, dynamic> toJson5() => _$TrainingModelToJson5(this);

  factory TrainingModel.fromJson6(Map<String, dynamic> json) =>
      _$TrainingModelFromJson6(json);

  Map<String, dynamic> toJson6() => _$TrainingModelToJson6(this);
}
