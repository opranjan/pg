import 'package:flutter/material.dart';
import 'package:pg/views/widgets/app_bar.dart';

class AddTenant extends StatefulWidget {
  const AddTenant({super.key});

  @override
  State<AddTenant> createState() => _AddTenantState();
}

class _AddTenantState extends State<AddTenant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "Add Tenant", ""),
      body:  Center(
      child: Text("Add Tenant"),
    )
    );
  }
}