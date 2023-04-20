class Rehabilitation {
  final String title;
  final String id;
  final RehabilitationDetail detail;
  final RehabilitationInfo info;

  Rehabilitation.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        detail = RehabilitationDetail.fromJson(json['detail']),
        info = RehabilitationInfo.fromJson(json['info']);
}

class RehabilitationDetail {
  final String image;
  final String description;

  RehabilitationDetail.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        description = json['des'];
}

class RehabilitationInfo {
  final List<RehabilitationWeek> weeks;

  RehabilitationInfo.fromJson(Map<String, dynamic> json)
      : weeks = (json['weeks'] as List<dynamic>)
            .map((week) => RehabilitationWeek.fromJson(week))
            .toList();
}

class RehabilitationWeek {
  final String name;
  final List<RehabilitationDay> schedule;

  RehabilitationWeek.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        schedule = (json['schedule'] as List<dynamic>)
            .map((day) => RehabilitationDay.fromJson(day))
            .toList();
}

class RehabilitationDay {
  final String name;
  final List<String> schedule;

  RehabilitationDay.fromJson(Map<String, dynamic> json)
      : name = json['nema'],
        schedule = List<String>.from(json['schedule']);
}
