import 'package:flutter/material.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:job_keeper/domain/repositories/jobs_repository.dart';
import 'package:job_keeper/presentation/screens/edit_screen/view_model/edit_view_model_state.dart';

class EditViewModel extends ChangeNotifier {
  final JobsRepository _jobsRepository;
  EditViewModelState _state = const EditViewModelState();

  EditViewModel({required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository;

  Future<void> loadJobById({required String id}) async {
    try {
      final jobs = await _jobsRepository.loadJobs();
      final job = jobs.firstWhere((element) => element.id == id);
      _state = _state.copyWith(job: job, isError: false, isLoading: false);
    } catch (error) {
      _state = _state.copyWith(isError: true, isLoading: false);
    }
    notifyListeners();
  }

  Future<bool> onSavePressed({
    required String id,
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
      final jobs = await _jobsRepository.loadJobs();
      jobs.removeWhere((element) => element.id == id);
      jobs.add(JobEntity.withValidation(
        id: id,
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
      ));
      await _jobsRepository.saveJobs(jobs);
      return true;
    } catch (error) {
      return false;
    }
  }

  EditViewModelState get state => _state;
}
