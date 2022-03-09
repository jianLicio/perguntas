import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultado extends StatelessWidget {
  const Resultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'PARABÉNS!',
        style: GoogleFonts.pacifico(
          fontSize: 38,
          color: const Color.fromARGB(255, 37, 106, 158),
        ),
      ),
    );
  }
}
