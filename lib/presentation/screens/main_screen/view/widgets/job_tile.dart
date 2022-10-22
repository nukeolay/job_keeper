import 'package:flutter/material.dart';
import 'package:job_keeper/domain/entities/job_entity.dart';

class JobTile extends StatelessWidget {
  final JobEntity job;

  const JobTile({super.key, required this.job});

  Widget _expandedField(String? title, String? value, BuildContext context) {
    if (value != null) {
      return RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final position = job.position == null ? '' : ' (${job.position})';
    final title = '${job.companyName}$position';

    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 10.0,
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            job.mainComment,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).errorColor,
            ),
          ),
        ],
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _expandedField('preferred salary: ', job.preferredSalary, context),
            _expandedField('vacancy salary: ', job.vacancySalary, context),
            _expandedField('website: ', job.companyLink, context),
            _expandedField('location: ', job.companyLocation, context),
            _expandedField('contact: ', job.contact, context),
            _expandedField('vacancy link: ', job.vacancyLink, context),
            _expandedField(null, job.extraComment, context),
            const SizedBox(height: 5),
            Text(
              'Hold to edit',
              style: TextStyle(color: Theme.of(context).hintColor),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }
}
