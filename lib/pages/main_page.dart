import 'package:flutter/material.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BmiData> bmiHistory = [
  BmiData(DateTime(2024, 1, 1), 22.5),
  BmiData(DateTime(2024, 2, 1), 23.0),
  BmiData(DateTime(2024, 3, 1), 22.8),
  ];

  @override
  Widget build(BuildContext context) {
     return const Column(
       children: [
          SizedBox(height: 80,),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_outlined,size: 30,),
              Text("User",
              style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
         SizedBox(height: 20,),
         Text("Your Statistics",
        style: TextStyle(color: Colors.blue, fontSize: 28,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
       ],
     );
  }
}

class BmiData {
  final DateTime date;
  final double bmi;

  BmiData(this.date, this.bmi);
}