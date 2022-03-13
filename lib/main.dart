import 'package:flutter/material.dart';
import 'package:themoviedb/ui/widgets/app/my_app_model.dart';
import 'ui/widgets/app/my_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  final app = MyApp(model: model);
  runApp(app);
}
