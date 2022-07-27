import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_web/Bloc/SignUp_Cubit/sign_up_states.dart';
import 'package:petology_web/Screens/home_screen.dart';
import 'package:petology_web/Shared/Network/dio_helper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<dynamic> registerUser(json, String endpoint, context) async {
    DioHelper.dio
        .post(
      endpoint,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
      data: jsonEncode(json),
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
              builder: (BuildContext context) => const HomeScreen(),
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
