import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ObsTile extends StatelessWidget {
  final String whatInf;
  final String whenInf;
  final String howInf;
  Function(BuildContext)? deleteFunction;

  ObsTile({
    super.key,
    required this.whatInf,
    required this.whenInf,
    required this.howInf,
    required this.deleteFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Slidable(
          child: Container(
              color: Colors.tealAccent,
              child: const ListTile(
                title: Text("whatInf"),
                subtitle: Text("whenInf"),
              )),
        ));
  }
}
