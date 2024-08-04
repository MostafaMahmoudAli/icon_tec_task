// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      tax: json['tax'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'client': instance.client,
      'tax': instance.tax,
    };

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      isActive: (json['isActive'] as num?)?.toInt(),
      image: json['image'],
      balance: (json['balance'] as num?)?.toInt(),
      verifyCode: json['verifyCode'] as String?,
      fcmToken: json['fcmToken'],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      lang: json['lang'] as String?,
      blockCount: (json['blockCount'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      refId: json['refId'],
      allowCreateOrder: json['allowCreateOrder'] as bool?,
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'image': instance.image,
      'balance': instance.balance,
      'verifyCode': instance.verifyCode,
      'fcmToken': instance.fcmToken,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'lang': instance.lang,
      'blockCount': instance.blockCount,
      'companyId': instance.companyId,
      'refId': instance.refId,
      'allowCreateOrder': instance.allowCreateOrder,
    };
