import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:magdsoft_flutter_structure/resources/assets.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_textformfield.dart';
import '../../widget/line_decore.dart';
import '../../widget/social_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      //extendBody: true,

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          ImageContainer(mediaQuery: mediaQuery),
          Container(
            margin: EdgeInsets.only(top: mediaQuery.size.height * 0.3),
            height: mediaQuery.size.height * 0.7,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //?i should write my code here4
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LineDecore(
                          color: AppColor.lightBlue,
                          height: 2,
                          radius: 10,
                          width: mediaQuery.size.width * .4),
                      Text(
                        'OR',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.lightBlue,
                            fontSize: 15),
                      ),
                      LineDecore(
                          color: AppColor.lightBlue,
                          height: 2,
                          radius: 10,
                          width: mediaQuery.size.width * .4),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLogin(assetName: AppAssets.facebook),
                    SocialLogin(assetName: AppAssets.ios),
                    SocialLogin(assetName: AppAssets.google),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: mediaQuery.size.height * 0.15,
                ),
                width: 350,
                height: 340,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: mediaQuery.size.width * .4,
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColor.lightBlue, //Border.all
                        /*** The BorderRadius widget  is here ***/
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      txtControl: GlobalCubit.get(context).nameController,
                      hintText: 'Enter your Full Name',
                      textInputType: TextInputType.name,
                      validator: (p0) {},
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      txtControl: GlobalCubit.get(context).phoneController,
                      hintText: 'Enter your Phone Number',
                      textInputType: TextInputType.phone,
                      validator: (p0) {},
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      title: 'Login',
                      function: () async {
                        await GlobalCubit.get(context).VerifyPhone();
                        Navigator.of(context).pushNamed(Routes.verifyRoute);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: mediaQuery.size.height * 0.4,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppAssets.cityView,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: AppColor.darkBlueTrans,
          ),
        ],
      ),
    );
  }
}
