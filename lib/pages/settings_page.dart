import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/unit_dialog.dart';
import 'package:weather_app/services/bmi_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Consumer<BmiProvider>(
       builder:(context, bmiProvider, child) {
         return ListView(
        children:  [
          const SizedBox(height: 40,),
          const Text("SETTINGS", style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.scale),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Weight Unit"),
                  Text("${bmiProvider.getBmiSettings["weight"]}"),
                ],
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
            onTap: () async {
              String? result = await showUnitDialog(context, "weight");
              if (result != null) {
                bmiProvider.changeWeight(result);
              } 
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.straighten),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Height Unit"),
                  Text("${bmiProvider.getBmiSettings["height"]}"),
                ],
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
            onTap: () async {
              String? result = await showUnitDialog(context, "height");
              if (result != null) {
                bmiProvider.changeHeight(result);
              } 
            },
          ),
          const ListTile(
            leading:  Icon(Icons.download),
            title: Text("Backupt & Restore"),
            trailing:  Icon(Icons.arrow_right),
          )
        ],
       );
       },
     );
  }
}