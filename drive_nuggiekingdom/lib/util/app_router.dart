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
    initialLocation: HomeScreen().path,

    routes: <GoRoute>[
      /// Home Screen Route
      /// This is the [Screen] where you can look at your returned restaurants.
      GoRoute(
          name: const HomeScreen().name,
          path: const HomeScreen().path,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          }),

      /// Authentication Screens Route
      /// This includes: Create, Login, and Forgot Password
      /// The index refers to what index of the slider the page should start on. (0=create, 1=login, 2=forgot password)
      GoRoute(
          name: AuthenticationScreen().name,
          path: AuthenticationScreen().path,
          builder: (BuildContext context, GoRouterState state) {
            /// Default value
            int index = 1;

            /// Check if the index was passed as a parameter
            if (state.pathParameters['index'] != null) {
              /// Set the index. [int.tryParse] will return null if it does not parse.
              /// We can check that null value and set index to 1 if this occurs.
              index =
                  int.tryParse(state.pathParameters['index'] as String) ?? 1;
            }

            return AuthenticationScreen();
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
          return AuthenticationScreen().path;
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
