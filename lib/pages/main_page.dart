import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/bmi_tile.dart';
import 'package:weather_app/components/chart_line.dart';
import 'package:weather_app/models/bmi_data.dart';
import 'package:weather_app/services/bmi_provider.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BmiData> bmiHistory = [];

  @override
  Widget build(BuildContext context) {
     return Consumer<BmiProvider>(builder: (context, bmiProvider, child){
      return  Column(
       children: [
        const SizedBox(height: 80,),
        const SizedBox(height: 20,),
        const Text("Your Statistics",
        style: TextStyle(color: Colors.blue, fontSize: 28,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        Container(
          margin: const EdgeInsets.only(right: 35),
          child: Builder(
            builder: (context){
              if(bmiProvider.bmiData.isEmpty){
                return const Text("Start calculating your BMI in calculator section below", style: TextStyle(color: Colors.blue, fontSize: 24,), textAlign: TextAlign.center,);
              }else{
                return ChartLine(bmiHistory: bmiProvider.bmiData);
              }
            } 
            )
          
            
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
     } );
  }
}

