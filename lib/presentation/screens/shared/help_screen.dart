import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

import '../../router/app_router.dart';
import '../../styles/colors.dart';
import '../../widget/expansion_item.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.lightBlue,
            AppColor.lightBlue,
            AppColor.white,
            AppColor.white,
            AppColor.white,
            AppColor.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Help',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColor.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<GlobalCubit, GlobalState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = GlobalCubit.get(context);
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.helpDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionItem(
                          title: cubit.helpDataList.elementAt(index).question,
                          paragraph: cubit.helpDataList.elementAt(index).answer,
                        );
                      },
                    ),
                  );
                },
              ),
              CustomButton(
                  function: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.homeRoute);
                  },
                  title: 'Continue')
            ],
          ),
        ),
      ),
    );
  }
}
