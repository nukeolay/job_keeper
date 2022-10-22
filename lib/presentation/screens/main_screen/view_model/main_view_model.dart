import 'package:flutter/material.dart';
import 'package:job_keeper/domain/repositories/jobs_repository.dart';
import 'package:job_keeper/presentation/screens/main_screen/view_model/main_view_model_state.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModelState _state = const MainViewModelState();
  final JobsRepository _jobsRepository;

  MainViewModel({required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository {
    update();
  }

  Future<void> update() async {
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();
    try {
      final jobs = await _jobsRepository.loadJobs();
      _state = _state.copyWith(
        jobs: jobs,
        isLoading: false,
      );
    } catch (error) {
      _state = _state.copyWith(
        isLoading: false,
        isError: true,
      );
    }
    notifyListeners();
  }

  Future<void> deleteJob({required String id}) async {
    try {
      final jobs = _state.jobs;
      jobs.removeWhere((element) => element.id == id);
      _state = _state.copyWith(jobs: jobs);
      await _jobsRepository.saveJobs(jobs);
    } catch (error) {
      _state = _state.copyWith(
        isLoading: false,
        isError: true,
      );
    }
    notifyListeners();
  }

  MainViewModelState get state => _state;
}
