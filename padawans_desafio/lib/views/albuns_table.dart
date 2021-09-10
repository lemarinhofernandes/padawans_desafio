import 'package:flutter/material.dart';
import 'package:padawans_desafio/controller/progress.dart';
import 'package:padawans_desafio/http/webclients/webclient_album.dart';
import 'package:padawans_desafio/models/album.dart';

class AlbumTable extends StatelessWidget {
  final AlbumWebClient _webClient = AlbumWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: FutureBuilder<List<Album>>(
        future: _webClient.findAllAlbum(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.hasData){
                final List<Album>? albuns = snapshot.data;
                if(albuns!.isNotEmpty){
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
                          rows: albuns
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
                  );
                }
              }

              break;
          }
          return Text('Unknown error');
        },
      ),
    );
  }
}
