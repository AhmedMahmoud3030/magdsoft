import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/resources/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        GlobalCubit.get(context).SplashToLoginMethod(context);
        return Scaffold(
          backgroundColor: AppColor.blue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: CustomPaint(
                      painter: MoonPainterRight(),
                    ),
                    width: 200,
                    height: 200,
                  ),
                  const LinePainter(),
                ],
              ),
              const BrandLogo(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LinePainter(),
                  SizedBox(
                    child: CustomPaint(
                      painter: MoonPainterLeft(),
                    ),
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LinePainter extends StatelessWidget {
  const LinePainter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(45 / 360),
      child: Container(
        decoration: const BoxDecoration(
            color: AppColor.darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        width: 70,
        height: 250,
      ),
    );
  }
}

class BrandLogo extends StatelessWidget {
  const BrandLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 210,
      child: SvgPicture.asset(
        AppAssets.brandLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}

class MoonPainterRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 1.1, size.height / 1.4);
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        colors: AppColor.moonShapeColors,
      ).createShader(
        Rect.fromLTRB(
          size.width,
          size.height,
          0,
          0,
        ),
      );

    Path path1 = Path()
      ..addOval(Rect.fromCenter(
          center: center, width: size.width, height: size.height));

    Path path2 = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(
            center.dx - 10,
            center.dy + 20,
          ),
          width: size.width - 10,
          height: size.height - 20,
        ),
      );
    canvas.drawPath(
      Path.combine(PathOperation.difference, path1, path2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MoonPainterLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 5, size.height / 1.4);
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        colors: AppColor.moonShapeColors,
      ).createShader(
        Rect.fromLTRB(
          size.width,
          size.height,
          0,
          0,
        ),
      );

    Path path1 = Path()
      ..addOval(Rect.fromCenter(
          center: center, width: size.width, height: size.height));

    Path path2 = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(
            center.dx + 5,
            center.dy + 20,
          ),
          width: size.width - 10,
          height: size.height - 20,
        ),
      );
    canvas.drawPath(
      Path.combine(PathOperation.difference, path1, path2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
