import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:job_keeper/presentation/routes/routes.dart';
import 'package:job_keeper/data/datasources/local_jobs_datasource.dart';
import 'package:job_keeper/data/repositories/jobs_repository_impl.dart';
import 'package:job_keeper/domain/repositories/jobs_repository.dart';
import 'package:job_keeper/presentation/screens/add_screen/view_model/add_view_model.dart';
import 'package:job_keeper/presentation/screens/main_screen/view/main_screen.dart';
import 'package:job_keeper/presentation/screens/main_screen/view_model/main_view_model.dart';
import 'package:job_keeper/presentation/screens/edit_screen/view_model/edit_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final LocalJobsDatasource localJobsDatasource = LocalJobsDatasource(
    prefs: prefs,
  );
  final JobsRepository jobsRepository = JobsRepositoryImpl(
    localJobsDatasource: localJobsDatasource,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainViewModel(jobsRepository: jobsRepository),
    ),
    ChangeNotifierProvider(
      create: (context) => AddViewModel(jobsRepository: jobsRepository),
    ),
    ChangeNotifierProvider(
      create: (context) => EditViewModel(jobsRepository: jobsRepository),
    ),
  ], child: const JobKeeperApp()));
}

class JobKeeperApp extends StatelessWidget {
  const JobKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: Colors.pink, brightness: Brightness.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Keeper',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(colorScheme.primary),
            foregroundColor: MaterialStateProperty.all(colorScheme.onSecondary),
          ),
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      home: const MainScreen(),
    );
  }
}
