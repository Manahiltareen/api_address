import 'package:api_address/views/auth/login_screen.dart';
import 'package:api_address/views/auth/signup_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login', // Set your initial route here
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      // GoRoute(
      //   path: '/home', // Example home screen after login
      //   builder: (context, state) => const HomeScreen(),
      // ),
      // GoRoute(
      //   path: '/manage_address', // Example of your existing screens
      //   builder: (context, state) => const ManageAddressScreen(),
      // ),
      // Add more routes for your main screens here
    ],
    // You can add error handling, redirect logic here
    errorBuilder: (context, state) => const Center(child: Text('Error: Page not found!')),
  );
}