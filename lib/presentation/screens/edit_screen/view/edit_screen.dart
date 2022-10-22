import 'package:flutter/material.dart';
import 'package:job_keeper/presentation/common/job_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';
import 'package:job_keeper/presentation/screens/edit_screen/view_model/edit_view_model.dart';
import 'package:job_keeper/presentation/screens/edit_screen/view_model/edit_view_model_state.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late final String _id;

  bool _isInit = true;
  late final EditViewModel _viewModel;
  late EditViewModelState _state;
  late JobEntity? _job;
  late TextEditingController _companyNameController;
  late TextEditingController _companyWebsiteController;
  late TextEditingController _vacancyLinkController;
  late TextEditingController _mainCommentController;
  late TextEditingController _hrContactController;
  late TextEditingController _locationController;
  late TextEditingController _positionController;
  late TextEditingController _vacancySalaryController;
  late TextEditingController _preferredSalaryController;
  late TextEditingController _extraCommentController;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _id = ModalRoute.of(context)!.settings.arguments as String;
      _viewModel = context.watch<EditViewModel>();
      _viewModel.loadJobById(id: _id);
      _isInit = false;
    }
    _state = _viewModel.state;
    _job = _state.job;
    if (_job != null) {
      _companyNameController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.companyName),
      );
      _companyWebsiteController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.companyLink ?? ''),
      );
      _vacancyLinkController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.vacancyLink ?? ''),
      );
      _mainCommentController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.mainComment),
      );
      _hrContactController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.contact ?? ''),
      );
      _locationController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.companyLocation ?? ''),
      );
      _positionController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.position ?? ''),
      );
      _vacancySalaryController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.vacancySalary ?? ''),
      );
      _preferredSalaryController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.preferredSalary ?? ''),
      );
      _extraCommentController = TextEditingController.fromValue(
        TextEditingValue(text: _job!.extraComment ?? ''),
      );
    }
    super.didChangeDependencies();
  }

  Future<bool> _onSavedPressed() async {
    return await _viewModel.onSavePressed(
      id: _id,
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
        title: const Text('Edit job'),
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
            child: _state.isLoading
                ? const CircularProgressIndicator()
                : JobFormWidget(
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
