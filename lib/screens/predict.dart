import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:smallpox/screens/chat.dart';
import 'package:dio/dio.dart';

Future<http.Response> predict(File imageFile) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(""),
  );
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
  var response = await request.send();
  return await http.Response.fromStream(response);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;
  String _result = '';
  String _label = '';
  String _solution = '';
  final ImagePicker _picker = ImagePicker();

  Future<void> uploadFileImage() async {
    File imageFileUpload = File(_image!.path);
    String? fileName = _image?.path.split('/').last;

    String uploadEndpoint =
        "https://c0e1-103-166-147-253.ngrok-free.app//uploadFileAndroid"; // Ganti dengan alamat server Flask yang sesuai
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(_image!.path, filename: fileName),
    });

    try {
      Response response = await dio.post(uploadEndpoint, data: formData);
      if (response.data == 'sukses') {
        print('Upload berhasil: ${response.data}');
      } else {
        print('${response.data}');
      }
    } catch (e) {
      print('Error during upload: $e');
    }
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    // Membuat AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Tutup alert
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );

    // Menampilkan AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> sendJsonToFlask() async {
    String? Stress;
    if (_image == null) {
      print('File gambar belum dipilih.');
      return;
    }

    String? fileName = _image?.path.split('/').last;
    if (fileName == null) {
      print('Gagal mendapatkan nama file.');
      return;
    }

    String apiUrl =
        "https://c0e1-103-166-147-253.ngrok-free.app//predictAndroid";
    Dio dio = Dio();

    try {
      final Map<String, String> data = {
        'text': fileName,
      };

      // Menggunakan opsi `data` untuk mengirim data dalam format JSON
      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
        data: jsonEncode(data),
      );

      // Periksa apakah respons server sukses
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            response.data; // Use `response.data` for Dio
        String message = responseData['message'];

        // if (message == 4) {
        //   Stress = "Stress Tingkat Rendah";
        // } else if (message == 5 || message == 1) {
        //   Stress = "Stress Tingkat Sedang";
        // } else if (message == 2 || message == 0) {
        //   Stress = "2";
        // } else {
        //   Stress = "Tidak Ada Stress";
        // }
        print("$message");
        _showAlertDialog(context, 'Penyakit', 'Jenis $message');
      } else {
        print('Permintaan gagal. Kode respons: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during request: $e');
    }
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _getImageResult(File(pickedFile.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ERROR'),
        ),
      );
    }
  }

  Future<void> _getImageResult(File imageFile) async {
    setState(
      () {
        _image = imageFile;
        _result = '';
        _label = 'Predicting...';
        _solution = '...';
      },
    );

    final response = await predict(imageFile);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      setState(
        () {
          _result = responseJson['pred'] ?? 'Failed to predict';
          _solution = responseJson['prec'] ?? 'Failed to predict';
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ERROR'),
        ),
      );
      setState(
        () {
          _image = null;
          _result = '';
          _label = 'Failed to predict';
          _solution = '';
        },
      );
    }
  }

  void _clearOutput() {
    setState(
      () {
        _image = null;
        _result = '';
        _label = '';
        _solution = '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_result == "Smallpox Detected") {
      // Redirect to another screen if _result is "melanoma" with a delay
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatApp()),
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DETECTOR",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_image == null)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Image(image: AssetImage('assets/images/dwd.png')),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.file(
                      _image!,
                      height: 250,
                      width: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => _getImage(ImageSource.camera),
                        child: Ink(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt_rounded),
                              SizedBox(width: 10),
                              Text(
                                'Take a Photo',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _getImage(ImageSource.gallery),
                      child: Ink(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_library_rounded),
                            SizedBox(width: 10),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: InkWell(
                        onTap: _clearOutput,
                        child: Ink(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.refresh,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 1),
                                  Text(
                                    'Refresh',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          uploadFileImage();
                          sendJsonToFlask();
                        },
                        child: Ink(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(
                                //   Icons.refresh,
                                //   size: 24,
                                //   color: Colors.white,
                                // ),
                                SizedBox(width: 10),
                                Text(
                                  'Predict',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                _result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 40,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  _solution,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  _solution,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
