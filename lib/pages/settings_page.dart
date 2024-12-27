import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
     return ListView(
      children: const [
        SizedBox(height: 40,),
        Text("SETTINGS", style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ListTile(
          leading: Icon(Icons.scale),
          title: Text("Weight unit"),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.straighten),
          title: Text("Height unit"),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.download),
          title: Text("Backup & Restore"),
          trailing: Icon(Icons.arrow_right),
        )
      ],
     );
  }
}