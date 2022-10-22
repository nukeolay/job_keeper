import 'package:job_keeper/domain/entities/job_entity.dart';

class EditViewModelState {
  final JobEntity? job;
  final bool isLoading;
  final bool isError;

  const EditViewModelState({
    this.job,
    this.isLoading = true,
    this.isError = false,
  });

  EditViewModelState copyWith({
    JobEntity? job,
    bool? isLoading,
    bool? isError,
  }) {
    return EditViewModelState(
      job: job ?? this.job,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
