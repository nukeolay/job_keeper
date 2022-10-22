import 'package:flutter/material.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:job_keeper/domain/repositories/jobs_repository.dart';

class AddViewModel extends ChangeNotifier {
  final JobsRepository _jobsRepository;

  AddViewModel({required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository;

  Future<bool> onSavePressed({
    required String companyName,
    required String companyLink,
    required String vacancyLink,
    required String mainComment,
    required String contact,
    required String companyLocation,
    required String position,
    required String vacancySalary,
    required String preferredSalary,
    required String extraComment,
  }) async {
    try {
      await _jobsRepository.saveJob(
        JobEntity.withValidation(
          id: DateTime.now().toIso8601String(),
          companyName: companyName,
          companyLink: companyLink,
          vacancyLink: vacancyLink,
          mainComment: mainComment,
          contact: contact,
          companyLocation: companyLocation,
          position: position,
          vacancySalary: vacancySalary,
          preferredSalary: preferredSalary,
          extraComment: extraComment,
        ),
      );
      return true;
    } catch (error) {
      return false;
    }
  }
}
