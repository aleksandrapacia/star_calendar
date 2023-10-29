import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static final UserSimplePreferences _instance = UserSimplePreferences._();
  static UserSimplePreferences getInstance() => _instance;

  SharedPreferences? _preferences;

  UserSimplePreferences._();

  Future<void> putObservation(Observation observation) async {
    final observations = await getObservations();

    // Add new item to the state
    observations.add(observation);

    // Persist new state
    await _preferences?.setString(
        "observations",
        json.encode(observations, toEncodable: (object) {
          if (object is Observation) {
            return object.toJson();
          }

          return null;
        }));
  }

  Future<List<Observation>> getObservations() async {
    _preferences ??= await SharedPreferences.getInstance();

    List<Observation> observations = [];

    // Retrieve "old" state
    final observationsJSONStr = _preferences?.getString("observations") ?? '[]';
    final List<dynamic> observationsJSON = jsonDecode(observationsJSONStr);
    for (final observationJSON in observationsJSON) {
      observations.add(Observation(
        name: observationJSON["name"],
        datetime: observationJSON["datetime"],
        equipment: observationJSON["equipment"],
      ));
    }

    return observations;
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
