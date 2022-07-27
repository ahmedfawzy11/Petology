import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_web/Bloc/Home_Cubit/home_states.dart';
import 'package:petology_web/Constant/constant.dart';
import 'package:petology_web/Models/category_model.dart';
import 'package:petology_web/Models/home_model.dart';
import 'package:petology_web/Shared/Network/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(AppInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Profile> profiles = [];
  List<PetsNeeds> listOfPets = [];
  Footer? footerData;
  FirstSection? firstSectionData;
  SecondSection? secondSectionData;

  Future<dynamic> getHomeFirstSectionsData(context) async {
    DioHelper.dio
        .get(
      FIRST_SECTION_ENDPOINT,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          if (kDebugMode) {
            print("success in first section");
          }
          firstSectionData = FirstSection(
            value.data['title'],
            value.data['body'],
          );

          emit(
            SectionOneSuccess(),
          );
        } else {
          if (kDebugMode) {
            print(
              "error in first section",
            );
          }
          emit(
            SectionOneError(),
          );
        }
      },
    );
  }

  Future<dynamic> getHomeSecondSectionsData(context) async {
    DioHelper.dio
        .get(
      SECOND_SECTION_ENDPOINT,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          if (kDebugMode) {
            print(
              "success in second section",
            );
          }

          secondSectionData = SecondSection(
            value.data['title'],
            value.data['body'],
          );
        } else {
          if (kDebugMode) {
            print(
              "error in second section",
            );
          }
        }
      },
    );
  }

  Future<dynamic> getHomePetsData(context) async {
    var listOfData;
    DioHelper.dio
        .get(
      PETS_NEED_ENDPOINT,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          if (kDebugMode) {
            print(
              "Success in pets api",
            );
          }
          listOfData = PetsNeeds.fromJson(
              jsonDecode(value.data) as Map<String, dynamic>);

          for (int i = 0; i < listOfData!.length; i++) {
            listOfPets.add(
              PetsNeeds(
                listOfData![i]["imageUrl"],
                listOfData![i]["title"],
              ),
            );
            if (kDebugMode) {
              print(
                "o",
              );
            }
          }
        } else {
          if (kDebugMode) {
            print(
              "Error in pets api",
            );
          }
        }
      },
    );
  }

  Future<dynamic> getHomeFooterData(context) async {
    DioHelper.dio
        .get(
      Footer_ENDPOINT,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: TOKEN
        },
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          if (kDebugMode) {
            print(
              "Success in Footer",
            );
          }
          footerData = Footer(
            value.data['email'],
            value.data['location'],
            value.data['phone'].toString(),
            value.data['location2'],
          );
        } else {
          if (kDebugMode) {
            print(
              "Error in Footer",
            );
          }
        }
      },
    );
  }
}
