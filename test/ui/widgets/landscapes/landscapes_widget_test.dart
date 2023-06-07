import 'package:aleteo_car/ui/widgets/cars/car_types/car_custom_painter_fiat_widget.dart';
import 'package:aleteo_car/ui/widgets/landscapes/building_widget.dart';
import 'package:aleteo_car/ui/widgets/landscapes/clouds_widget.dart';
import 'package:aleteo_car/ui/widgets/landscapes/house_widget.dart';
import 'package:aleteo_car/ui/widgets/landscapes/landscape_widget.dart';
import 'package:aleteo_car/ui/widgets/landscapes/street_widget.dart';
import 'package:aleteo_car/ui/widgets/landscapes/tree_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LandscapeWidget is correctly created',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(LandscapeWidget), findsOneWidget);
  });

  testWidgets('LandscapeWidget contains an AppBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('AppBar contains the correct text', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.text('¿Y si viajamos?'), findsOneWidget);
  });

  testWidgets('LandscapeWidget contains a Stack', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(Stack), findsOneWidget);
  });

  testWidgets('LandscapeWidget contains a StreetWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(StreetWidget), findsOneWidget);
  });

  testWidgets('LandscapeWidget contains a CarCustomPainterFiatWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(CarCustomPainterFiatWidget), findsOneWidget);
  });

  testWidgets('LandscapeWidget contains TreeWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(TreeWidget), findsWidgets);
  });

  testWidgets('LandscapeWidget contains BuildingWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(BuildingWidget), findsWidgets);
  });

  testWidgets('LandscapeWidget contains HouseWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(HouseWidget), findsWidgets);
  });

  testWidgets('LandscapeWidget contains CloudsWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandscapeWidget()));

    expect(find.byType(CloudsWidget), findsWidgets);
  });
}
