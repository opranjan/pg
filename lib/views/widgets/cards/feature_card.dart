
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget featureCard({
  required IconData icon,
  required String title,
  required String data,
  required Color iconColor,
}) {
  return Material(
    elevation: 3,
     borderRadius: BorderRadius.circular(5),
    child: Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
         borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: [
            // Data above icon and title
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$data',
                  style:  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                     title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 82, 7)
                        .withOpacity(0.2), // Soft background for icon
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    size: 20,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget moneyCard({
  required String buildingName,
  required String unpaiddues,
  required String noofunpaidtenant,
  required String todaysCollection,
  required String thisMonthCollection,
  required String thisMonthExpanse,
  required VoidCallback onPressed,
  required BuildContext context
}) {
  
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Theme.of(context).cardColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    buildingName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Current",
                      style: TextStyle(color: Theme.of(context).canvasColor,),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey.shade300,
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _buildRow(
                    title: 'Unpaid Dues',
                    amount: "₹ $unpaiddues",
                    count: noofunpaidtenant,
                    color: Colors.red,
                  ),
                  SizedBox(height: 8),
                  _buildRow(
                    title: 'Today\'s Collection',
                    amount: "₹ $todaysCollection",
                    count: noofunpaidtenant,
                    color: Colors.green,
                  ),
                  SizedBox(height: 8),
                  _buildRow(
                    title: 'This Month Collection',
                    amount: "₹ $thisMonthCollection",
                    count: noofunpaidtenant,
                    color: Colors.green,
                  ),
                  SizedBox(height: 8),
                  _buildRow(
                    title: 'This Month Expenses',
                    amount: "₹ $thisMonthExpanse",
                    count: '',
                    color: Colors.orange,
                    showIcon: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Helper Method to Build Each Row
Widget _buildRow({
  required String title,
  required String amount,
  required String count,
  required Color color,
  bool showIcon = true,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      Row(
        children: [
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          if (showIcon) ...[
            SizedBox(width: 8),
            Icon(Icons.people, color: color, size: 18),
            SizedBox(width: 8),
            Text(
              count,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ],
      ),
    ],
  );
}

Widget duesCard({
  required BuildContext context,
  required String tenantName,
  required String tenantDues,
  required String duesDate,
}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row with Icon and Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tenantName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Bold title for emphasis
                  color: Colors.black87, // Text color
                ),
              ),
              const SizedBox(width: 10), // Space between icon and text
              Text(
                tenantDues,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Bold title for emphasis
                  color: Colors.red, // Text color
                ),
              ),
            ],
          ),
          const SizedBox(height: 15), // Spacing between rows
          
          // Row with fixed value and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bed),
                  Text(
                    "Smart",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          FontWeight.w600, // Slightly bold for emphasis
                      color: Colors.grey[700], // Dark grey color for contrast
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Add Dues",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        FontWeight.w500, // Slightly less bold for the button
                    color: Colors.blueAccent, // Button text color
                  ),
                  
                  
                ),
              ),
            ],
          ),
          
          Divider(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          // Record Payment Button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding for a larger button
            
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      side: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2, // Border width
      ),
            ),
            child: Text(
      "Record Payment",
      style: TextStyle(
        color: Theme.of(context).primaryColor, // Text color
        fontWeight: FontWeight.bold, // Bold text
        fontSize: 12, // Text size
      ),
            ),
          ),
          
          // Remind To Pay Button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
            ),
            child: Text(
      "Remind To Pay",
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
            ),
          ),
            ],
          )
          
        ],
      ),
    ),
  );
}







Widget expanseCard({
  required BuildContext context,
  required String description,
  required String expanseamount,
  required String paymentmethod,
   required String paidby,
    required String paidto,
}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row with Icon and Title
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.shopping_bag),
                  SizedBox(width: 10,),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold, // Bold title for emphasis
                      color: Colors.black87, // Text color
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10), // Space between icon and text
              Text(
                expanseamount,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold, // Bold title for emphasis
                  color: Colors.red, // Text color
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5), // Spacing between rows
        
        // Row with fixed value and button
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(""),
              
              Text(paymentmethod)
            ],
          ),
        ),
        
        Divider(),
      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(paidby)   ,
              Text(paidto)
            ],
          ),
      )
        
      ],
    ),
  );
}






