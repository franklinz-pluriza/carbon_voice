import 'package:carbon_voice/data/repositories/repositories_helper.dart';
import 'package:carbon_voice/domain/managers/managers_helper.dart';
import 'package:carbon_voice/ui/app.dart';
import 'package:carbon_voice/ui/controllers/controllers_helper.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RepositoriesHelper.initRepositories();
  ManagersHelper.initManagers();
  ControllersHelper.initControllers();
  await Hive.initFlutter();
  runApp(const CarbonVoiceApp());
}
