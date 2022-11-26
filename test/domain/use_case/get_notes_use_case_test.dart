import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Timeout timeout = const Timeout(Duration(seconds: 10));

  test('정렬 기능이 잘 동작해야 한다.', () {}, timeout: timeout);
}
