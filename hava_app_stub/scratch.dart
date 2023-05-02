import 'dart:io';
import 'dart:convert';


// void validate_age(int age) {
//   if(age < 0) {
//     throw new FormatException();
//   }
// }


Future<int> getNum1(){
  return Future.delayed(Duration(seconds: 1),(){
    return 20;
  });
}
Future<int> getNum2() async{
  return Future.delayed(Duration(seconds: 3),(){
    return 10;
  });
}

class ChegException implements Exception{
  final String? message;
  ChegException({this.message});
}
int Calculate(int a , int b){
  if(a==0){
    throw Exception("Should be none zero");
  }
  if (b==0){
    throw ChegException(message: "sefr nabashe");
  }
  return a+b;


}
void main(){
  try{
    print(Calculate(0, 1));
  } on ChegException catch(e){
    print("sefr nabashe");
  }
  catch (e){
    print(e);
    // print(Calculate(9, 10));
  }

  // performTasks();

  // validate_age(-1);
  // try AND catch
  // try {
  //   String mystring = 'abc';
  //   double myStringAsDouble = double.parse(mystring);
  //   print(myStringAsDouble + 5);
  // }
  // catch(e){
  //   print("asghar");
  // }


}
void performTasks() async{
  Task1();
 // String Task2Result =  await  Task2();
  print(Task2());
  // Task3(Task2Result);
}
void Task1(){
  String result = 'task 1 data';
  print('Task 1 compelte');

}
Future<String> Task2() async{

  Duration threeSecend = Duration(seconds: 3);
  String result ="khali";

  await Future.delayed(threeSecend,(){
    result = 'task 2 data';
    print('Task 2 compelte');
  });
  return result;
  // sleep(threeSecend);


}
void Task3(String Task2Data){
  String result = 'task 3 data';
  print('Task 3 compelte ${Task2Data}');

}