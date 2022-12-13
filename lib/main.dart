import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/core/values/colors.dart';
import 'package:getx_todo/app/core/values/hive_boxes.dart';
import 'package:getx_todo/app/data/providers/database_provider.dart';
import 'package:getx_todo/app/view/home.dart';
import 'package:getx_todo/app/model/todo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  DatabaseProvider db = DatabaseProvider.instance;
  await db.hiveBoxInitialization<Todo>(
    TodoAdapter(),
    appDocumentDirectory.path,
    todosBoxName,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // change the focus border color of the TextField
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: orange),
        // change the focus border color when the errorText is set
        errorColor: Colors.purple,
      ),
      home: const Home(),
    );
  }
}
