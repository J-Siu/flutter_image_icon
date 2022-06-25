import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Icon Test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Image Icon Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String iconBase64 =
      "AAABAAEAAAAAAAAACAAzDwAAFgAAAIlQTkcNChoKAAAADUlIRFIAAAEAAAABAAgDAAAAa6xYVAAAAAFzUkdCAdnJLH8AAAEjUExURQAAAAAAAP///3x8fGVlZfj4+P7+/vPz8/v7+/r6+ouLi/f39+zs7PHx8enp6VlZWWtra+Li4v39/d7e3gICAp6entzc3O7u7vX19Q4ODkFBQSEhIcrKyufn59nZ2QYGBry8vNLS0k9PT8XFxQkJCcjIyNbW1hISEuTk5HBwcJubm7Kysl9fX1xcXK+vr3V1dW5ubs3NzYKCgioqKh0dHYiIiL6+vjU1NaKiosHBwRkZGVZWVjAwMODg4BUVFZKSkmFhYX9/fz09PVNTUycnJ6mpqVBQUBsbG7m5uU1NTdDQ0AwMDGdnZ0NDQy0tLSQkJJiYmKSkpJWVlbe3t9XV1TMzMxcXF6ysrHJyckpKSjo6OkhISHl5eaioqEZGRo+Pj4yMjDpuuJwAAABhdFJOUwD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////l7GcNAAAACXBIWXMAAA7EAAAOxAGVKw4bAAANPElEQVR4nO2daUPbOBCGVwHSpCQUkpCQcqQ0XIVCgXKWUu4WSul90Hv//69YJ05seWZkyyH2BK/ebyBbGj+xJY2O0T/if65/uA3glgHAbQC3DABuA7hlAHAbwC0DgNsAbhkA3AZwywDgNoBbBgC3AdwyALgN4JYBwG0AtwwAbgO4ZQBwG8AtA4DbAG4ZANwGcMsA4DaAWwYAtwHcMgC4DeCWAcBtALcMAG4DuGUAcBvALQOA2wBuGQDcBhAanxwC2ouusF4EcD8FdTe6wgyA6LLuWMkE8PVq+O/KxH6uktv/XP/04WB1XHlpTwN4ORCgsRf4ptLe+Rh6qFS2uDL8jCqjpwE8wg8CBH/Z0vVaRn118VEJlZEsAG+I396jzPk2KCNJAH7sB15vafLYU0ZyAFzu6jx+Q+dVqYzEAKgO6T6/VSOuumUkBUCY57c065SREADzuVDPn8o7ZSQDQC3k80sANspFoJfde2CoyAB8CPn8EoBYFRbA26WyX8Oezm3Z9fnzsM9/WwA0VLt/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";

  @override
  Widget build(BuildContext context) {
    Uint8List icon = base64Decode(iconBase64);

    Container iconContainer = Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: MemoryImage(icon),
          fit: BoxFit.fill,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(child: iconContainer),
    );
  }
}
