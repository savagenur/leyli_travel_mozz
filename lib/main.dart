import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/app.dart';
import 'package:leyli_travel_mozz/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const LeyliTravelApp());
}
