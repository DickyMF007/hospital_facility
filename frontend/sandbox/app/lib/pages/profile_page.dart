import 'package:flutter/material.dart';

import '../components/navbar.dart'; // Mengimpor komponen Navbar

class ProfilePage extends StatelessWidget {
  final String username = 'Dicky'; // Hardcoded username
  final String email = 'dickymuhamad22@gmail.com'; // Hardcoded email
  final String position = 'Software Engineer'; // Hardcoded position
  final String role = 'Developer'; // Hardcoded role
  final int age = 25; // Hardcoded age

  const ProfilePage({super.key}); // Update constructor to remove parameters

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue[50], // Add a background color
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Warna latar belakang AppBar diambil dari tema.
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding around the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // CircleAvatar(
              //   radius: 50, // Size of the avatar
              //   backgroundImage: NetworkImage('https://example.com/avatar.jpg'), // Replace with actual image URL
              //   backgroundColor: Colors.grey[200], // Add background color to avatar
              // ),
              // const SizedBox(height: 20), // Space between avatar and text
              Card(
                // elevation: 8, // Increase shadow effect for better visibility
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners for the card
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Padding inside the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        'Username: $username',
                        style: const TextStyle(
                          fontSize: 24, // Increase font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10), // Space between username and email
                      Text(
                        'Email: $email',
                        style: const TextStyle(
                          fontSize: 18, // Increase font size
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10), // Space between email and position
                      Text(
                        'Position: $position',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10), // Space between position and role
                      Text(
                        'Role: $role',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10), // Space between role and age
                      Text(
                        'Age: $age',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space before the button
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the login page after logout
                  Navigator.pushReplacementNamed(context, '/login'); // Use named route for login
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.grey, // Change button color
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Add padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18), // Increase button text size
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah
    );
  }
} 