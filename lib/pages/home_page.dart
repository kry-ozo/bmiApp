import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:weather_app/pages/calculator_page.dart';
import 'package:weather_app/pages/settings_page.dart';
import 'package:weather_app/pages/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List pages = [
    const MainPage(),
    const CalculatorPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: WaterDropNavBar(
          backgroundColor: Colors.transparent,
          waterDropColor: Colors.blue,
          barItems: [
            BarItem(filledIcon: Icons.home_filled, outlinedIcon: Icons.home_outlined),
            BarItem(filledIcon: Icons.place , outlinedIcon: Icons.place_outlined),
            BarItem(filledIcon: Icons.settings, outlinedIcon: Icons.settings_outlined)
          ], selectedIndex: selectedIndex, onItemSelected: (index){
          setState(() {
            selectedIndex = index;
          },);
        }),
      ),
    );
  }
}