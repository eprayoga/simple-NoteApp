import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/services/database_service.dart';

import '../models/note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key, this.note});

  final Note? note;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _titleCtrl;
  late TextEditingController _descriptionCtrl;

  final DatabaseService dbSevice = DatabaseService();

  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _descriptionCtrl = TextEditingController();

    if (widget.note != null) {
      _titleCtrl.text = widget.note!.title;
      _descriptionCtrl.text = widget.note!.desc;
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.note != null ? "Edit Note" : "Add new notes",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "Judul tidak boleh kosong!";
                  } else {
                    return null;
                  }
                },
                controller: _titleCtrl,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
              // const Divider(thickness: 1),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "Deskripsi tidak boleh kosong!";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.multiline,
                controller: _descriptionCtrl,
                minLines: null,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Note note = Note(
              title: _titleCtrl.text,
              desc: _descriptionCtrl.text,
              createdAt: DateTime.now().toIso8601String(),
            );

            if (widget.note != null) {
              dbSevice.updateNote(widget.note!.key, note).then((_) {
                GoRouter.of(context).pop();
              });
            } else {
              dbSevice.addNote(note).then((_) {
                GoRouter.of(context).pop();
              });
            }
          }
        },
        label: const Text("Save Note"),
      ),
    );
  }
}
