import 'package:flutter/material.dart';


class ObsTile extends StatelessWidget {
  final String whatInf;
  final String whenInf;
  final String howInf;
  Function(BuildContext)? deleteFunction;

  ObsTile( {
    super.key,
    required this.whatInf,
    required this.whenInf,
    required this.howInf,
    required this.deleteFunction, 


  });
  @override 
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10) ,)
  }
}
