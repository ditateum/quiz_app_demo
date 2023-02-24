class Question {
  final String title;
  final String desc;
  final Map<String, bool> options;

  Question({
    required this.title,
    required this.desc,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(desc: $desc, title: $title, options: $options)';
  }
}
