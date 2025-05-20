class Teacher {
  final String name;
  final double rating;
  final int followers;
  final List<Subject> subjects;
  final String about;
  final double sessionTime;
  final double sessionPrice;

  Teacher({
    required this.name,
    required this.rating,
    required this.followers,
    required this.subjects,
    required this.about,
    required this.sessionTime,
    required this.sessionPrice,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['name'],
      rating: json['rating'].toDouble(),
      followers: json['followers'],
      subjects: (json['subjects'] as List<dynamic>)
          .map((subjectJson) => Subject.fromJson(subjectJson))
          .toList(),
      about: json['about'],
      sessionTime: json['session_time'].toDouble(),
      sessionPrice: json['session_price'].toDouble(),
    );
  }
}

class Subject {
  final String name;

  Subject({required this.name});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(name: json['name']);
  }
}
