import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

/// When is not [const], the body is rebuilt twice when has hot reload.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('HomeScreen build');
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: SampleWidget(
          title: 'Hello World'.toUpperCase(),
        ),
      ),
    );
  }
}

/// When is [const], the body is rebuilt once when has hot reload.
class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    log('HomeScreen2 build');
    return const MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: SampleWidget(
          title: 'Hello World',
        ),
      ),
    );
  }
}

/// Simple example of a widget.
class SampleWidget extends StatelessWidget {
  const SampleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    log('SampleWidget build');
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
