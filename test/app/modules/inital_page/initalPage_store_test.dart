import 'package:flutter_test/flutter_test.dart';
import 'package:mydiet/app/modules/inital_page/initalPage_store.dart';
 
void main() {
  late InitalPageStore store;

  setUpAll(() {
    store = InitalPageStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}