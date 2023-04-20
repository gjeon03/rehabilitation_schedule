class UserData {
  final String id;
  final String title;
  final bool complete;
  final User user;
  final Progress progress;

  UserData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        complete = json['complete'],
        user = User.fromJson(json['user']),
        progress = Progress.fromJson(json['progress']);
}

class User {
  final String gender;
  final String age;
  final String disease;
  final String subdivision;
  final String when;
  final String period;

  User.fromJson(Map<String, dynamic> json)
      : gender = json['gender'],
        age = json['age'],
        disease = json['disease'],
        subdivision = json['subdivision'],
        when = json['when'],
        period = json['period'];
}

class Progress {
  final int week;
  final int day;

  Progress.fromJson(Map<String, dynamic> json)
      : week = json['week'],
        day = json['day'];
}
