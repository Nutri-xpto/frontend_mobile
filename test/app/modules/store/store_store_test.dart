import 'package:flutter_test/flutter_test.dart';
import 'package:mydiet/app/modules/store/store_store.dart';
 
void main() {
  late StoreStore store;

  setUpAll(() {
    store = StoreStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}