import 'package:cloud_firestore/cloud_firestore.dart';

class ForumModel {
  ForumModel({
    required this.id,
    required this.avatarURL,
    required this.likes,
    required this.message,
    required this.timeStamp,
    required this.userEmail,
  });
  final String id;
  final String avatarURL;
  final List<String> likes;
  final String message;
  final Timestamp timeStamp;
  final String userEmail;

  ForumModel.fromJson(Map<String, dynamic> json, this.id)
      : avatarURL = json['AvatarUrl'],
        likes = List<String>.from(json['Likes'] ?? []),
        message = json['Message'],
        timeStamp = json['TimeStamp'],
        userEmail = json['UserEmail'];

  //  factory ForumModel.fromJson(Map<String, dynamic> json, String id) {
  //   return ForumModel(
  //     id :id,
  //       avatarURL : json['AvatarUrl'],
  //       likes : json['Likes'],
  //       message : json['Message'],
  //       timeStamp : json['TimeStamp'],
  //       userEmail : json['UserEmail'],
  //   );
  // }
}
