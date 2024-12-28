import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/bmi_tile.dart';
import 'package:weather_app/components/chart_line.dart';
import 'package:weather_app/services/bmi_provider.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
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
        Builder(
            builder: (context){
              if(bmiProvider.bmiData.isEmpty){
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child:  Text("Start calculating your BMI in calculator section below", style: TextStyle(color: Colors.blue, fontSize: 24,), textAlign: TextAlign.center,),
                );
              }else{
                return Center(child: ChartLine(bmiHistory: bmiProvider.bmiData));
              }
            } 
            ),  
          const SizedBox(height: 35,),
          bmiProvider.bmiData.isNotEmpty ? const Text("Last logs of your BMI", style: TextStyle(color: Colors.blue, fontSize: 28,fontWeight: FontWeight.bold), textAlign: TextAlign.center,) : const Text(""),
          Expanded(
            child: ListView.builder(
              itemCount: bmiProvider.bmiData.length,
              itemBuilder: (context, index){
                return BmiTile(bmiData: bmiProvider.bmiData[index], onTap: ()=>bmiProvider.deleteBmiData(bmiProvider.bmiData[index].id),);
              },),
          )
       ],
      );
     } );
  }
}

