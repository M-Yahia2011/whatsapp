import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  // ignore: unused_field
  late List _galleryImages;

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras![0],
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<void> getGalleryImages() async {
    // await GalleryRetriever.getAllImages
    //     .then((value) => _galleryImages = value as List);
  }

  @override
  void initState() {
    super.initState();
    initializeCamera();
    getGalleryImages();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container(
        height: 0,
        width: 0,
      );
    }
    return Stack(fit: StackFit.expand, children: [
      CameraPreview(controller!),
      GallerySection(),
      CameraBottomSection()
    ]);
  }
}

class CameraBottomSection extends StatelessWidget {
  const CameraBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.flash_on, color: Colors.white, size: 30),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Icon(Icons.camera_alt, color: Colors.white, size: 30)
          ],
        ),
      ),
    );
  }
}

class GallerySection extends StatelessWidget {
  // final List _galleryImages;
  // GallerySection(this._galleryImages);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      right: 0,
      left: 0,
      child: Container(
        height: 55,
        child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, idx) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 55,
                height: 50,
                color: Colors.red,
                // child: Image.file(_galleryImages[idx],
                // ),
              );
            }),
      ),
    );
  }
}
