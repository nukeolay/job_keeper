import 'package:job_keeper/domain/entities/job_entity.dart';

class MainViewModelState {
  final List<JobEntity> jobs;
  final bool isLoading;
  final bool isError;

  const MainViewModelState({
    this.jobs = const [],
    this.isLoading = true,
    this.isError = false,
  });

  MainViewModelState copyWith({
    List<JobEntity>? jobs,
    bool? isLoading,
    bool? isError,
  }) {
    return MainViewModelState(
      jobs: jobs ?? this.jobs,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
