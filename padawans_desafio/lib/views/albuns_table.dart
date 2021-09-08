import 'package:flutter/material.dart';
import 'package:padawans_desafio/controller/progress.dart';
import 'package:padawans_desafio/http/webclient_album.dart';
import 'package:padawans_desafio/models/album.dart';

class AlbumTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: FutureBuilder<List<Album>>(
        future: findAllAlbum(),
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
              final List<Album>? albuns = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  //final Album album = albuns![index];
                  return Container(
                    child: DataTable(
                      horizontalMargin: 10.0,
                      showBottomBorder: true,
                      columns: <DataColumn>[
                        DataColumn(label: Text('userId')),
                        DataColumn(label: Text('id')),
                        DataColumn(label: Text('title')),
                      ],
                      rows: albuns!
                          .map((album) => DataRow(
                                cells: [
                                  DataCell(Text(album.userId.toString())),
                                  DataCell(Text(album.id.toString())),
                                  DataCell(Text(album.title.toString())),
                                ],
                              ))
                          .toList(),
                    ),
                  );
                },
                //itemCount: albuns!.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
    );
  }
}
