import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:weather_app/pages/calculator_page.dart';
import 'package:weather_app/pages/settings_page.dart';
import 'package:weather_app/pages/main_page.dart';
import 'package:weather_app/services/bmi_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController weightData = TextEditingController();
  final TextEditingController heightData = TextEditingController();
  int selectedIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const MainPage(),
      CalculatorPage(
        weightControler: weightData,
        heightControler: heightData,
        addBmiData: addBmiData,
      ),
      const SettingsPage(),
    ];
  }

  void addBmiData(){
    final int weight = int.parse(weightData.text);
    final int height = int.parse(heightData.text);
    final double heightInMeters = height/100;
    final double bmi  = ((weight / (heightInMeters * heightInMeters)*10).round()) / 10;
    
    final date = DateTime.now();

    Provider.of<BmiProvider>(context, listen: false).addBmiData(bmi, date);
  }

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
            BarItem(filledIcon: Icons.calculate , outlinedIcon: Icons.calculate_outlined),
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

