import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../router/app_router.dart';
import '../../widget/digit_textformfield.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColor.backgroundGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Verify Phone',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColor.white,
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DigitTextField(
                      txtControl: GlobalCubit.get(context).digit1Controller,
                    ),
                    DigitTextField(
                      txtControl: GlobalCubit.get(context).digit2Controller,
                    ),
                    DigitTextField(
                      txtControl: GlobalCubit.get(context).digit3Controller,
                    ),
                    DigitTextField(
                      txtControl: GlobalCubit.get(context).digit4Controller,
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                Text(
                  'Resend Code',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkBlue,
                      fontSize: 20),
                ),
                CustomButton(
                  function: () async {
                    GlobalCubit.get(context).VerifyOTP();
                    Navigator.of(context).pushNamed(Routes.helpRoute);
                  },
                  title: 'Verify',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
