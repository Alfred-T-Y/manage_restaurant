import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodePage extends StatefulWidget {
  const ScanQrCodePage({super.key});

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (capture){
          final List<Barcode> barcodes = capture.barcodes;
          final String barcode = barcodes[0].rawValue!;
          Navigator.pop(context, barcode);
        },
      ),

    );
  }
}