import 'package:crudapp/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:todolist/constants/colors.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onUpdateItem;
  final _todoController = TextEditingController();
  ToDoItem(
      {Key? key,
      required this.todo,
      this.onToDoChanged,
      required this.onDeleteItem,
      this.onUpdateItem})
      : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  //const ToDoItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 150,
            height: 20,
            child: TextField(
              controller: _todoController,
              decoration: InputDecoration(
                  hintText: widget.todo.todoText, border: InputBorder.none),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.create),
            onPressed: () {
              widget.onUpdateItem(widget.todo.id!, _todoController.text);
              _todoController.clear();
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.onDeleteItem(widget.todo.id);
            },
          ),
        ),
        // Container(
        //   width: 150,
        //   height: 30,
        //   child: Text('${widget.todo.todoText}'),
        // )
      ],
    );

    //   Container(
    //     margin: EdgeInsets.only(bottom: 20),
    //     child: ListTile(
    //       onTap: () {
    //         //print('Clicked on todo item');
    //         onToDoChanged(todo);
    //       },
    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //       tileColor: Colors.white,
    //       // leading: Icon(
    //       //   todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
    //       //   color: Colors.blueAccent,
    //       // ),
    //       title: Text(
    //         todo.todoText!,
    //         style: TextStyle(
    //           fontSize: 16,
    //           color: Colors.black,
    //           //decoration: todo.isDone ? TextDecoration.lineThrough : null,
    //         ),
    //       ),
    //       trailing: Container(
    //         padding: EdgeInsets.all(0),
    //         height: 35,
    //         width: 35,
    //         decoration: BoxDecoration(
    //             color: Colors.redAccent, borderRadius: BorderRadius.circular(5)),
    //         child: IconButton(
    //           color: Colors.white,
    //           iconSize: 18,
    //           icon: Icon(Icons.delete),
    //           onPressed: () {
    //             //print('clicked on delete icon');
    //             onDeleteItem(todo.id);
    //           },
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}
