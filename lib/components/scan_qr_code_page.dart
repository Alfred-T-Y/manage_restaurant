import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodePage extends StatefulWidget {
  final Color color;

  const ScanQrCodePage({super.key,
  required this.color});

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
      body: Stack(
        children:[ 
          InteractiveViewer(
            maxScale: 8,
            minScale: 1,
            child: MobileScanner(
              controller: qrController,
              onDetect: (capture){
                final List<Barcode> barcodes = capture.barcodes;
                final String barcode = barcodes[0].rawValue!;
                Navigator.pop(context, barcode);
              },
            ),
          ),
          IgnorePointer(
            child: Center(
              child: CustomPaint(
                size: const Size(250, 250), // Taille de ton cadre
                painter: ScannerFramePainter(widget.color),
                    )
            ),
          )
        ]
      ),

    );
  }
}


class ScannerFramePainter extends CustomPainter {
  final Color color;

  ScannerFramePainter(this.color); 

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final radius = 11.0;

    //top-left  
    var path = Path()
      ..moveTo(12, 0)
      ..arcToPoint(
        Offset(0, 12), // Point final de l’arc
        radius: Radius.circular(radius),
        clockwise: false,
      );

    canvas.drawPath(path, paint);

    //top-right
    path = Path()
      ..moveTo(size.width - 10, 0)
      ..arcToPoint(
        Offset(size.width, 10), // Point final de l’arc
        radius: Radius.circular(radius),
        clockwise: true,
      );

    canvas.drawPath(path, paint);

    //bottom-left
    path = Path()
      ..moveTo(0, size.height - 10)
      ..arcToPoint(
        Offset(10, size.height), // Point final de l’arc
        radius: Radius.circular(radius),
        clockwise: false,
      );

    canvas.drawPath(path, paint);

    //bottom-right
    path = Path()
      ..moveTo(size.width , size.height - 10)
      ..arcToPoint(
        Offset(size.width - 10, size.height), // Point final de l’arc
        radius: Radius.circular(radius),
        clockwise: true,
      );

    canvas.drawPath(path, paint);

    // Optional: draw corner lines (style)
    final cornerLength = 60.0;
    final cornerPaint = Paint()
      ..color = color
      ..strokeWidth = 4;

    // Top-left
    canvas.drawLine(Offset(10, 0), Offset(cornerLength, 0), cornerPaint);
    canvas.drawLine(Offset(0, 10), Offset(0, cornerLength), cornerPaint);

    // Top-right
    canvas.drawLine(Offset(size.width - 10, 0),
        Offset(size.width - cornerLength , 0), cornerPaint);
    canvas.drawLine(Offset(size.width, 10),
        Offset(size.width, cornerLength), cornerPaint);

    // Bottom-left
    canvas.drawLine(Offset(0, size.height - 10),
        Offset(0, size.height - cornerLength), cornerPaint);
    canvas.drawLine(Offset(10, size.height),
        Offset(cornerLength, size.height), cornerPaint);

    // Bottom-right
    canvas.drawLine(Offset(size.width , size.height - 10),
        Offset(size.width, size.height - cornerLength), cornerPaint);
    canvas.drawLine(Offset(size.width - 10, size.height),
        Offset(size.width - cornerLength, size.height), cornerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}