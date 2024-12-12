import 'package:flutter/material.dart';

AppBar commonAppBar(context, title, {onpress, List<Widget>? action ,bool isIcon =false}) {
  return AppBar(
    iconTheme: IconThemeData(color: Theme.of(context).focusColor),
    backgroundColor: Theme.of(context).primaryColor,
    title: Row(
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: title, style: TextStyle(fontSize: 15, color: Theme.of(context).focusColor)),
              // TextSpan(
              //     text: role.padLeft(11),
              //     style: TextStyle(
                      
              //         fontWeight: FontWeight.bold,
              //         color: Theme.of(context).focusColor)),
                     
            ],
          ),
        ),

       Visibility(
  visible: !isIcon,  // Shows the icon only when isIcon is false
  child: IconButton(
    icon: Icon(
      Icons.keyboard_arrow_down
    ), onPressed: onpress,
  ),
)
      ],
    ),
    actions: action,
  );
}
