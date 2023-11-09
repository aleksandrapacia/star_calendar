import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserSimplePreferences {
  static final UserSimplePreferences _instance = UserSimplePreferences._();
  static UserSimplePreferences getInstance() => _instance;

  SharedPreferences? _preferences;

  UserSimplePreferences._();

  Future<void> putObservation(Observation observation) async {
    _preferences ??= await SharedPreferences.getInstance();

    final observations = await getObservations();

    // Add new item to the state
    observations.add(observation);

    // Persist new state
    await _preferences?.setString("observations", json.encode(observations));
  }

  Future<void> deleteObservation(String id) async {
    _preferences ??= await SharedPreferences.getInstance();

    final observations = await getObservations();

    observations.removeWhere((observation) => observation.id == id);

    // Persist new state
    await _preferences?.setString("observations", json.encode(observations));
  }

  Future<List<Observation>> getObservations() async {
    _preferences ??= await SharedPreferences.getInstance();

    List<Observation> observations = [];

    // Retrieve "old" state
    final observationsJSONStr = _preferences?.getString("observations") ?? '[]';
    final List<dynamic> observationsJSON = jsonDecode(observationsJSONStr);
    for (final observationJSON in observationsJSON) {
      observations.add(Observation.fromJson(observationJSON));
    }

    return observations;
  }
}

const _uuid = Uuid();

class Observation {
  final String id;
  final String name;
  final DateTime datetime;
  final String equipment;

  Observation({
    required this.name,
    required this.datetime,
    required this.equipment,
  }) : id = _uuid.v4();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "datetime": datetime.toIso8601String(),
      "equipment": equipment,
    };
  }

  Observation.fromJson(Map<String, dynamic> data)
      : id = data["id"],
        name = data["name"],
        datetime = DateTime.parse(data["datetime"]),
        equipment = data["equipment"];
}
