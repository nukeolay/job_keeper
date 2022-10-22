import 'package:job_keeper/data/datasources/local_jobs_datasource.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:job_keeper/domain/repositories/jobs_repository.dart';

class JobsRepositoryImpl implements JobsRepository {
  final LocalJobsDatasource _localJobsDatasource;

  const JobsRepositoryImpl({required LocalJobsDatasource localJobsDatasource})
      : _localJobsDatasource = localJobsDatasource;

  @override
  Future<List<JobEntity>> loadJobs() async {
    final jobs = await _localJobsDatasource.loadJobs();
    return jobs;
  }

  @override
  Future<void> saveJobs(List<JobEntity> jobs) async {
    await _localJobsDatasource.saveJobs(jobs);
  }

  @override
  Future<void> saveJob(JobEntity job) async {
    final jobs = await _localJobsDatasource.loadJobs();
    jobs.add(job);
    await _localJobsDatasource.saveJobs(jobs);
  }
}
