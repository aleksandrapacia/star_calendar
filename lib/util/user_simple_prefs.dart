import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  late final SharedPreferences _preferences;

  UserSimplePreferences() {
    SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  Future<void> putObservation(Observation observation) async {
    List<Observation> observations = [];

    // Retrieve "old" state
    final observationsJSONStr = _preferences.getString("observations") ?? '[]';
    final List<dynamic> observationsJSON = jsonDecode(observationsJSONStr);
    for (final observationJSON in observationsJSON) {
      observations.add(Observation(
        name: observationJSON["name"],
        datetime: observationJSON["datetime"],
        equipment: observationJSON["equipment"],
      ));
    }

    // Add new item to the state
    observations.add(observation);

    // Persist new state
    await _preferences.setString(
        "observations",
        json.encode(observations, toEncodable: (object) {
          if (object is Observation) {
            return object.toJson();
          }

          return null;
        }));
  }
}

class Observation {
  final String name;
  final DateTime datetime;
  final String equipment;

  Observation({
    required this.name,
    required this.datetime,
    required this.equipment,
  });

  String toJson() {
    return json.encode({
      "name": name,
      "datetime": datetime,
      "equipment": equipment,
    });
  }

  static Observation fromJson(String data) {
    final Map<String, dynamic> map = json.decode(data);

    return Observation(
      name: map["name"],
      datetime: map["datetime"],
      equipment: map["equipment"],
    );
  }
}
