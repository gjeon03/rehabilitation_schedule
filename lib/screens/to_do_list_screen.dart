import 'package:flutter/material.dart';
import 'package:rehabilitation/models/rehabilitation.dart';

class ToDoListScreen extends StatefulWidget {
  final String title;
  final String id;
  final RehabilitationDetail detail;
  final RehabilitationInfo info;
  const ToDoListScreen({
    super.key,
    required this.title,
    required this.detail,
    required this.info,
    required this.id,
  });

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: const Text("data"),
    );
  }
}
