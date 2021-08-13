import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'package:whatsapp/screens/save_camera_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? capturedImage;
  
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

  Future<List<String>?> getGalleryImages() async {
  }

  Future<void> startCamera() async {
    await initializeCamera();
    // await getGalleryImages();
  }

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> takePhoto() async {
    try {
      controller?.takePicture().then((file) => capturedImage = file);
      // Navigator.of(context).pushNamed(SaveCameraScreen.routeName,arguments: {capturedImage});
      if (capturedImage != null) {
        await save(capturedImage);
      }
    } catch (e) {}
  }

  /// save on the save screen
  Future<void> save(XFile? file) async {
    Directory? externalMemory =
        await pathProvider.getExternalStorageDirectory();
    await file?.saveTo("${externalMemory!.path}.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        // future: ,
        builder: (_) {
      if (controller == null || !controller!.value.isInitialized) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Stack(fit: StackFit.expand, children: [
          CameraPreview(controller!),
          GallerySection(),
          CameraBottonsSection(takePhoto),
        ]);
      }
    });
  }
}

class CameraBottonsSection extends StatefulWidget {
  final Function handleFunction;

  CameraBottonsSection(this.handleFunction);

  @override
  _CameraBottonsSectionState createState() => _CameraBottonsSectionState();
}

class _CameraBottonsSectionState extends State<CameraBottonsSection> {
  bool buttonPressed = false;

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
            GestureDetector(
              onTap: () {
                buttonPressed = true;

                widget.handleFunction();
                buttonPressed = false;
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: buttonPressed ? Colors.red : null,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
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
  // final List<String> _galleryImages;
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
            itemCount: 30,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, idx) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 55,
                height: 50,
                color: Colors.red,

                // child: Image.file(File(_galleryImages[idx]))
                // ),
              );
            }),
      ),
    );
  }
}
