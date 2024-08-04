import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/user_model.dart';
import '../../domain/repositories/auth_repo.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState>
{
  bool success = false;
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(const AuthState.initial());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController numberEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;
    _update(const AuthState.loading());
    final results = await authRepo.login(
      phone: numberEditingController.text,
      password: passwordEditingController.text,
    );
    results.fold(
          (message) => _update(AuthState.error(message)),
          (userModel) {
            _update(AuthState.success(userModel));
            success= true;
          },
    );
  }

  void _update(AuthState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
