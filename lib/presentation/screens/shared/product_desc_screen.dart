import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_textformfield.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/line_decore.dart';

import '../../../resources/assets.dart';
import '../../styles/colors.dart';
import '../../widget/product_item.dart';
import '../../widget/tab_bar_button.dart';

class ProductDescScreen extends StatelessWidget {
  final Product? product;
  ProductDescScreen({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    //final args = ModalRoute.of(context)!.settings.arguments as Product;

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
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: BlocConsumer<GlobalCubit, GlobalState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = GlobalCubit.get(context);
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                              width: 50,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                color: AppColor.lightGrey,
                                icon: Icon(Icons.arrow_back_ios_new),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                          children: [],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            Text(
                              'Type: ' + product!.type,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColor.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: mediaQuery.size.width * .9,
                        height: mediaQuery.size.width * .7,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(product!.image),
                            )),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(3, 3),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: NetworkImage(product!.image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                            ;
                          },
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 30,
                                offset: Offset(3, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image(
                                        image: NetworkImage(
                                          AppAssets.acer,
                                        ),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product!.company + ' Official Store',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      'View Store',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.lightGrey,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.veryLightGrey
                                            .withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColor.veryLightGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 40,
                                  width: 50,
                                  child: IconButton(
                                    onPressed: () {},
                                    color: AppColor.lightBlue,
                                    icon: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.lightGrey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  product!.price + ' EG',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: CustomButton(
                              function: () {},
                              title: 'Add To Cart',
                              radius: 10,
                              width: mediaQuery.size.width / 2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LineDecore(
                        width: mediaQuery.size.width * .8,
                        height: 2,
                        radius: 15,
                        color: AppColor.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarButton(
                            tab: () => cubit.ToggleTab(1),
                            title: 'OverView',
                            isExbanded: cubit.tabBar[1]!,
                          ),
                          TabBarButton(
                              tab: () => cubit.ToggleTab(2),
                              title: 'Spesification',
                              isExbanded: cubit.tabBar[2]!),
                          TabBarButton(
                            tab: () => cubit.ToggleTab(3),
                            title: 'Review',
                            isExbanded: cubit.tabBar[3]!,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 500,
                        child: Text(
                          cubit.tabBar[1]! ? product!.description : 'Not Yet',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.lightGrey,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
