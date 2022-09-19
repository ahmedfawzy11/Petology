import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_web/Bloc/loginCubit/loginStates.dart';
import 'package:petology_web/Constant/constant.dart';
import 'package:petology_web/Screens/homeScreen.dart';
import 'package:petology_web/Shared/Network/dioHelper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit()
      : super(
          LoginInitialState(),
        );

  static LoginCubit get(
    context,
  ) =>
      BlocProvider.of(
        context,
      );

  Future<dynamic> loginUser(
    json,
    String endpoint,
    context,
  ) async {
    Response response = DioHelper.dio
        .post(
      endpoint,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
      data: jsonEncode(
        json,
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          if (kDebugMode) {
            print(
              "success\n" 'Token : ${(value.data['accessToken'])}',
            );
          }
          TOKEN = value.data['accessToken'];
          emit(
            UserLoginSuccess(),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (
                BuildContext context,
              ) =>
                  const HomeScreen(),
            ),
          );
        } else {
          emit(
            UserLoginFailed(),
          );
          if (kDebugMode) {
            print(
              "Error",
            );
          }
        }
      },
    ) as Response;
  }
}
