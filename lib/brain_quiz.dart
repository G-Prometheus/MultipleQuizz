import 'question.dart';

class BrainQuiz {
  int questionNumber = 0;
  List<Question> _questionBank = [
       Question("Which is the largest organ in the human body?", ["Heart", "Skin", "Large Intestine"],"Skin"),
        Question( "Five dollars is worth how many nickels?", ["25", "50", "100"],"100"),
        Question("What do the letters in the GMT time zone stand for?", ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], "Greenwich Mean Time"),
        Question("What is the French word for 'hat'?",  ["Chapeau", "Écharpe", "Bonnet"],"Chapeau"),
        Question("In past times, what would a gentleman keep in his fob pocket?", ["Notebook", "Handkerchief", "Watch"], "Watch"),
        Question("How would one say goodbye in Spanish?",["Au Revoir", "Adiós", "Salir"],  "Adiós"),
        Question("Which of these colours is NOT featured in the logo for Google?",["Green", "Orange", "Blue"], "Orange"),
        Question("What alcoholic drink is made from molasses?",["Rum", "Whisky", "Gin"], "Rum"),
        Question( "What type of animal was Harambe?",["Panda", "Gorilla", "Crocodile"],  "Gorilla"),
        Question("Where is Tasmania located?",["Indonesia", "Australia", "Scotland"],  "Australia")
  ];
  void nextQuestion(){
    if(questionNumber + 1 < _questionBank.length){
      questionNumber +=  1;
    }else{
      questionNumber = 0;
    }
  }
  String getQuestion(){
    return _questionBank[questionNumber].questionText;
  }
  List<String> getAnswert(){
    return _questionBank[questionNumber].questionAnswer;
  }
  bool checkAnswer(String useAnswer){
    if(useAnswer == _questionBank[questionNumber].correctAnswer){
      return true;
    }else{
      return false;
    }
  }
}
