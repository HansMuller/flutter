import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:test/test.dart';

import 'widget_tester.dart';

void main() {
  test('Align smoke test', () {
    testWidgets((WidgetTester tester) {
      tester.pumpWidget(
        new Align(
          child: new Container(),
          alignment: const FractionalOffset(0.75, 0.75)
        )
      );

      tester.pumpWidget(
        new Align(
          child: new Container(),
          alignment: const FractionalOffset(0.5, 0.5)
        )
      );
    });
  });

  test('Shrink wraps in finite space', () {
    testWidgets((WidgetTester tester) {
      GlobalKey alignKey = new GlobalKey();
      tester.pumpWidget(
        new ScrollableViewport(
          child: new Align(
            key: alignKey,
            child: new Container(
              width: 10.0,
              height: 10.0
            ),
            alignment: const FractionalOffset(0.50, 0.50)
          )
        )
      );

      RenderBox box = alignKey.currentContext.findRenderObject();
      expect(box.size.width, equals(800.0));
      expect(box.size.height, equals(10.0));
    });
  });
}
