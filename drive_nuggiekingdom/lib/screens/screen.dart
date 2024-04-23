import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///
/// The [Screen] class is what every screen in the application extends. [Screen] Enforces certain
/// behaviors to ensure that development is consistent across the entire application.
///
/// [Screen] extends [ConsumerWidget] which is RiverPods implementation of [StatelessWidget]; however,
/// it has access to [WidgetRef] which is used to read in and watch [Provider] values.
///
/// This should be used for every top level [Screen] within the mobile application.
///
abstract class Screen extends ConsumerWidget {
  /// [path] is a [String] which is used by the [GoRouter] to navigate to this [Screen] from
  /// another one. This should formatted as: `/file_name`. The only exception to this rule is the
  /// [SplashScreen] which has a `/` as its path (it is the entry point of the app).
  final String path;

  /// [name] is a [String] which can also be used by [GoRouter] as an alternative. Can essentially
  /// be whatever; however, the naming scheme currently in use is: `file_name`.
  final String name;

  /// Default constructor
  const Screen({
    super.key,
    required this.path,
    required this.name,
  });
}
