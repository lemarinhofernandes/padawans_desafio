import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: () => onClick(),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
