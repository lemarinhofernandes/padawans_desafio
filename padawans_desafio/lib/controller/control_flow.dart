import 'package:flutter/material.dart';
import 'package:padawans_desafio/views/albuns_table.dart';
import 'package:padawans_desafio/views/posts_table.dart';
import 'package:padawans_desafio/views/todos_table.dart';

class ControlFlow{
  void showAlbuns(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlbumTable(),
      ),
    );
  }

  void showPosts(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostTable(),
      ),
    );
  }

  void showTodos(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoTable(),
      ),
    );
  }
}


