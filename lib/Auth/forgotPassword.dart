import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Text(
              'Forgot Password',
              style: AppThemes.darkTheme.textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Enter your email to reset your password',
              style: AppThemes.darkTheme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: AppThemes.darkTheme.inputDecorationTheme.fillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white24),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppThemes.darkTheme.elevatedButtonTheme.style,
                onPressed: () {},
                child: Text('Send Reset Link'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
