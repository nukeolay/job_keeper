import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:job_keeper/presentation/screens/main_screen/view/widgets/job_tile.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:job_keeper/presentation/screens/main_screen/view_model/main_view_model_state.dart';
import 'package:job_keeper/presentation/routes/routes.dart';
import 'package:job_keeper/presentation/screens/main_screen/view_model/main_view_model.dart';

class JobCard extends StatefulWidget {
  const JobCard({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool _isInit = true;
  late final MainViewModel _viewModel;
  late MainViewModelState _state;
  late JobEntity _job;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _viewModel = context.watch<MainViewModel>();
      _isInit = false;
    }
    _state = _viewModel.state;
    _job = _state.jobs.firstWhere((element) => element.id == widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey(widget.id),
        background: Container(
          padding: const EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
          ),
        ),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (direction) => showDialog(
          context: context,
          builder: (context) => _dismissDialog(context),
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: InkWell(
            onLongPress: _onCardLongPress,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                dividerColor: Colors.transparent,
                dividerTheme: const DividerThemeData(
                  color: Colors.transparent,
                  endIndent: 0,
                  indent: 0,
                  space: 0,
                  thickness: 0,
                ),
              ),
              child: JobTile(job: _job),
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog _dismissDialog(BuildContext context) {
    return AlertDialog(
      content: const Text('Delete this job?'),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async => _viewModel
              .deleteJob(id: widget.id)
              .then((_) => Navigator.of(context).pop()),
          child: const Text('Delete'),
        )
      ],
    );
  }

  void _onCardLongPress() {
    HapticFeedback.vibrate();
    Navigator.of(context)
        .pushNamed(
          Routes.edit,
          arguments: widget.id,
        )
        .then((_) => _viewModel.update());
  }
}
