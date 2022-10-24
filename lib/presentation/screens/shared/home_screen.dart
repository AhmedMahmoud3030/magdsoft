import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_textformfield.dart';

import '../../../resources/assets.dart';
import '../../styles/colors.dart';
import '../../widget/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
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
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                color: AppColor.lightGrey,
                icon: Icon(
                  Icons.exit_to_app,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: AppColor.lightGrey,
                icon: Icon(
                  Icons.favorite,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 48.0),
              IconButton(
                color: AppColor.lightGrey,
                icon: Icon(
                  Icons.notifications_active,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: AppColor.lightGrey,
                icon: Icon(
                  Icons.settings,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: AppColor.darkBlue,
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomTextFormField(
                    margin: 20,
                    width: mediaQuery.size.width * .7,
                    textInputType: TextInputType.text,
                    suffixIcon: Icons.search,
                    hintText: 'Search',
                    validator: (p0) {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 40,
                    width: 50,
                    child: IconButton(
                      onPressed: () {},
                      color: AppColor.lightGrey,
                      icon: Icon(Icons.filter_alt),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(),
                width: mediaQuery.size.width * .9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SvgPicture.asset(
                    AppAssets.homeImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      FilterImage(
                        boxColor: AppColor.darkBlue,
                        txtColor: AppColor.white,
                        brand: 'All',
                        imageAsset: AppAssets.home2,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      FilterImage(
                        boxColor: AppColor.white,
                        txtColor: AppColor.black,
                        brand: 'Razer',
                        imageAsset: AppAssets.home1,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      FilterImage(
                        boxColor: AppColor.white,
                        txtColor: AppColor.black,
                        brand: 'Acer',
                        imageAsset: AppAssets.home3,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<GlobalCubit, GlobalState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = GlobalCubit.get(context);
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.5,
                      ),
                      itemCount: cubit.productDataList.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          product: cubit.productDataList[index],
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterImage extends StatelessWidget {
  final String brand;
  final String imageAsset;
  final Color txtColor;
  final Color boxColor;
  const FilterImage({
    Key? key,
    required this.brand,
    required this.imageAsset,
    required this.txtColor,
    required this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      decoration: BoxDecoration(
        color: boxColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.white,
            ),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                alignment: Alignment.center,
                image: AssetImage(imageAsset),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              brand,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                color: txtColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
