import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
     return  const Column(
       children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_outlined,size: 30,),
              Text("User",
              style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
         SizedBox(height: 20,),
         Text("Your Statistics",
        style: TextStyle(color: Colors.blue, fontSize: 22,),),
       
       ],
     );
  }
}