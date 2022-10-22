import 'package:flutter/material.dart';

class JobFormWidget extends StatelessWidget {
  const JobFormWidget({
    Key? key,
    required TextEditingController companyNameController,
    required TextEditingController companyWebsiteController,
    required TextEditingController vacancyLinkController,
    required TextEditingController mainCommentController,
    required TextEditingController hrContactController,
    required TextEditingController locationController,
    required TextEditingController positionController,
    required TextEditingController vacancySalaryController,
    required TextEditingController preferredSalaryController,
    required TextEditingController extraCommentController,
  })  : _companyNameController = companyNameController,
        _companyWebsiteController = companyWebsiteController,
        _vacancyLinkController = vacancyLinkController,
        _mainCommentController = mainCommentController,
        _hrContactController = hrContactController,
        _locationController = locationController,
        _positionController = positionController,
        _vacancySalaryController = vacancySalaryController,
        _preferredSalaryController = preferredSalaryController,
        _extraCommentController = extraCommentController,
        super(key: key);

  final TextEditingController _companyNameController;
  final TextEditingController _companyWebsiteController;
  final TextEditingController _vacancyLinkController;
  final TextEditingController _mainCommentController;
  final TextEditingController _hrContactController;
  final TextEditingController _locationController;
  final TextEditingController _positionController;
  final TextEditingController _vacancySalaryController;
  final TextEditingController _preferredSalaryController;
  final TextEditingController _extraCommentController;

  final InputDecoration _inputDecoration = const InputDecoration(
    contentPadding: EdgeInsets.all(8.0),
    isCollapsed: true,
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          const SizedBox(height: 5),
          const Text('Company Name *'),
          TextField(
            controller: _companyNameController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Company Website'),
          TextField(
            controller: _companyWebsiteController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Vacancy Link'),
          TextField(
            controller: _vacancyLinkController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Main Comment *'),
          TextField(
            controller: _mainCommentController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('HR Contact Info'),
          TextField(
            controller: _hrContactController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Location'),
          TextField(
            controller: _locationController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Position'),
          TextField(
            controller: _positionController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Vacancy Salary'),
          TextField(
            controller: _vacancySalaryController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Preferred Salary'),
          TextField(
            controller: _preferredSalaryController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
          const Text('Extra Comment'),
          TextField(
            minLines: 5,
            maxLines: 10,
            controller: _extraCommentController,
            decoration: _inputDecoration,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
