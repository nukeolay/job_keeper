import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:job_keeper/presentation/common/job_form_widget.dart';
import 'package:job_keeper/presentation/screens/add_screen/view_model/add_view_model.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool _isInit = true;
  late final AddViewModel _viewModel;

  final _companyNameController = TextEditingController();
  final _companyWebsiteController = TextEditingController();
  final _vacancyLinkController = TextEditingController();
  final _mainCommentController = TextEditingController();
  final _hrContactController = TextEditingController();
  final _locationController = TextEditingController();
  final _positionController = TextEditingController();
  final _vacancySalaryController = TextEditingController();
  final _preferredSalaryController = TextEditingController();
  final _extraCommentController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _viewModel = context.read<AddViewModel>();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  Future<bool> _onSavedPressed() async {
    return await _viewModel.onSavePressed(
      companyName: _companyNameController.text,
      companyLink: _companyWebsiteController.text,
      vacancyLink: _vacancyLinkController.text,
      mainComment: _mainCommentController.text,
      contact: _hrContactController.text,
      companyLocation: _locationController.text,
      position: _positionController.text,
      vacancySalary: _vacancySalaryController.text,
      preferredSalary: _preferredSalaryController.text,
      extraComment: _extraCommentController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new job'),
        actions: [
          IconButton(
            onPressed: () async => _onSavedPressed().then(
              (value) => value ? Navigator.of(context).pop() : null,
            ),
            icon: const Icon(Icons.done_rounded),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: JobFormWidget(
                companyNameController: _companyNameController,
                companyWebsiteController: _companyWebsiteController,
                vacancyLinkController: _vacancyLinkController,
                mainCommentController: _mainCommentController,
                hrContactController: _hrContactController,
                locationController: _locationController,
                positionController: _positionController,
                vacancySalaryController: _vacancySalaryController,
                preferredSalaryController: _preferredSalaryController,
                extraCommentController: _extraCommentController),
          ),
        ),
      ),
    );
  }
}
