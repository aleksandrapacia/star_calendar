import 'package:flutter/material.dart';
import 'package:star_calendar/util/button.dart';
import 'package:star_calendar/util/user_simple_prefs.dart';

class DialogBox extends StatefulWidget {
  final VoidCallback onSave;
  final void Function() onCancel;

  const DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  TextEditingController observationNameController = TextEditingController();
  TextEditingController secondTextController = TextEditingController();
  TextEditingController secondTimeController = TextEditingController();
  TextEditingController equipmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    return AlertDialog(
      title: const Center(child: Text('Form')),
      // ignore: prefer_const_constructors
      contentPadding: EdgeInsets.all(30),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: observationNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Observation name",
                  suffixIcon: IconButton(
                    onPressed: () {
                      observationNameController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Expanded(
            //         child: TextField(
            //           controller: widget.secondTextController,
            //           onTap: () async {
            //             DateTime? pickeddate = await showDatePicker(
            //                 context: context,
            //                 initialDate: DateTime.now(),
            //                 firstDate: DateTime(2000),
            //                 lastDate: DateTime(2101));

            //             if (pickeddate != null) {
            //               setState(
            //                 () {
            //                   widget.secondTextController.text =
            //                       DateFormat('E, d MMM yyyy')
            //                           .format(pickeddate);
            //                 },
            //               );
            //             }
            //           },
            //           decoration: InputDecoration(
            //             border: const OutlineInputBorder(),
            //             hintText: 'Date',
            //             suffixIcon: IconButton(
            //               onPressed: () {
            //                 widget.secondTextController.clear();
            //               },
            //               icon: const Icon(Icons.clear),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: TextField(
            //           controller: widget.secondTimeController,
            //           onTap: () async {
            //             TimeOfDay? pickedtime = await showTimePicker(
            //               context: context,
            //               initialTime: time,
            //             );

            //             if (pickedtime != null) {
            //               setState((() => time = pickedtime));
            //             }
            //             widget.secondTimeController.text = time.format(context);
            //           },
            //           decoration: InputDecoration(
            //             border: const OutlineInputBorder(),
            //             hintText: 'Time',
            //             suffixIcon: IconButton(
            //               onPressed: () {
            //                 widget.secondTimeController.clear();
            //               },
            //               icon: const Icon(Icons.clear),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: equipmentController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Equip.: telescope, etc...',
                  suffixIcon: IconButton(
                    onPressed: () {
                      equipmentController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // button add
                MyButton(
                    text: "Save",
                    onPressed: () async {
                      final observation = Observation(
                        name: observationNameController.text,
                        datetime: DateTime(2005, 4, 2, 21, 37),
                        equipment: equipmentController.text,
                      );

                      await UserSimplePreferences.getInstance()
                          .putObservation(observation);
                    }),
                const SizedBox(width: 20),
                // button cancel
                MyButton(text: "Cancel", onPressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
