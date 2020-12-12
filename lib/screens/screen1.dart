import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';
import 'package:todo_app/navigation/routes.dart';
import 'package:todo_app/widgets/strikethrough_widget.dart';

import 'base_state.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends BaseStatefulState<TodoList> with RouteAware {
  List<Todo> todos = [
    new Todo(
        title: 'Design', description: 'Need to complete design', isDone: false),
    new Todo(title: 'Build', description: 'Generate build', isDone: false),
    new Todo(
        title: 'Login',
        description: 'Need to design the login page',
        isDone: false),
  ];

  Widget _buildListTile(BuildContext ctx, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        _toggleListItem(todo, isChecked);
      },
    );
  }

  @override
  void didPushNext() {
    super.didPushNext();
  }

  @override
  void didPopNext() {
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
                  child: Text(
                    'My ToDos',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              IconButton(
                icon: Icon(Icons.sort),
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    todos = todos.reversed.toList();
                  });
                },
              ),
            ],
          ),
          Expanded(
              child: ReorderableListView(
            children: <Widget>[
              for (final todo in todos)
                GestureDetector(
                    key: Key(todo.title),
                    child: CheckboxListTile(
                      value: todo.isDone,
                      title: StrikeThrough(todo.title, todo.isDone),
                      subtitle: StrikeThrough(todo.description, todo.isDone),
                      onChanged: (bool isChecked) {
                        _toggleListItem(todo, isChecked);
                      },
                    )),
            ],
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                var replaceWiget = todos.removeAt(oldIndex);
                todos.insert(newIndex, replaceWiget);
              });
            },
          )),
          RaisedButton(
            color: Colors.blue,
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _addTodo(context);
            },
          )
        ],
      ),

      /* ListView.builder(
        itemCount: todos.length,
        itemBuilder: _buildListTile,
      ), */
      /*  floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ), */
    );
  }

  void _toggleListItem(Todo todo, bool isChecked) {
    setState(() {
      if (!isChecked) {
        todo.isDone = false;
      } else {
        todo.isDone = true;
      }
    });
  }

  _addTodo(BuildContext context) {
    Navigator.pushNamed(context, TDRoutes.screen2, arguments: todos);
  }
}
