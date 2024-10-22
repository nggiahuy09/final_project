import 'package:flutter/material.dart';
import 'package:final_project/consts/app_color.dart';
import 'package:final_project/consts/app_routes.dart';
class LoginGmailPage extends StatelessWidget {
  const LoginGmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.inverseTextColor,
        title: const Text('Gmail Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [                     
            const SizedBox(height: 20), 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(               
                child: Column(
                  children: [
                    
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 20), 
                    ElevatedButton(
                      onPressed: () {
                          Navigator.of(context).pushReplacementNamed(AppRoutes.homeChat);
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}