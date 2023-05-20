import 'package:flutter/material.dart';
import 'package:simple_note/extension/format_date.dart';
import 'package:simple_note/models/note.dart';

class CardNote extends StatelessWidget {
  final Note note;

  const CardNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(note.title),
      subtitle: Text(note.desc),
      trailing: Text(
        "Created at : ${note.createdAt.formatDate()}",
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
