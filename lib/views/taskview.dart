import 'package:flutter/material.dart';
import 'package:flutterappprovidertest/model/todoModel.dart';

import 'package:provider/provider.dart';

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        builder: (context) => TodoModel(),
        child: Detailed(),
      ),
    );
  }
}

class Detailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[900],
        appBar: AppBar(
          title: Text("MY Task App"),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60.0,
                  child: Center(
                    child: Text(
                      "02 : 36 PM",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(60)),
                    color: Colors.white),
                child:

                Consumer<TodoModel>(
                  builder: (context,todo,child){
                    return ListView.builder(
                        itemCount: todo.taskList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            child: Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.only(
                                  left: 32.0,
                                ),
                                title: Text(todo.taskList[index].title),
                                subtitle: Text(todo.taskList[index].detail),
                              ),
                            ),
                          );
                        });

                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Provider.of<TodoModel>(context).addTaskInList();

          },
        ));
  }
}
