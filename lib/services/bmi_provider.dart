import 'package:flutter/material.dart';
import 'package:weather_app/models/bmi_data.dart';
import 'package:uuid/uuid.dart';

class BmiProvider with ChangeNotifier{

  final List<BmiData> _bmiData = [
    
  ];

  final Map<String, String> _bmiSettings = {
    "height" : "cm",
    "weight" : "kg"
  };

  
  Map<String, String> get getBmiSettings => _bmiSettings;
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

  void changeWeight(String newValue){
   _bmiSettings["weight"] = newValue;
    notifyListeners();
  }

  void changeHeight(String newValue){
    _bmiSettings["height"] = newValue;
    notifyListeners();
  }
}