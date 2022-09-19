// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_web/Bloc/signUpCubit/signUpStates.dart';
import 'package:petology_web/Screens/homeScreen.dart';
import 'package:petology_web/Shared/Network/dioHelper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(
    context,
  ) =>
      BlocProvider.of(
        context,
      );

  Future<dynamic> registerUser(
    json,
    String endpoint,
    context,
  ) async {
    DioHelper.dio
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
            print("success");
          }
          if (kDebugMode) {
            print(
              'Token : ${(value.data['accessToken'])}',
            );
          }
          emit(
            UserSignedUpSuccess(),
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
          if (kDebugMode) {
            print(
              "Error",
            );
          }
        }
      },
    );
  }
}
