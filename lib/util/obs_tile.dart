import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ObsTile extends StatelessWidget {
  final String whatInf;
  final String whenInf;
  final String howInf;
  final bool observSeen;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ObsTile({
    super.key,
    required this.whatInf,
    required this.whenInf,
    required this.howInf,
    required this.observSeen,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
        child: Center(
          child: Container(
            width: 1000,
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    Checkbox(
                      value: observSeen,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(whatInf),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(whenInf),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(howInf),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
