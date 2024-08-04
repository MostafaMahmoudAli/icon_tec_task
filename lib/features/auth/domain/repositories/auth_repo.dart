import 'package:dartz/dartz.dart';

import '../../data/model/user_model.dart';

abstract class AuthRepo
{
  Future<Either<String, UserModel>> login({
    required String phone,
    required String password,
  });
}