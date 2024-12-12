import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

AppBar mainAppBar(
  BuildContext context,
  String defaultTitle, {
  required Rx<String?> titleObservable,  // Listen to the reactive property name
  onpress,
  List<Widget>? action,
  bool isIcon = false,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: Theme.of(context).focusColor),
    backgroundColor: Theme.of(context).primaryColor,
    title: Row(
      children: [
        // Use Obx to reactively rebuild the widget when propertyNameObs changes
        Obx(() {
          return Text(
            titleObservable.value ?? defaultTitle,  // Show the reactive property name or fallback to default
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).focusColor,
            ),
          );
        }),
        // Icon button based on isIcon
        Visibility(
          visible: !isIcon,
          child: IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: onpress,
          ),
        ),
      ],
    ),
    actions: action,
  );
}
