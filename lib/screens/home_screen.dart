import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:smart_car/screens/charge_screen.dart';
import 'package:smart_car/screens/main_page.dart';
import 'package:smart_car/screens/profile_page.dart';
import 'package:smart_car/services/themes/colors.dart';

import 'document_page.dart';
import 'location_page.dart';

class HomeScreen extends StatefulWidget {
  static const id = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool darkMode = false;
  var pages = [MainPage(), ChargerScreen(), LocationPage(), ProfilePage()];
  bool selectedCar = true;
  bool selectedLightning = false;
  bool selectedKey = false;
  bool selectedPerson = false;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.unlockPageGradient,
      ),
      extendBody: true,
      body: pages[selectedIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => GaragePage()),
            );
          },
          child: AppIconButtonPressed(
            image: const AssetImage("assets/icons/penal.png"),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        child: ClipPath(
          clipper: MyClipper(),
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: RPSCustomPainter(),
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedCar = true;
                      selectedPerson = false;
                      selectedLightning = false;
                      selectedKey = false;
                      selectedIndex = 0;
                      setState(() {});
                      debugPrint("selectedCar");
                    },
                    child: BottomBarIcon(
                      image: const AssetImage("assets/icons/ic_car.png"),
                      isActive: selectedCar,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;

                        selectedLightning = true;
                        selectedCar = false;
                        selectedPerson = false;
                        selectedKey = false;
                      });
                      debugPrint("selectedLightning");
                    },
                    child: BottomBarIcon(
                      image: const AssetImage("assets/icons/ic_lightning.png"),
                      isActive: selectedLightning,
                    ),
                  ),
                  const SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      selectedCar = false;
                      selectedPerson = false;
                      selectedLightning = false;
                      selectedKey = true;
                      selectedIndex = 2;

                      setState(() {});
                    },
                    child: BottomBarIcon(
                      image: const AssetImage("assets/icons/ic_key.png"),
                      isActive: selectedKey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedCar = false;
                      selectedPerson = true;
                      selectedLightning = false;
                      selectedKey = false;
                      selectedIndex = 3;

                      setState(() {});
                    },
                    child: BottomBarIcon(
                      image: const AssetImage("assets/icons/ic_person.png"),
                      isActive: selectedPerson,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppIconButtonPressed extends StatelessWidget {
  final AssetImage image;
  final void Function()? onPressed;

  const AppIconButtonPressed({
    Key? key,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff5D5E5F), Color(0xff000000)],
        ),
      ),
      child: Container(
        width: 55,
        height: 55,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xff0C0D0E), Color(0xff3E434B)],
          ),
        ),
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff16181B), Color(0xff2C3035)],
            ),
          ),
          child: SizedBox(width: 25, height: 25, child: Image(image: image)),
        ),
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final AssetImage image;
  bool isActive;

  // void Function()? onPressed;

  BottomBarIcon({
    super.key,
    required this.image,
    required this.isActive,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CupertinoButton(
        onPressed: null,
        child: Stack(
          children: [
            isActive
                ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(blurRadius: 20, color: Colors.blue),
                      ],
                    ),
                  ),
                )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  color: isActive ? Colors.blue.shade200 : Colors.white,
                  image: image,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => shapePath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = shapePath(size);
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(0.50);
    paint0Fill.imageFilter = ImageFilter.blur(
      sigmaX: Shadow.convertRadiusToSigma(40),
      sigmaY: Shadow.convertRadiusToSigma(40),
    );

    // inner shadow
    final shadowPaint1 =
        Paint()
          ..blendMode = BlendMode.overlay
          ..colorFilter = ColorFilter.mode(
            Colors.white.withOpacity(0.22),
            BlendMode.overlay,
          )
          ..imageFilter = ImageFilter.blur(
            sigmaX: Shadow.convertRadiusToSigma(3),
            sigmaY: Shadow.convertRadiusToSigma(3),
          );

    canvas.drawPath(path_0.shift(const Offset(0.5, 0.2)), shadowPaint1);
    // blur
    canvas.drawPath(path_0, paint0Fill);

    // inner shadow
    final shadowPaint2 =
        Paint()
          ..blendMode = BlendMode.overlay
          ..colorFilter = const ColorFilter.mode(
            Colors.white,
            BlendMode.overlay,
          )
          ..imageFilter = ImageFilter.blur(
            sigmaX: Shadow.convertRadiusToSigma(21),
            sigmaY: Shadow.convertRadiusToSigma(21),
          );
    canvas.drawPath(path_0.shift(const Offset(-3, -20)), shadowPaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Path shapePath(Size size) {
  Path path_0 = Path();
  path_0.moveTo(0, size.height * 0.4515833);
  path_0.cubicTo(
    0,
    size.height * 0.4086077,
    size.width * 0.003320077,
    size.height * 0.3672936,
    size.width * 0.009267051,
    size.height * 0.3362654,
  );
  path_0.lineTo(size.width * 0.04192103, size.height * 0.1658974);
  path_0.cubicTo(
    size.width * 0.06223282,
    size.height * 0.05992192,
    size.width * 0.09031718,
    0,
    size.width * 0.1196736,
    0,
  );
  path_0.lineTo(size.width * 0.3187897, 0);
  path_0.cubicTo(
    size.width * 0.3407769,
    0,
    size.width * 0.3622385,
    size.height * 0.03365282,
    size.width * 0.3802897,
    size.height * 0.09643564,
  );
  path_0.lineTo(size.width * 0.4341077, size.height * 0.2836308);
  path_0.cubicTo(
    size.width * 0.4737154,
    size.height * 0.4213962,
    size.width * 0.5262846,
    size.height * 0.4213962,
    size.width * 0.5658923,
    size.height * 0.2836308,
  );
  path_0.lineTo(size.width * 0.6197103, size.height * 0.09643564);
  path_0.cubicTo(
    size.width * 0.6377615,
    size.height * 0.03365269,
    size.width * 0.6592231,
    0,
    size.width * 0.6812103,
    0,
  );
  path_0.lineTo(size.width * 0.8803256, 0);
  path_0.cubicTo(
    size.width * 0.9096821,
    0,
    size.width * 0.9377667,
    size.height * 0.05992192,
    size.width * 0.9580795,
    size.height * 0.1658974,
  );
  path_0.lineTo(size.width * 0.9907333, size.height * 0.3362654);
  path_0.cubicTo(
    size.width * 0.9966795,
    size.height * 0.3672936,
    size.width,
    size.height * 0.4086077,
    size.width,
    size.height * 0.4515833,
  );
  path_0.lineTo(size.width, size.height);
  path_0.lineTo(0, size.height);
  path_0.lineTo(0, size.height * 0.4515833);
  path_0.close();

  return path_0;
}
