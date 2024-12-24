import 'package:flutter/material.dart';
import 'package:weather_app/components/bmi_tile.dart';
import 'package:weather_app/components/chart_line.dart';
import 'package:weather_app/models/bmi_data.dart';


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
     return  Column(
       children: [
        const SizedBox(height: 80,),
        const SizedBox(height: 20,),
        const Text("Your Statistics",
        style: TextStyle(color: Colors.blue, fontSize: 28,fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        Container(
          margin: const EdgeInsets.only(right: 35),
          child: ChartLine(bmiHistory: bmiHistory)
          ),
        Expanded(
          child: ListView.builder(
            itemCount: bmiHistory.length,
            itemBuilder: (context, index){
              return BmiTile(bmiData: bmiHistory[index]);
            },),
        )
       ],
     );
  }
}

