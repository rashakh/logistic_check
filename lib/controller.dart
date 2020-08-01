import 'model/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  final void Function(String) callbak;
  static const String URL =
      'https://script.google.com/macros/s/AKfycbwrDnt1ODKjd9idZLNSWOzUKNlmaWG6kir_EOlK2uy5j9yHuc4/exec';
  static const STATUS_SUCCESS = 'SUCCESS';
  FormController(this.callbak);
  void submitForm(Data data) async {
    try {
      await http.get(URL + data.toParams()).then((response) {
        print(URL + data.toParams());
        callbak(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print('contorller e = ${e.toString()}');
    }
  }
}
