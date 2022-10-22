import 'dart:convert';

import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalJobsDatasource {
  final SharedPreferences _prefs;

  const LocalJobsDatasource({required SharedPreferences prefs})
      : _prefs = prefs;

  Future<List<JobEntity>> loadJobs() async {
    final encodedJobs = _prefs.getString('jobs');
    if (encodedJobs == null) {
      return [];
    }
    final List<dynamic> json = jsonDecode(encodedJobs);
    final List<JobEntity> jobs =
        json.map((element) => JobEntity.fromJson(element)).toList();
    return jobs;
  }

  Future<void> saveJobs(List<JobEntity> jobs) async {
    await _prefs.setString('jobs', jsonEncode(jobs));
  }
}
