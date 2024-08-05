import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placeholderapp/features/post/page/post_page.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PlaceholderApp",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFDEF),
      ),
      home: PostPage(),
    );
  }
}
