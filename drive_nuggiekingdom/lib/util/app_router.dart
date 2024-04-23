import 'package:drive_nuggiekingdom/models/user/user_authentication_provider.dart';
import 'package:drive_nuggiekingdom/models/user/user_data_provider.dart';
import 'package:drive_nuggiekingdom/screens/authentication/authentication_screen.dart';
import 'package:drive_nuggiekingdom/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// [_key] is the global navigator state used to ensure safe page navigation.
final _key = GlobalKey<NavigatorState>();

/// [routerProvider] is a provider of a [GoRouter]. This is done so that the router can have access to a [WidgetRef] without
/// needing to pass it in as a parameter (not good practice according to documentation). All logic for navigation is done here.
final routerProvider = Provider<GoRouter>((ref) {
  /// [Provider] of authentiation data. Does the user have an account? Have they verified email? Etc.
  final userAuthentication = ref.watch(userAuthenticationProvider);

  /// [Provider] of user data. This is based on their document within the FireStore database.
  final userData = ref.watch(userDataProvider);

  return GoRouter(
    navigatorKey: _key,

    /// Forwards diagnostic messages to the dart:developer log() API.
    debugLogDiagnostics: true,

    /// Initial Routing Location (Uses the [SplashScreen])
    initialLocation: const HomeScreen().path,

    routes: <GoRoute>[
      /// Home Screen Route
      GoRoute(
          name: const HomeScreen().name,
          path: const HomeScreen().path,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          }),

      /// Authentication Screens Route
      /// This includes: Login with Discord
      GoRoute(
          name: const AuthenticationScreen().name,
          path: const AuthenticationScreen().path,
          builder: (BuildContext context, GoRouterState state) {

            return const AuthenticationScreen();
          }),
    ],

    /// Route Guards
    /// This is checks are done before the navigation to a page. This makes sure that a user is only able
    /// to see what they are allowed to.
    redirect: (context, state) {
      final User? user = userAuthentication.value;

      /// Guards for the [HomeScreen]
      if (state.fullPath == const HomeScreen().path) {
        /// No account detected. Push to the auhentication screen
        /// so they can sign in.
        if (user == null) {
          return const AuthenticationScreen().path;
        }

        /// profile screen body{}

        /// All checks passed, push to the homescreen.
        return const HomeScreen().path;
      }

      /// No checks required (all were obsolete... just let them navigate.)
      return null;
    },
  );
});
