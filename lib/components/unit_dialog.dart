import 'package:flutter/material.dart';

Future<String?> showUnitDialog(context, unitType) async {
   List<String> options = [];
  if (unitType == "weight") {
    options = ["kg", "lbs"];
  } else if (unitType == "height") {
    options = ["cm", "in"];
  }

   String? selectedOption = options.isNotEmpty ? options[0] : null;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select a $unitType unit'),
        content: options.isNotEmpty
            ? DropdownButton<String>(
                value: selectedOption,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  selectedOption = newValue;
                },
              )
            : const Text('No options available for this unit type.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop(selectedOption);
            },
          ),
        ],
      );
    },
  );
}