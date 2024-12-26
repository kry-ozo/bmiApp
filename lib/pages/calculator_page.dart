import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();
  void Function()? addBmiData;

  CalculatorPage({super.key, required this.weightControler, required this.heightControler, required this.addBmiData});

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const SizedBox(height: 70,),
        //title
        const Center(child: Text("Calculcate Your BMI",textAlign: TextAlign.center,style: TextStyle(fontSize: 32, color: Colors.blue, fontWeight: FontWeight.bold,),)),
        

      //form
      const SizedBox(height: 20,),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
               children: [
                Expanded(child: TextField(decoration: const InputDecoration(hintText: "your weight(kg)", border: OutlineInputBorder()), textAlign: TextAlign.center, controller: weightControler,),),
                const SizedBox(height: 20,width: 20,),
                Expanded(child: TextField(decoration: const InputDecoration(hintText: "your height(cm)", border: OutlineInputBorder()), textAlign: TextAlign.center, controller: heightControler,),),
            ],
        ),
      ),
      const SizedBox(height: 15,),
      TextButton(onPressed: addBmiData, child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18)),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
        ),
      ),
        ],
      ),
      
      //text about why to count bmi
      const SizedBox(height: 30,),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child:  Column(
          children: [
            Text("Why we should track our BMI?", style: TextStyle(color: Colors.blue, fontSize: 22),),
            SizedBox(height: 10,),
            Text("Calculating BMI helps assess weight status and associated health risks like heart disease, diabetes, or malnutrition. It's a simple tool to set health goals, monitor trends, and encourage preventive care. However, it doesn't account for factors like muscle mass or fat distribution, so it should be used alongside other health measures.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16),)
          ],
        ),
      )
      
      
      ],
    );
       
  }
}