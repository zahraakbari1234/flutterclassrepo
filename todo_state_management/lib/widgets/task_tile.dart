import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {

  final bool isChecked ;
  final String taskTitle;
  final Function checkBoxState ;

  TaskTile({required this.taskTitle , required this.isChecked , required this.checkBoxState});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text( taskTitle ,
      style: TextStyle(
        decoration: (isChecked  ? TextDecoration.lineThrough : null)
      ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          checkBoxState(value);
        },
      )
    );
  }
}


// class TaskCheckBox extends StatelessWidget{
//
//   final bool checkBoxState ;
//   TaskCheckBox({required this.checkBoxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       onChanged: (value) {
//         // setState(() {
//         //   _isChecked = value!;
//         // });
//
//       },
//     );
//   }
// }