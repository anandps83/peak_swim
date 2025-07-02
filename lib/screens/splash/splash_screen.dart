import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:peak_swim/screens/login/login_screen.dart';
import 'package:peak_swim/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Image.asset(
              'assets/images/peak_swim_logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            // App name
            Text(
              'Peak Swim',
              style: GoogleFonts.montserrat(
                fontSize: 40,
                fontWeight: FontWeight.w600, // SemiBold
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Slogan
            Text(
              'Push Limits. Break Records!',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
