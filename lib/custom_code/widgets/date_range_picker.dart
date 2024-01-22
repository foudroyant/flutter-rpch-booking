// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? startDate;
  DateTime? endDate;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        // Dimensions du bouton
        padding:
            EdgeInsets.symmetric(horizontal: 16.0), // Espace autour du contenu
      ),
      onPressed: () async {
        showCustomDateRangePicker(
          context,
          dismissible: true,
          minimumDate: DateTime.now().subtract(const Duration(days: 30)),
          maximumDate: DateTime.now().add(const Duration(days: 30)),
          endDate: endDate,
          startDate: startDate,
          backgroundColor: Colors.white,
          primaryColor: Colors.green,
          onApplyClick: (start, end) {
            setState(() {
              endDate = end;
              startDate = start;
            });
            FFAppState().dateDebut = start;
            FFAppState().dateFin = end;
          },
          onCancelClick: () {
            setState(() {
              endDate = null;
              startDate = null;
            });
            FFAppState().dateDebut = null;
            FFAppState().dateFin = null;
          },
        );
      },
      icon: Icon(
        Icons.event,
        color: Colors.white,
        size: 30,
      ),
      label: Text("Reserver"),
    );
  }
}
