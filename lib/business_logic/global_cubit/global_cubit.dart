// ignore_for_file: unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:http/http.dart' as http;
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  List<HelpData> helpDataList = [];
  List<Product> productDataList = [];
  List<AccountModel> accountList = [];
  Map<int, bool> tabBar = {
    1: true,
    3: false,
    2: false,
  };

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final digit1Controller = TextEditingController();
  final digit2Controller = TextEditingController();
  final digit3Controller = TextEditingController();
  final digit4Controller = TextEditingController();

  static GlobalCubit get(context) => BlocProvider.of(context);

  VerifyPhone() async {
    var response;
    if (phoneController.text.isNotEmpty && nameController.text.isNotEmpty) {
      response = await DioHelper.postData(
        url: baseURL + verifyPhone,
        body: {
          'phone': phoneController.text.toString(),
          'name': nameController.text.toString(),
        },
      );

      await CacheHelper.saveDataSharedPreference(
        key: response.data['code'],
        value: phoneController.text.toString(),
      );

      Fluttertoast.showToast(
        msg: response.data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      ).whenComplete(() {
        return Fluttertoast.showToast(
          msg: 'Your Code : ' + response.data['code'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Error: ' + response.data['status'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
      //?toast
    }
  }

  VerifyOTP() async {
    var response;
    if (digit1Controller.text.isNotEmpty &&
        digit2Controller.text.isNotEmpty &&
        digit3Controller.text.isNotEmpty &&
        digit4Controller.text.isNotEmpty) {
      response = await DioHelper.postData(url: baseURL + otp, body: {
        'code': digit1Controller.text.toString() +
            digit2Controller.text.toString() +
            digit3Controller.text.toString() +
            digit4Controller.text.toString(),
        'phone': CacheHelper.getDataFromSharedPreference(
          key: digit1Controller.text.toString() +
              digit2Controller.text.toString() +
              digit3Controller.text.toString() +
              digit4Controller.text.toString(),
        ),
      });
      // if ((accountList.where((element) => element.id == response.data['id']))
      //     .isNotEmpty) {
      // } else {
      //   accountList.add(
      //     AccountModel(
      //       id: response.data['id'],
      //       name: response.data['name'],
      //       phone: response.data['phone'],
      //     ),
      //   );
      //   print(accountList.length);
      //   print(accountList);
      // }

      print(response.data);
      Fluttertoast.showToast(
        msg: response.data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      ).whenComplete(() {
        return Fluttertoast.showToast(
          msg: 'Wlcome, ' + response.data['name'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Error: ' + response.data['status'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
      //?toast
    }
  }

  ToggleTab(int index) {
    if (tabBar[index] == true) {
      tabBar.updateAll((key, value) => false);
      tabBar.update(index, (value) => false);
    } else if (tabBar[index] == false) {
      tabBar.updateAll((key, value) => false);
      tabBar.update(index, (value) => true);
    }
    emit(TabBarRefresh());
    print(tabBar);
  }

  SplashToLoginMethod(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
    );
  }

  HelpSectionData() async {
    var request = await http.get(Uri.parse(baseURL + getHelp));

    var response = jsonDecode(request.body) as Map<String, dynamic>;

    if (request.statusCode == 200) {
      if (helpDataList.length > 2) {
      } else {
        for (var i = 0; i < response['help'].length; i++) {
          helpDataList.insert(
            i,
            HelpData(
              id: i,
              question: response['help'][i]['question'],
              answer: response['help'][i]['answer'],
            ),
          );
        }
      }
    } else {
      print(request.reasonPhrase);
    }
  }

  GetProductData() async {
    var request = await http.get(Uri.parse(baseURL + getProduct));

    var response = jsonDecode(request.body) as Map<String, dynamic>;

    if (request.statusCode == 200) {
      if (productDataList.length > 2) {
      } else {
        for (var i = 0; i < response['products'].length; i++) {
          productDataList.insert(
            i,
            Product(
              id: i,
              company: response['products'][i]['company'],
              name: response['products'][i]['name'],
              type: response['products'][i]['type'],
              price: response['products'][i]['price'],
              image: response['products'][i]['image'],
              description: response['products'][i]['description'],
            ),
          );
        }
        log(response.toString());
        print(productDataList);
      }
    } else {
      print(request.reasonPhrase);
    }
  }
}
