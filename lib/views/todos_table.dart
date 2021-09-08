import 'package:flutter/material.dart';
import 'package:padawans_desafio/controller/progress.dart';
import 'package:padawans_desafio/http/webclient_todo.dart';
import 'package:padawans_desafio/models/todo.dart';

class TodoTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: findAllTodo(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Todo>? todos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    //scrollDirection: Axis.horizontal,
                    child: Container(
                      child: DataTable(
                        dataRowHeight: 80.0,
                        horizontalMargin: 10.0,
                        columnSpacing: 40.0,
                        showBottomBorder: true,
                        columns: <DataColumn>[
                          DataColumn(label: Text('userId')),
                          DataColumn(label: Text('id')),
                          DataColumn(label: Text('title')),
                          DataColumn(label: Text('completed')),
                        ],
                        rows: todos!
                            .map((todo) => DataRow(
                                  cells: [
                                    DataCell(Text(todo.userId.toString())),
                                    DataCell(Text(todo.id.toString())),
                                    DataCell(Text(todo.title.toString())),
                                    DataCell(Text(todo.completed.toString())),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  );
                },
                //itemCount: postagens!.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
    );
  }
}
