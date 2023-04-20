import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabilitation/models/rehabilitation.dart';
import 'package:rehabilitation/models/user_data.dart';
import 'package:rehabilitation/services/api_service.dart';
import 'package:rehabilitation/widgets/to_do_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> colors = [
    const Color(0xFF9DECFE),
    const Color(0xFFFEF86F),
    Colors.white,
  ];
  late Future<List<Rehabilitation>> rehabilitationData;

  late SharedPreferences prefs;

  // final StreamController<List<UserData>> _userDataController =
  //     StreamController<List<UserData>>.broadcast();

  List<UserData> userData = [];

  Future initPrefs() async {
    // const jsonData =
    //     '{"result":[{"id":"1","title":"재활 분류1","complete":false,"user":{"gender":"남자","age":"30","disease":"test","subdivision":"test","when":"test","period":"test"},"progress":{"week":1,"day":2}}]}';
    // final Map<String, dynamic> parsedJson = jsonDecode(jsonData);
    // final userData = UserData.fromJson(parsedJson['result'][0]);
    final tempData = {
      'id': '1',
      'title': '재활 분류1',
      'complete': false,
      'user': {
        'gender': '남자',
        'age': '30',
        'disease': 'test',
        'subdivision': 'test',
        'when': 'test',
        'period': 'test',
      },
      'progress': {
        'week': 1,
        'day': 2,
      },
    };

    final tempData2 = {
      'id': '2',
      'title': '재활 분류1',
      'complete': false,
      'user': {
        'gender': '남자',
        'age': '12',
        'disease': 'test',
        'subdivision': 'test',
        'when': 'test',
        'period': 'test',
      },
      'progress': {
        'week': 3,
        'day': 1,
      },
    };

    prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('data');

    if (data == null) {
      await prefs
          .setStringList('data', [jsonEncode(tempData), jsonEncode(tempData2)]);
    } else {
      userData = data.map((e) => UserData.fromJson(jsonDecode(e))).toList();
    }
    setState(() {});
    for (var item in userData) {
      print("test:: ${item.id}, ${item.title}, ${item.complete}");
    }
  }

  @override
  void initState() {
    super.initState();
    rehabilitationData = ApiService.getRehabilitations();
    ApiService.getRehabilitations().then((value) => {
          for (var item in value)
            {
              print(item.title),
              print(item.id),
              print(item.detail.image),
              print(item.detail.description),
              for (var week in item.info.weeks)
                {
                  print(week.name),
                  for (var day in week.schedule)
                    {
                      print(day.name),
                      for (var task in day.schedule)
                        {
                          print(task),
                        }
                    }
                }
            },
        });
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder(
        future: rehabilitationData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "재활 일정",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Expanded(
                    child: makeList(snapshot),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7C89FF),
        onPressed: () {
          // 버튼이 클릭되었을 때 실행될 코드를 작성합니다.
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

// final String week, day;
//   final RehabilitationDetail detail;
//   final RehabilitationInfo info;
  ListView makeList(AsyncSnapshot<List<Rehabilitation>> snapshot) {
    return ListView.separated(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          final color = colors[index % colors.length];
          final findIndex = snapshot.data!
              .indexWhere((rehab) => rehab.title == userData[index].title);
          return ToDoList(
            color: color,
            week: userData[index].progress.week,
            day: userData[index].progress.day,
            title: userData[index].title,
            detail: snapshot.data![findIndex].detail,
            info: snapshot.data![findIndex].info,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10));
  }
}
