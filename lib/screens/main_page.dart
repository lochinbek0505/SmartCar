import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:smart_car/screens/location_page.dart';
import 'package:smart_car/services/themes/texts.dart';

import '../services/app_routes.dart';
import '../services/constants/svg_icon.dart';
import '../services/themes/colors.dart';
import '../views/components/custom_button_app_bar.dart';
import '../views/components/custom_controller_menu.dart';
import 'car_about.dart';
import 'control_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bool darkMode = false;

  bool selectedCar = true;
  bool selectedLightning = false;
  bool selectedKey = false;
  bool selectedPerson = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.unlockPageGradient,
      ),
      appBar: AppBar(
        toolbarHeight: lerpDouble(4, 17, 6),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.appBarGradient,
            ),
          ),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Texts.strTesla.tr(),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Image(image: AssetImage("assets/images/km187.png")),
            ),
          ],
        ),
        leadingWidth: 140,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: CustomButtonAppBar(widget: SvgIcon.person, onPressed: () {}),
          ),
        ],
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/img_tesla_grey.png"),
                  ),
                ),
              ),
              const CustomControlPanel(),
              const SizedBox(height: 60),
              Center(
                child: GlassmorphicContainer(
                  width: MediaQuery.of(context).size.width / 1.16,
                  height: 400,
                  borderRadius: 40,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 1,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey.withOpacity(0.10),
                      Colors.grey.withOpacity(0.10),
                    ],
                    stops: const [0.1, 1],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.2),
                      const Color((0xFF282A2F)),
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => CobaltInfoPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgIcon.car_2,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Texts.strControl.tr(),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SvgIcon.chevron_right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => ControlScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AppRoutes.pushClimateScreen(context);
                                },
                                child: Row(
                                  children: [
                                    SvgIcon.vent,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Texts.strClimate.tr(),
                                          Texts.strInterior20.tr(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SvgIcon.chevron_right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (builder) => LocationPage(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  SvgIcon.location,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Texts.strLocation.tr(),
                                        Texts.strRue81StChales.tr(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgIcon.chevron_right,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
