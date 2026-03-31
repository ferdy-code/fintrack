import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_session_model.freezed.dart';
part 'chat_session_model.g.dart';

@freezed
class ChatSessionModel with _$ChatSessionModel {
  const factory ChatSessionModel({
    required String id,
    required String title,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ChatSessionModel;

  factory ChatSessionModel.fromJson(Map<String, dynamic> json) => _$ChatSessionModelFromJson(json);
}
