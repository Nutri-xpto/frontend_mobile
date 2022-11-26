import 'package:flutter_test/flutter_test.dart';
import 'package:mydiet/app/modules/diet_page/diet_page_store.dart';

void main() {
  late DietPageStore store;

  setUpAll(() {
    store = DietPageStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
