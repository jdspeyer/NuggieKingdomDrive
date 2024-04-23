import 'dart:developer' as developer;

///
/// The [Debug] class is used for conditional outputs to the console.
///
class Debug {
  /// prints the [value] to the console. Used in situations where a warning to the developer
  /// is needed.
  static printWarn(var value) {
    developer.log(
      '🟨 \x1B[33m$value\x1B[0m',
      name: 'Warning',
    );
  }

  /// prints the [value] to the console. Used in situations where an error should be thrown.
  static printError(var value) {
    developer.log(
      '📕 \x1B[31m$value\x1B[0m',
      name: 'Error',
    );
  }

  /// prints the [value] to the console. Used to gather basic information.
  static printInfo(var value) {
    developer.log(
      '🟪 \x1B[34m$value\x1B[0m',
      name: 'Info',
    );
  }
}
