import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../screens/drawer/setting/widgets/forward_button.dart';

class ClasslistDrawet extends StatelessWidget {
  ClasslistDrawet({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final dynamic Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            width: 22,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontFamily: "Cairo",
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ForwardButton(
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
