import 'package:flutter/material.dart';

class Observation {
  final String title;
  final String whenInf; // datetime
  final String whenTimeInf; //time

  const Observation(this.title, this.whenInf, this.whenTimeInf);
}

final observations = List.generate(
  20,
  (i) => const Observation("Halley's Comet", "24.08.2077", "00:45"),
);

class NotesTest extends StatelessWidget {
  const NotesTest({super.key, required this.observations});

  final List<Observation> observations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Test"),
      ),
      body: ListView.builder(
        itemCount: observations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(observations[index].title),
          );
        },
      ),
    );
  }
}
