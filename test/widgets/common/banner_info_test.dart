import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png'));

void main() {
  testWidgets('should properly mock Image.network and not crash',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
  });
}
