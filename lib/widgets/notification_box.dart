import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue, // Change the app bar background color
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications,
              size: 100.0,
              color: Colors.blue, // Change the notification icon color
            ),
            SizedBox(height: 20.0),
            Text(
              'You have a new notification!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae maximus elit.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add your action when the button is pressed
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.blue, // Change the button background color
              ),
              child: Text(
                'View Details',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
