import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Column(
      children:  [
        const SizedBox(height: 70,),
        //title
        const Center(child: Text("Calculcate your bmi",textAlign: TextAlign.center,style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold,),)),
        SizedBox(height: 20,),
      //form
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: TextField(decoration: InputDecoration(hintText: "Your weight", border: OutlineInputBorder()), controller: weightControler,),),
            SizedBox(height: 20,width: 20,),
            Expanded(child: TextField(decoration: InputDecoration(hintText: "Your height", border: OutlineInputBorder()), controller: heightControler,),),
            ],
        ),
      ),
      
      TextButton(onPressed: (){

      }, child: Text("Calculate"))
      //text about why to count bmi
      ],
    );
       
  }
}