
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/models/question.dart';

CollectionReference categoriesCollection = FirebaseFirestore.instance.collection("categories");

Future<List<Category>> getCategories() async {

  List<Category> categories = [];

  await categoriesCollection.get().then((value) async {
    value.docs.forEach((element) {
      categories.add(Category.fromDoc(element));
    });
  });

  return categories;
}

Future<List<Question>> getQuestions(String category) async {
  List<Question> questions = [];
  await categoriesCollection.doc(category).collection("questions").get().then((value) async {
      value.docs.forEach((element) async {
          questions.add(Question.fromDoc(element));
      });
  });
  return questions;
}

Future markQuestionAsAnswered(Question q) async {
  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("answeredQuestions").doc(q.id).set({
    "answeredAt": DateTime.now().millisecondsSinceEpoch,
  });
}

Future<bool> userAnsweredQuestion(Question question) async {
  bool answered = false;

  DocumentReference doc = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("answeredQuestions").doc(question.id);
  await doc.get().then((value) async {
    answered = value.exists;
  });

  return answered;
}

void addPointToUser(int p) async {
  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).get().then((value)async {
    int point = value.get("point");

    point += p;

    await value.reference.set({
      "point": point
    });
  });
}

