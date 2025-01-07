import 'package:flutter/material.dart';

class PropertyLayout extends StatelessWidget {
  final String name;
  final List<PropertyItem> propertyItems;

  const PropertyLayout({
    Key? key,
    required this.name,
    required this.propertyItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
       borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with icon and name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.home, color: Theme.of(context).primaryColor),
                    SizedBox(width: 8.0),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // List of property items
              ...propertyItems.map((item) => _buildPropertyItemRow(item)).toList(),
      
              SizedBox(height: 10,),
      
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10), bottomRight:Radius.circular(10) )
                ),
                child: Text("Share My Website", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyItemRow(PropertyItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(item.icon, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                item.title,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Text(
            item.value,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PropertyItem {
  final IconData icon;
  final String title;
  final String value;

  PropertyItem({
    required this.icon,
    required this.title,
    required this.value,
  });
}
