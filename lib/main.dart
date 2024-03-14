//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crudapp/model/todo.dart';
import 'package:crudapp/widgets/todo_item.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('CRUD APP'),
          centerTitle: true,
        ),
        body: SizedBox(
          width: _width,
          child: Column(children: [
            Row(
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
                    width: _width / 2,
                    height: 20,
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: 'Add item', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, top: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blueAccent,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Container(
            //       margin: EdgeInsets.all(20),
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         boxShadow: const [
            //           BoxShadow(
            //             color: Colors.grey,
            //             offset: Offset(0.0, 0.0),
            //             blurRadius: 10.0,
            //             spreadRadius: 0.0,
            //           ),
            //         ],
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: SizedBox(
            //         width: _width / 2,
            //         height: 20,
            //         child: TextField(
            //           decoration: InputDecoration(
            //               hintText: 'Add item', border: InputBorder.none),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.symmetric(horizontal: 8.0),
            //       padding: EdgeInsets.all(0),
            //       height: 35,
            //       width: 35,
            //       decoration: BoxDecoration(
            //           color: Colors.blueAccent,
            //           borderRadius: BorderRadius.circular(5)),
            //       child: IconButton(
            //         color: Colors.white,
            //         iconSize: 18,
            //         icon: Icon(Icons.create),
            //         onPressed: () {},
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.all(0),
            //       height: 35,
            //       width: 35,
            //       decoration: BoxDecoration(
            //           color: Colors.redAccent,
            //           borderRadius: BorderRadius.circular(5)),
            //       child: IconButton(
            //         color: Colors.white,
            //         iconSize: 18,
            //         icon: Icon(Icons.delete),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'All ToDos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (ToDo todo in _foundToDo.reversed)
                    ToDoItem(
                      todo: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                      onUpdateItem: _updateToDoItem,
                    ),
                ],
              ),
            )
          ]),
        ));
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _updateToDoItem(String id, String toDo) {
    setState(() {
      // todosList[id].todoText = toDo;
      for (int i = 0; i < todosList.length; i++) {
        if (todosList[i].id == id) {
          todosList[i].todoText = toDo;
        }
      }
    });
    _todoController.clear();
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }
}
