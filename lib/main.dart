import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 의존성 주입 초기화
  await initializeDependencies();
  
  runApp(const HydroTrackerApp());
}
