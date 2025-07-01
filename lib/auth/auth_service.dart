import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:peak_swim/utils/constants.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  // Stream to listen for authentication state changes
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  // Get the current user
  User? get currentUser => _client.auth.currentUser;

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    // TODO: Follow these steps to configure Google Sign-In:
    // 1. Enable the Google provider in your Supabase project: https://supabase.com/docs/guides/auth/social-login/google
    // 2. Configure for Flutter: https://supabase.com/docs/guides/auth/social-login/google#flutter
    try {
      await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        // redirectTo: 'io.supabase.flutterquickstart://login-callback/', // Add your custom URL scheme here
      );
    } catch (e) {
      debugPrint('Error with Google Sign-In: ');
      // Handle error
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook() async {
    // TODO: Follow these steps to configure Facebook Sign-In:
    // 1. Enable the Facebook provider in your Supabase project: https://supabase.com/docs/guides/auth/social-login/facebook
    // 2. Configure for Flutter: https://supabase.com/docs/guides/auth/social-login/facebook#flutter
    try {
      await _client.auth.signInWithOAuth(
        OAuthProvider.facebook,
        // redirectTo: 'io.supabase.flutterquickstart://login-callback/', // Add your custom URL scheme here
      );
    } catch (e) {
      debugPrint('Error with Facebook Sign-In: ');
      // Handle error
    }
  }

  // Sign in with Apple
  Future<void> signInWithApple() async {
    // TODO: Follow these steps to configure Apple Sign-In:
    // 1. Enable the Apple provider in your Supabase project: https://supabase.com/docs/guides/auth/social-login/apple
    // 2. Configure for Flutter: https://supabase.com/docs/guides/auth/social-login/apple#flutter
    try {
      await _client.auth.signInWithOAuth(
        OAuthProvider.apple,
        // redirectTo: 'io.supabase.flutterquickstart://login-callback/', // Add your custom URL scheme here
      );
    } catch (e) {
      debugPrint('Error with Apple Sign-In: ');
      // Handle error
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      debugPrint('Error signing out: ');
      // Handle error
    }
  }
}
