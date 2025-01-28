class QuizQuestions {
  //thsi is not a widget this will only be a normal class

  const  QuizQuestions(this.questions, this.answers);
  final String questions;
  final List<String> answers;

  List<String> getShuffleAnswers(){//this is the list type
    final shuffledList =List.of(answers);//this first creates a copy
    shuffledList.shuffle();//this shuffles and has a void return type so cant be returned directly
    return shuffledList;//this here is called chaining we are calling a method on the result of another method call
    //shuffle changes the list so we had to create a copy of the existing list 
    //this is using list class//this copies the list automatically
  }
}
