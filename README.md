# finalproject_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Project Report

First of all i wanted to continue my previous quiz app aplication and develop it into a quiz show. Users will answers questions from four category and they will get a point for each question. After that they can use these points for some rewards.
I created three category models for categories, questions and reward. I created category file with taking datas from firebase database with from.Doc method. I used this method also in question data. I created reward codes manuel and put minimum points for each reward. In the networking part i created different file for firebase operations to seperate it from the interface. In here i used four categories to list the data. I used markQuestionAsAnswered part to prevent user get point from one questions again and again. Also it keeps data for each question that answered by the user. addPointToUser part is used to add points for each question. I created a sign-in part to change app look more professional way. User will sign-in with their gmail in this part. In the pages part i created gradient for each category and i used the values with getCategories and setCategories. Also i add signoutGoogle method for giving opportunity to user to sign out but i use pushReplacement instead of push because i didn't want to use them back button in this stage. Then i used FutureBuilder to get the point. In the market page user can see all of the rewards but this is a symbolic page. In the questions-page, i used start timer to start the 60 second countdown because user have to finish the one category under 60 seconds. In the result_page part it calculate the points that users got from categories.

