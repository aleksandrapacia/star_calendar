import 'package:flutter/material.dart';
import 'package:star_calendar/util/button.dart';

class DialogBox extends StatelessWidget {
  //
  final textController;
  final secondTextController;
  final thirdTextController;

  //TODO: read about VoidCallback
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.textController,
    required this.secondTextController,
    required this.thirdTextController,
    required this.onSave,
    required this.onCancel,
  });

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
                    controller: textController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "What did you see?",
                        suffixIcon: IconButton(
                            onPressed: () {
                              textController.clear();
                            },
                            icon: const Icon(Icons.clear))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: secondTextController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'When did you see it?',
                      suffixIcon: IconButton(
                        onPressed: () {
                          secondTextController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: thirdTextController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'How did you see it?',
                      suffixIcon: IconButton(
                        onPressed: () {
                          thirdTextController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                // button 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // button add
                    MyButton(text: "Save", onPressed: onSave),
                    // do something to make it symmetrical
                    const SizedBox(width: 40),
                    // button cancel
                    MyButton(text: "Cancel", onPressed: onCancel),
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