Widget tenantCard({
  required String tenantName,
  required String tenantDues,
  required String duesDate,
  required String tenantRent,
   required VoidCallback onPressedcall,
    required VoidCallback onPressedWhatsapp,

}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
    child: Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Rounded corners
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with Icon and Title
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        size: 40,
                        color: Colors.grey, // Icon color fixed
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tenantName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                            ),
                          ),



                           const SizedBox(height: 5),
                          Text(
                            "Joining Date: $duesDate",
                            style: const TextStyle(color: Colors.black87),
                          ),


                          // const SizedBox(height: 5),
                          // const Text(
                          //   "987656789",
                          //   style: TextStyle(color: Colors.grey),
                          // ),
                        ],
                      ),


                        
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.more_vert,
                        color: Colors.grey, // Icon color fixed
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Rent: ₹$tenantRent",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.deepPurple, // Highlight color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            // Room no and dues
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Room No: 001",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Dues: ₹$tenantDues",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red, // Red color for dues
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
      
            // Action Icons Row
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
      
                  IconButton(
                    onPressed: onPressedcall,
                     icon:  Icon(
                      Icons.call,
                      color: Colors.green, // Call icon color fixed
                    ),
                     ),
      
                  IconButton(
                    onPressed: onPressedWhatsapp, 
                    icon:  FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green, // Message icon color
                  
                  ),
                    )
      
                 
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



Widget addDuesCard({
  required IconData icon,
  required String title,
  required String fixedValue,
  required VoidCallback onButtonPressed,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0), // Increased padding for better spacing
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Rounded corners for the card
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15), // Soft shadow for depth
            blurRadius: 8, // Softer, more spread-out shadow
            spreadRadius: 2, // Slightly larger spread for better effect
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0), // Padding inside the card
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row with Icon and Title
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 25, // Slightly larger icon for better visibility
                ),
                const SizedBox(width: 15), // Space between icon and text
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600, // Slightly bolder title
                    color: Colors.black87, // Text color
                  ),
                ),
              ],
            ),

            // Attractive Button with Icon and Text
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10), // Rounded corners for button
              ),
              child: TextButton(
                onPressed: onButtonPressed,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Make button rounder
                  ),
                
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor, // Matching the icon color
                      size: 16, // Smaller icon for balance
                    ),
                    const SizedBox(width: 8), // Space between icon and text
                    const Text(
                      "Add Dues",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold, // Bold text for emphasis
                        color: Colors.black87, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}





Widget addDuesTenantCard({
  required String title,
  required String room,
  required VoidCallback onButtonPressed,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0), // Increased padding for better spacing
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Rounded corners for the card
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15), // Soft shadow for depth
            blurRadius: 8, // Softer, more spread-out shadow
            spreadRadius: 2, // Slightly larger spread for better effect
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0), // Padding inside the card
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row with Icon and Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600, // Slightly bolder title
                    color: Colors.black87, // Text color
                  ),
                ),


                Text(
                  "Room :"+room,
                   style: const TextStyle(
                    fontSize: 12,
                    
                    fontWeight: FontWeight.w600, // Slightly bolder title
                    color: Colors.grey, // Text color
                  ),
                )
              ],
            ),

            // Attractive Button with Icon and Text
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10), // Rounded corners for button
              ),
              child: TextButton(
                onPressed: onButtonPressed,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Make button rounder
                  ),
                
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor, // Matching the icon color
                      size: 16, // Smaller icon for balance
                    ),
                    const SizedBox(width: 8), // Space between icon and text
                    const Text(
                      "Add Dues",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold, // Bold text for emphasis
                        color: Colors.black87, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}







