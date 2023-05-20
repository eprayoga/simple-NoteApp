import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_note/models/note.dart';
import 'package:simple_note/utils/routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox('NotesBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey[100],
          primaryColor: Colors.blue[300],
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          )),
      title: "Simple Note",
      routeInformationParser: Approutes.router.routeInformationParser,
      routerDelegate: Approutes.router.routerDelegate,
      routeInformationProvider: Approutes.router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
