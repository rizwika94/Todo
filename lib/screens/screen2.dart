import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/entities/todo.dart';

class EditTodoList extends StatefulWidget {
  @override
  _EditTodoListState createState() => _EditTodoListState();
}

class _EditTodoListState extends State<EditTodoList> with RouteAware {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var popUpTitleController = TextEditingController();
  var popUpDescriptionController = TextEditingController();
  List<Todo> todos = [];

  @override
  void didPushNext() {
    super.didPushNext();
  }

  @override
  void didPop() {
    Navigator.of(context).pop(todos);
    super.didPop();
  }

  @override
  void dispose() {
    titleController.dispose();
    popUpTitleController.dispose();
    descriptionController.dispose();
    popUpDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    todos = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Text('Add Todo'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Enter Todo Title Here"),
                style: TextStyle(
                  fontSize: 18.0,
                ),
                controller: titleController,
                cursorWidth: 5.0,
                autocorrect: true,
                autofocus: true,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: TextField(
                decoration:
                    InputDecoration(hintText: "Enter Todo Description Here"),
                style: TextStyle(
                  fontSize: 18.0,
                ),
                controller: descriptionController,
                cursorWidth: 5.0,
                autocorrect: true,
                autofocus: true,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text("Add Todo"),
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
                    todos.add(new Todo(
                        title: titleController.text,
                        description: descriptionController.text,
                        isDone: false));
                    titleController.clear();
                    descriptionController.clear();
                  });
                }
              },
            ),
            SizedBox(
              height: 8,
            ),
            for (final todo in todos)
              SingleChildScrollView(
                //  child: GestureDetector(
                // key: Key(todo.title),
                child: Dismissible(
                  key: Key(todo.title),
                  child: Card(
                      child: ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      todo.description,
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                    onTap: () {
                      popUpTitleController.text = todo.title;
                      popUpDescriptionController.text = todo.description;
                      //For Editing Todo
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Edit Todo"),
                              content: Column(
                                children: [
                                  TextFormField(
                                    controller: popUpTitleController,
                                  ),
                                  TextFormField(
                                    controller: popUpDescriptionController,
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    setState(() {
                                      todo.title = popUpTitleController.text;
                                      todo.description =
                                          popUpDescriptionController.text;
                                    });
                                    Navigator.of(context).pop(true);
                                  },
                                ), //OK Button
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ), //Cancel Button
                              ],
                            );
                          });
                    },
                  )),
                  background: Container(
                    child: Icon(Icons.delete),
                    alignment: Alignment.centerRight,
                    color: Colors.orange[300],
                  ),
                  confirmDismiss: (dismissDirection) {
                    return showDialog(
                        //On Dismissing
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Delete Todo?"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ), //OK Button
                              FlatButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ), //Cancel Button
                            ],
                          );
                        });
                  },
                  direction: DismissDirection.endToStart,
                  movementDuration: const Duration(milliseconds: 200),
                  onDismissed: (dismissDirection) {
                    //Delete Todo
                    todos.remove(todo);
                    Fluttertoast.showToast(msg: "Todo Deleted!");
                  },
                ),
                // onDoubleTap: () {},
                // )
              )
          ],
        ));
  }
}
