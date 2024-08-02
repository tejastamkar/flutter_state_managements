class QuestionModel {
  final String question;
  final List<String> options;
  final int answer;
  QuestionModel(
      {required this.question, required this.options, required this.answer});

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] as String,
      options: List<String>.from(map['options']),
      answer: map['answer'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'answer': answer,
    };
  }
}
