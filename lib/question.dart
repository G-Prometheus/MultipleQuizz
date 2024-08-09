class Question{
  String questionText = '';
  List<String> questionAnswer = [];
  String correctAnswer = '';

  Question(String q,List<String> a, String c){
    questionText = q;
    questionAnswer = a;
    correctAnswer = c;
  }
}