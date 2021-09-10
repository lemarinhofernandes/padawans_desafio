import 'package:flutter/material.dart';
import 'package:padawans_desafio/controller/control_flow.dart';
import 'package:padawans_desafio/models/feature_item.dart';

class Dashboard extends StatelessWidget {
  final ControlFlow _controlFlow = ControlFlow();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9,231,218,0.85),
      appBar: AppBar(
        title: Center(child: Text('Seja bem vindo, Padawan!')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/disp/4dc45932138533.56befc47f11dc.gif'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FeatureItem(
                  'POSTAGENS',
                  Icons.arrow_upward,
                  onClick: () => _controlFlow.showPosts(context),
                ),
                FeatureItem(
                  'ALBUNS',
                  Icons.album,
                  onClick: () => _controlFlow.showAlbuns(context),
                ),
                FeatureItem(
                  'TO-DOs',
                  Icons.description,
                  onClick: () => _controlFlow.showTodos(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
