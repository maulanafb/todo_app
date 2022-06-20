import 'package:flutter/material.dart';

import '../models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = dataTodo;
  @override
  Widget build(BuildContext context) {
    AppBar myAppBar = AppBar(
      title: Text('TodoApp'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_todo');
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: widthBody,
              height: heightBody * 0.15,
              child: TextField(
                onChanged: searchTodo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari Data '),
              ),
            ),
            todos.length != 0
                ? Container(
                    height: heightBody * 0.85,
                    width: widthBody,
                    child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                todo.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: todo.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              subtitle: Text(todo.desc),
                              secondary: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                ),
                                onPressed: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                              ),
                              value: todo.isCompleted,
                              onChanged: (value) {
                                setState(() {
                                  todo.isCompleted = value!;
                                });
                              });
                        }),
                  )
                : Center(
                    child: Text('Data kosong'),
                  ),
          ],
        ),
      ),
    );
  }
}
