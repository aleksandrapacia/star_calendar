import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:star_calendar/util/button.dart';

class DialogBox extends StatefulWidget {
  TextEditingController textController = TextEditingController();
  TextEditingController secondTextController = TextEditingController();
  TextEditingController thirdTextController = TextEditingController();

  //TODO: read about VoidCallback
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.textController,
    required this.secondTextController,
    required this.thirdTextController,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Form')),
      // ignore: prefer_const_constructors
      contentPadding: EdgeInsets.all(30),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    // controller?
                    controller: widget.textController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Observation",
                        suffixIcon: IconButton(
                            onPressed: () {
                              widget.textController.clear();
                            },
                            icon: const Icon(Icons.clear))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: widget.secondTextController,
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickeddate != null) {
                        setState(
                          () {
                            widget.secondTextController.text =
                                DateFormat('E, d MMM yyyy HH:mm:ss')
                                    .format(pickeddate);
                          },
                        );
                      }
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Time',
                      suffixIcon: IconButton(
                        onPressed: () {
                          widget.secondTextController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: widget.thirdTextController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Equipment: telescope, binoculars etc...',
                      suffixIcon: IconButton(
                        onPressed: () {
                          widget.thirdTextController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                // button 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // button add
                    MyButton(text: "Save", onPressed: widget.onSave),
                    // do something to make it symmetrical
                    const SizedBox(width: 20),
                    // button cancel
                    MyButton(text: "Cancel", onPressed: widget.onCancel),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
