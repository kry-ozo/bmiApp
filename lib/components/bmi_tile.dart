import 'package:flutter/material.dart';
import 'package:weather_app/models/bmi_data.dart';

class BmiTile extends StatelessWidget {
  final BmiData bmiData;
  void Function()? onTap;
  BmiTile({super.key, required this.bmiData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.insights_outlined),
      title: Text("Date: ${bmiData.date.toString().substring(0,10)}     Result:${bmiData.bmi}"),
      trailing: GestureDetector(onTap: onTap, child: const Icon(Icons.delete_outline),),
    );
  }
}