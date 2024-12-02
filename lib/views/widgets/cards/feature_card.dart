import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget featureCard({
  required IconData icon,
  required String title,
  required String data,
  required Color iconColor,
}) {
  return Container(
    width: 130,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5), // Added border radius
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 2,
          spreadRadius: 2,
        ),
      ],
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
                '₹ $data',
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
                    fontSize: 10,
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
  );
}

Widget moneyCard(
    {required String buildingName,
    required String unpaiddues,
    required String noofunpaidtenant,
    required String todaysCollection,
    required String thisMonthCollection,
    required String thisMonthExpanse,
    required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5), // Added border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(buildingName),
                TextButton(onPressed: onPressed, child: Text("Current"))
              ],
            ),

            Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unpaid Dues',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text("₹ $unpaiddues" , style: TextStyle(color: Colors.red),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.people, color: Colors.red,),
                    ),
                    Text(noofunpaidtenant, style: TextStyle(color: Colors.red),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today collection',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text("₹ $unpaiddues" ,style: TextStyle(color: Colors.green),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.people, color: Colors.green,),
                    ),
                    Text(noofunpaidtenant,style: TextStyle(color: Colors.green),)
                  ],
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This Month Collection',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text("₹ $unpaiddues", style: TextStyle(color: Colors.green),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.people, color: Colors.green,),
                    ),
                    Text(noofunpaidtenant,style: TextStyle(color: Colors.green),)
                  ],
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This Month Expanses',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text("₹ $unpaiddues", style: TextStyle(color: Colors.orange),),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Icon(Icons.people),
                    // ),
                    // Text(noofunpaidtenant)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget duesCard({
  required String tenantName,
  required String tenantDues,
  required String duesDate,
}) {
  return Padding(
    padding:  EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Light shadow
            blurRadius: 10, // Soft shadow effect
            spreadRadius: 3,
            offset: Offset(0, 1), // Slightly downward shadow
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.all(15.0), // Padding inside the card
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Bold title for emphasis
                    color: Colors.black87, // Text color
                  ),
                ),
                const SizedBox(width: 10), // Space between icon and text
                Text(
                  tenantDues,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Bold title for emphasis
                    color: Colors.black87, // Text color
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
                        fontSize: 16,
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
                      fontSize: 16,
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
                TextButton(onPressed: () {}, child: Text("Record Payment")),
                TextButton(onPressed: () {}, child: Text("Remind To Pay")),
              ],
            )
          ],
        ),
      ),
    ),
  );
}





Widget tenantCard({
  required String tenantName,
  required String tenantDues,
  required String duesDate,
  required String tenantRent,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Light shadow
            blurRadius: 10, // Soft shadow effect
            spreadRadius: 3,
            offset: const Offset(0, 1), // Slightly downward shadow
          ),
        ],
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
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "987656789",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Joining Date: $duesDate",
                          style: const TextStyle(color: Colors.grey),
                        ),
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
            padding: const EdgeInsets.all(10.0),
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
                    fontSize: 14,
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
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.call,
                  color: Colors.green, // Call icon color fixed
                ),
                Icon(
                  Icons.video_call,
                  color: Colors.blue, // Video call color fixed
                ),
                // Icon(
                //   Icons.message, // Correct message icon
                //   color: Colors.orange, // Message icon color fixed
                // ),

                FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green, // Message icon color
                
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



Widget addDuesCard({
  required IconData icon,
  required String title,
  required String fixedValue,
  required VoidCallback onButtonPressed,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Light shadow
            blurRadius: 10, // Soft shadow effect
            spreadRadius: 3,
           
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with Icon and Title
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.green, // Icon color for visual appeal
                  size: 30, // Slightly larger icon
                ),
                const SizedBox(width: 10), // Space between icon and text
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Bold title for emphasis
                    color: Colors.black87, // Text color
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15), // Spacing between rows

            // Row with fixed value and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fixedValue,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600, // Slightly bold for emphasis
                    color: Colors.grey[700], // Dark grey color for contrast
                  ),
                ),
                TextButton(
                  onPressed: onButtonPressed,
                  child: const Text(
                    "Add Dues",
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500, // Slightly less bold for the button
                      color: Colors.blueAccent, // Button text color
                    ),
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






