import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodePage extends StatefulWidget {

  const ScanQrCodePage({super.key,});

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
  var qrController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scan the QR Code',
              style: GoogleFonts.barlowCondensed(
                fontSize: 25,
              ), 
            ),
            SizedBox(width: 5,),
            Icon(FontAwesomeIcons.qrcode,
            size:25)
          ],
        ),
      ),
      body: InteractiveViewer(
        maxScale: 8.0,
        minScale: 1.0,
        child: Stack(
          children:[ 
            MobileScanner(
              controller: qrController,
              onDetect: (capture){
                final List<Barcode> barcodes = capture.barcodes;
                final String barcode = barcodes[0].rawValue!;
                Navigator.pop(context, barcode);
              },
            ),
            IgnorePointer(
              child: Center(
                child: CustomPaint(
                  size: const Size(250, 250), // Taille de ton cadre
                  painter: ScannerFramePainter(),
                      )
              ),
            )
          ]
        ),
      ),

    );
  }
}


class ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const radius = 16.0;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    canvas.drawRRect(rrect, paint);

    // Optional: draw corner lines (style)
    final cornerLength = 20.0;
    final cornerPaint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 4;

    // Top-left
    canvas.drawLine(Offset(0, 0), Offset(cornerLength, 0), cornerPaint);
    canvas.drawLine(Offset(0, 0), Offset(0, cornerLength), cornerPaint);

    // Top-right
    canvas.drawLine(Offset(size.width, 0),
        Offset(size.width - cornerLength, 0), cornerPaint);
    canvas.drawLine(Offset(size.width, 0),
        Offset(size.width, cornerLength), cornerPaint);

    // Bottom-left
    canvas.drawLine(Offset(0, size.height),
        Offset(0, size.height - cornerLength), cornerPaint);
    canvas.drawLine(Offset(0, size.height),
        Offset(cornerLength, size.height), cornerPaint);

    // Bottom-right
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - cornerLength), cornerPaint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - cornerLength, size.height), cornerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}