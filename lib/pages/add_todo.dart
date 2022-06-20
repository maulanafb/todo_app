import 'package:flutter/material.dart';
import 'package:todo_app/models/model.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleC = TextEditingController();
    TextEditingController keteranganC = TextEditingController();
    AppBar myAppBar = AppBar(
      title: Text('Todo Add'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleC.text.length != 0 || keteranganC.text.length != 0) {
            dataTodo.add(Todo(
                id: DateTime.now().toString(),
                title:
                    titleC.text.length == 0 ? 'Tidak ada title' : titleC.text,
                desc: keteranganC.text.length == 0
                    ? 'Tidak ada Keterangan'
                    : keteranganC.text));
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.add_task),
      ),
      appBar: myAppBar,
      body: SingleChildScrollView(
          child: Container(
        width: widthBody,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: titleC,
              maxLength: 20,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Masukkan Title'),
            ),
          ),
          SizedBox(
            height: heightBody * 0.05,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: keteranganC,
              maxLines: 10,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Masukkan Keterangan'),
            ),
          ),
        ]),
      )),
    );
  }
}
