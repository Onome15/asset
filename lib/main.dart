import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ImageSizeApp());
}

class ImageSizeApp extends StatelessWidget {
  const ImageSizeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ImageSize App',
      home: ImageSizeScreen(),
    );
  }
}

class ImageSizeScreen extends StatefulWidget {
  const ImageSizeScreen({super.key});
  @override
  ImageSizeScreenState createState() => ImageSizeScreenState();
}

class ImageSizeScreenState extends State<ImageSizeScreen> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  // Define the ImageSize variable
  double imageWidth = 60;
  double imageHeight = 80;

  // Define the increment and decrement ImageSize methods
  void incrementImageSize() {
    setState(() {
      imageWidth += 60;
      imageHeight += 80;
      warningText = '';
    });
  }

  void decrementImageSize() {
    setState(() {
      imageWidth -= 60;
      imageHeight -= 80;
      if (imageWidth < 60 && imageHeight < 80) {
        imageWidth = 60;
        imageHeight = 80;
        warning();
      }
    });
  }

  String warningText = '';
  void warning() {
    setState(() {
      warningText =
          'Image cannot be reduced more than this, Lowest pixel attained!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImageSize App')),
      body: Center(
          child: Column(
        children: [
          isSwitched
              ? Column(children: [
                  Image.asset(
                    'assets/myphoto.jpg',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  Text('Onome(Boss)',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                      ))
                ])
              : Column(children: [
                  Image.asset(
                    'assets/yoma.jpg',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  Text('Yoma(Boy)',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                      ))
                ]),
          // const SizedBox(height: 100),
          Text(warningText,
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ) // Use Roboto font

              ),
          Text('Reduce or Increase he image above with the buttons below',
              style: GoogleFonts.indieFlower(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ) // Use Roboto font

              ),
          Switch(
            value: isSwitched,
            onChanged: toggleSwitch,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: incrementImageSize,
                tooltip: 'Increase',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: decrementImageSize,
                tooltip: 'Decrease',
                child: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      )),
    );
  }
}
