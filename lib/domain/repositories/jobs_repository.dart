import 'package:job_keeper/domain/entities/job_entity.dart';

abstract class JobsRepository {
  Future<List<JobEntity>> loadJobs();
  Future<void> saveJobs(List<JobEntity> jobs);
  Future<void> saveJob(JobEntity job);
}
