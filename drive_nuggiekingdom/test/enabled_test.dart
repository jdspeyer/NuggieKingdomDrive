
import 'package:flutter_test/flutter_test.dart';

void main() {

  ///
  /// Testing Enabled
  /// 
  /// Simple Test which logs if the tests are running
  /// correctly.
  /// 
  /// Set: true
  /// Expected: true
  /// 
  test('Testing Enabled',(){
     const bool testingEnabled = true;
     expect(testingEnabled,true);
  });

}
