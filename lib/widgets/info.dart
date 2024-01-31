// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Melanoma extends StatelessWidget {
  const Melanoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 6, 2, 133),
              ]),
        ),
        padding: const EdgeInsets.only(top: 190),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 400,
              child: Card(
                color: Colors.white,
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 255, 255, 255),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MelanomaInfo()),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 400,
                          height: 400,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  "SmallPox",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  "Cacar adalah infeksi yang disebabkan oleh virus Varicella-zoster. Penyakit yang ditandai dengan ruam gatal berisi air",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 150, top: 30),
                                child: const Text(
                                  "Click for more info",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Symptoms()),
                      );
                    },
                    child: const Text(
                      "ChcikenPox",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cause()),
                      );
                    },
                    child: const Text(
                      "MonkeyPox",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Prevention()),
                      );
                    },
                    child: const Text(
                      "Measles",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Treatment()),
                      );
                    },
                    child: const Text(
                      "Treatment",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MelanomaInfo extends StatelessWidget {
  const MelanomaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 6, 2, 133),
              ]),
        ),
        child: ListView(children: <Widget>[
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 270,
                width: 400,
                child: Card(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "What is SmallPox ?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Roboto"),
                        ),
                        Text(
                          "\n SmallPox atau cacar, Infeksi virus "
                          "\n sangat menular yang menyebabkan "
                          "\n ruam melepuh, seperti gatal pada"
                          "\n kulit. Cacar sangat menular terhadap "
                          "\n orang-orang yang belum pernah "
                          "\n menderita cacar atau belum "
                          "\n divaksinasi cacar.",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                    width: 400,
                    child: Card(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "SmallPox Symptoms",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            ),
                            Text(
                              "\n Tanda utama cacar air adalah bintik-"
                              "\n bintik kemerahan di seluruh tubuh."
                              "\n Hanya saja ini tidak langsung muncul"
                              "\n setelah terinfeksi virus varicella"
                              "\n zoster (VZV).",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class Symptoms extends StatelessWidget {
  const Symptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 6, 2, 133),
              ]),
        ),
        child: ListView(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "What is a ChickenPox ?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Roboto"),
                          ),
                          Text(
                            "\n Cacar air adalah infeksi yang "
                            "\n disebabkan oleh virus Varicella-"
                            "\n zoster. Sebagian besar kasusnya "
                            "\n terjadi pada anak-anak di bawah usia "
                            "\n 12 tahun. Penyakit ini juga dapat "
                            "\n terjadi pada orang dewasa yang "
                            "\n belum pernah terinfeksi. Ketika "
                            "\n dialami oleh orang dewasa, "
                            "\n umumnya gejala dari cacar air akan "
                            "\n lebih parah.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: "Roboto"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 250,
                        width: 400,
                        child: Card(
                          color: Colors.white,
                          child: Column(children: [
                            Text(
                              "ChickenPox Symptoms",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            ),
                            Text(
                              "\n Di fase awal sebelum munculnya "
                              "\n ruam, gejala dari penyakit tersebut "
                              "\n ditandai dengan demam, sakit "
                              "\n kepala, kehilangan selera makan, "
                              "\n nyeri otot, rasa lelah berlebihan, "
                              "\n mual.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cause extends StatelessWidget {
  const Cause({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 6, 2, 133),
              ]),
        ),
        child: ListView(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 270,
                  width: 400,
                  child: Card(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "What is a MonkeyPox ?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            ),
                            Text(
                              "\n Cacar monyet (monkeypox) adalah "
                              "\n salah satu penyakit yang disebabkan "
                              "\n oleh infeksi virus dari kelompok yang "
                              "\n serupa dengan penyakit cacar. "
                              "\n Penyakit cacar monyet adalah "
                              "\n penyakit menular dan penularan bisa "
                              "\n terjadi melalui hewan dan manusia.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            ),
                          ],
                        ),
                      )),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 220,
                        width: 400,
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                "MonkeyPox Symptoms",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "Roboto"),
                              ),
                              Text(
                                "\n Gejala cacar monyet akan timbul "
                                "\n 5-21 hari setelah penderita terinfeksi "
                                "\n virus monkeypox. Gejala awal cacar "
                                "\n monyet meliputi demam, lemas, "
                                "\n menggigil, sakit kepala, nyeri otot",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Prevention extends StatelessWidget {
  const Prevention({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 6, 2, 133),
              ]),
        ),
        child: ListView(children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 270,
                width: 400,
                child: Card(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "What is Measles ?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Roboto"),
                        ),
                        Text(
                          "\n Campak atau measles adalah "
                          "\n penyakit akibat infeksi virus yang "
                          "\n ditandai dengan demam, sakit "
                          "\n tenggorokan, dan ruam di seluruh "
                          "\n tubuh. Infeksi campak berawal dari "
                          "\n saluran pernapasan yang kemudian "
                          "\n menular melalui percikan air liur.",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 270,
                    width: 400,
                    child: Card(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Measles Symptoms",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            ),
                            Text(
                              "\n Umumnya, gejala campak akan "
                              "\n muncul 10–14 hari setelah "
                              "\n seseorang tertular virus penyebab "
                              "\n penyakit ini. Awalnya, campak"
                              "\n dapat menimbulkan gejala berupa:"
                              "\n demam, pilek, pegal linu, lemas, "
                              "\n hidung tersumbat, dan  diare. ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class Treatment extends StatelessWidget {
  const Treatment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 6, 2, 133),
              ]),
        ),
        child: ListView(children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 330,
                width: 400,
                child: Card(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Treatment ChickenPox",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Text(
                          "\n 1. Konsumsi banyak cairan.\n 2. Menggunakan krim atau gel pendingin dari apotek.\n 3.Mandi dengan air dingin untuk meredakan gatal.\n 4. Menggunakan pakaian longgar dengan bahan yang lembut.\n 5. Memotong kuku anak agar tidak melukai lepuhan ruam.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Roboto",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 280,
                    width: 400,
                    child: Card(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Treatment MonkeyPox",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Roboto"),
                            ),
                            Text(
                              "\n 1. Meminum obat antivirus seperti cidofovir atau tecovirimat.\n 2. Memperbanyak istirahat.\n 3.Memenuhi kebutuhan cairan serta makanan bergizi seimbang.\n 4. Hindari konsumsi olahan daging yang tidak matang.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: "Roboto",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 320,
                        width: 400,
                        child: Card(
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "Treatment Measles",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                Text(
                                  "\n 1. Minum paracetamol atau ibuprofen untuk meredakan nyeri dan demam.\n 2. Mandi dengan air hangat.\n 3.Minum air putih lebih sering untuk mencegah dehidrasi.\n 4. Membersihkan kotoran atau kerak di mata dengan kapas yang dibasahi air hangat bersih.\n 5. Mengonsumsi makanan bergizi.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "Roboto"),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
