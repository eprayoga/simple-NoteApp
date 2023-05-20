import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_note/models/note.dart';

import '../component/card_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Simple Note Apps",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box("notesBox").listenable(),
        builder: (context, box, child) {
          if (box.values.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit_document,
                      size: 50,
                    ),
                    SizedBox(height: 10),
                    Text("Create Your Notes"),
                  ],
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: box.length,
              itemBuilder: (context, index) {
                Note currentNote = box.getAt(index);
                return CardNote(note: currentNote);
              },
            );
          }
          ;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed('addNote');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
