import 'package:weather_app/models/bmi_data.dart';
import 'package:uuid/uuid.dart';

class BmiService{
  final List<BmiData> _bmiData = []; 

  List<BmiData> getAllBmiData(){
    return _bmiData;
  }

  void addBmiData(bmi,date){
    const uuid = Uuid();
    String newId = uuid.v1();

    _bmiData.add(BmiData(newId, date, bmi));
  }

  void deleteBmiData(String id){
    _bmiData.removeWhere((bmiData)=> bmiData.id == id);
  }
}