import 'package:flutter/material.dart';
import 'package:weather_app/models/bmi_data.dart';

class BmiTile extends StatelessWidget {
  final BmiData bmiData;
  const BmiTile({super.key, required this.bmiData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.scale_outlined),
      title: Text("Date:${bmiData.date.toString().substring(0,10)} Result:${bmiData.bmi}"),
      
    );
  }
}