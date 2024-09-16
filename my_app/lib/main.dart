import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Flutter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text widget to display a welcome message
              Text(
                'Welcome to My Simple App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // Adding some spacing between the widgets
              SizedBox(height: 20),

              // ElevatedButton widget
              ElevatedButton(
                onPressed: () {
                  // Action to be performed on button click
                  print('Button Pressed!');
                },
                child: Text('Click Me'),
              ),

              // Adding some spacing between the widgets
              SizedBox(height: 20),

              // Image widget that loads an image from the internet
              Image.network(
                'https://via.placeholder.com/150',
                height: 150,
                width: 150,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
