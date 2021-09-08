import 'package:flutter/material.dart';
import 'package:padawans_desafio/controller/progress.dart';
import 'package:padawans_desafio/http/webclient_post.dart';
import 'package:padawans_desafio/models/post.dart';

class PostTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: FutureBuilder<List<Post>>(
        future: findAllPost(),
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
              final List<Post>? postagens = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  //final Post postagem = postagens![index];
                  return Container(
                    child: DataTable(
                      dataRowHeight: 210.0,
                      horizontalMargin: 10.0,
                      columnSpacing: 10.0,
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('userId'),
                        ),
                        DataColumn(label: Text('id')),
                        DataColumn(label: Text('title')),
                        DataColumn(label: Text('body')),
                      ],
                      rows: postagens!
                          .map((postagem) => DataRow(
                                cells: [
                                  DataCell(Text(postagem.userId.toString())),
                                  DataCell(Text(postagem.id.toString())),
                                  DataCell(Text(postagem.title.toString())),
                                  DataCell(
                                    Text(
                                      postagem.body.toString(),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
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
