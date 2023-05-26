import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/extension/format_date.dart';
import 'package:simple_note/models/note.dart';
import 'package:simple_note/utils/routes.dart';

class CardNote extends StatelessWidget {
  final Note note;

  const CardNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        GoRouter.of(context).pushNamed(
          Approutes.editNote,
          extra: note,
        );
      },
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        note.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        note.desc,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        "Created at : ${note.createdAt.formatDate()}",
        style: TextStyle(fontSize: 10),
        textAlign: TextAlign.start,
      ),
    );
  }
}
