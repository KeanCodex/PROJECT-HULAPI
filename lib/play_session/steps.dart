import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionsScreen extends StatelessWidget {
  const DirectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Panuto",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Background2.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                  "Kailangang mahulaan ang lihim na salita at mayroon kang anim na pagkakataon at magpapalit ang kulay ng letra upang maipakita kung gaano ka na kalapit",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Upang magsimula ang laro, kailangan mo lamang maglagay ng kahit anong salita. halimbawa:",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(),
                ),
                SizedBox(
                  height: 100, // Adjust the height as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade400,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "L",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.yellow,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "N",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 130,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade400,
                                ),
                                width: 30, // Adjust the width as needed
                                height: 30, // Adjust the height as needed
                                child: Center(
                                  child: Text(
                                    "L",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          17, // Adjust the font size as needed
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "  Hindi kasama sa salitang hinuhulaan",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 12)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.yellow,
                              ),
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                              child: Center(
                                child: Text(
                                  "B",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        17, // Adjust the font size as needed
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "  Kasama ngunit nasa maling posisyon",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 12)),
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.lightGreen,
                              ),
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                              child: Center(
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        17, // Adjust the font size as needed
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.lightGreen,
                              ),
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                              child: Center(
                                child: Text(
                                  "N",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        17, // Adjust the font size as needed
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "  Kasama at nasa tamang posisyon",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 12)),
                            ),
                          ]),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sumubok muli upang mahulaan",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 12)),
                ),
                SizedBox(
                  height: 60, // Adjust the height as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Y",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade400,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "D",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Malapit na!",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 12)),
                ),
                SizedBox(
                  height: 60, // Adjust the height as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Y",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.lightGreen,
                        ),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "N",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tama!",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
