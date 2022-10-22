import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:job_keeper/presentation/routes/routes.dart';
import 'package:job_keeper/presentation/screens/main_screen/view_model/main_view_model.dart';
import 'package:job_keeper/presentation/screens/main_screen/view_model/main_view_model_state.dart';
import 'package:job_keeper/presentation/screens/main_screen/view/widgets/job_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isInit = true;
  late MainViewModel _viewModel;
  late MainViewModelState _state;
  late List<JobEntity> _jobs;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _viewModel = context.watch<MainViewModel>();
      _isInit = false;
    }
    _state = _viewModel.state;
    _jobs = _state.jobs;
    _jobs = _jobs.reversed.toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Keeper'),
      ),
      body: Center(
        child: _state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _jobs.isEmpty
                ? const Text('No jobs added yet')
                : ListView.builder(
                    itemCount: _jobs.length,
                    itemBuilder: (context, index) {
                      return JobCard(id: _jobs[index].id);
                    }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(Routes.add)
            .then((_) => _viewModel.update()),
        tooltip: 'Add new job',
        child: const Icon(Icons.add),
      ),
    );
  }
}
