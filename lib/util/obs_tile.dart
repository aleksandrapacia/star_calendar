import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ObsTile extends StatelessWidget {
  final String whatInf;
  final String whenInf;
  final String whenTimeInf;
  final String howInf;
  final bool observSeen;
  Function(BuildContext)? deleteFunction;

  ObsTile({
    super.key,
    required this.whatInf,
    required this.whenInf,
    required this.whenTimeInf,
    required this.howInf,
    required this.observSeen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.red.shade300),
          ],
        ),
        child: Container(
          width: 1000,
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    whatInf,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(whenInf),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    whenTimeInf,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(howInf),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
