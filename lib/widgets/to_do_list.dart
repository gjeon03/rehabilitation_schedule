import 'package:flutter/material.dart';
import 'package:rehabilitation/models/rehabilitation.dart';

class ToDoList extends StatelessWidget {
  final int week, day;
  final String title;
  final RehabilitationDetail detail;
  final RehabilitationInfo info;
  final Color color;

  const ToDoList({
    super.key,
    required this.color,
    required this.week,
    required this.title,
    required this.day,
    required this.detail,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const ToDoListScreen(),
        //   ),
        // );
      },
      child: Container(
        height: 130,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(info.weeks[week].name)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(info.weeks[week].schedule[day].name)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
