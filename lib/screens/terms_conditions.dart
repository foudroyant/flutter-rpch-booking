import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpchbooking/utils/terms_and_condition.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.builder(
          itemCount: conditions.length,
          itemBuilder: (context, index) {
        final condition = conditions[index];
        return ListTile(
          title: Text(condition["entete"]!),
          subtitle: Text(condition["contenu"]!),
        );
      }),
    );
  }
}
