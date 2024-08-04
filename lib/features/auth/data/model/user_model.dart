

import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';




@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    Client? client,
    String? tax,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class Client with _$Client {
  const factory Client({
    int? id,
    String? name,
    String? phone,
    int? isActive,
    dynamic image,
    int? balance,
    String? verifyCode,
    dynamic fcmToken,
    String? createdAt,
    String? updatedAt,
    String? lang,
    int? blockCount,
    int? companyId,
    dynamic refId,
    bool? allowCreateOrder,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
