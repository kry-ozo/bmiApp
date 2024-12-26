import 'package:flutter/material.dart';
import 'package:weather_app/models/bmi_data.dart';
import 'package:uuid/uuid.dart';

class BmiProvider with ChangeNotifier{
  final List<BmiData> _bmiData = [
    BmiData("1",DateTime(2024, 1, 1), 22.5),
    BmiData("2",DateTime(2024, 2, 1), 23.0),
    BmiData("3",DateTime(2024, 3, 1), 22.8),
  ];

  

  List<BmiData> get bmiData => _bmiData;
  

  void addBmiData(bmi,date){
    const uuid = Uuid();
    String newId = uuid.v1();

    _bmiData.add(BmiData(newId, date, bmi));
    notifyListeners();
  }

  void deleteBmiData(String id){
    _bmiData.removeWhere((bmiData)=> bmiData.id == id);
    notifyListeners();
  }
}