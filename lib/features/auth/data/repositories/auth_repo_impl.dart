import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:icon_tec_task/features/auth/data/model/user_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/cache_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo
{
  final ApiConsumer apiConsumer;
  final CacheService cacheService;
  AuthRepoImpl({required this.apiConsumer,required this.cacheService});

  @override
  Future<Either<String, UserModel>> login({required String phone, required String password}) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.loginEndPoint,
        data: {
          'phone': phone,
          'password': password,
          "company_id":"3",
        },
      );
      var authenticatedUser = UserModel.fromJson(response['data']);
      await _cacheClient(authenticatedUser:authenticatedUser );
      return Right(authenticatedUser);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  Future<void> _cacheClient({required UserModel authenticatedUser}) async
  {
    await cacheService.setData(
      key: AppStrings.accessToken,
      value: authenticatedUser.accessToken,
    );
    await cacheService.setData(
      key: AppStrings.client,
      value: json.encode(authenticatedUser.client?.toJson()),
    );
  }
}