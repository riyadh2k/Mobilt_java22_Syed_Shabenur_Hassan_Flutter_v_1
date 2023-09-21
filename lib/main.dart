import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Enter text here'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailsPage()),
                  );
                },
                child: const Text('Go to Details'),
              ),
              TextButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Button was clicked!'),
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Click Me'),
              ),
            ],
          ),
          Expanded(child: ImageSlideshow()), // Using the slideshow here
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page')),
      body: Center(child: Text('Welcome to the Details Page!')),
    );
  }
}

class ImageSlideshow extends StatelessWidget {
  final List<String> imgList = [
    'https://picsum.photos/250?image=1',
    'https://picsum.photos/250?image=2',
    'https://picsum.photos/250?image=3',
    // Add more image URLs as you want...
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imgList.map((item) => Container(
        child: Center(
            child: Image.network(item, fit: BoxFit.cover, width: 1000,)
        ),
      )).toList(),
    );
  }
}
