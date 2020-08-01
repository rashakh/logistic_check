import 'package:flutter/material.dart';
import 'package:logistic_check/controller.dart';

import 'model/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: MyHomePage(title: 'ادخل البيانات')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _billIDController = TextEditingController();
  final _sellerNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _modelController = TextEditingController();
  final _picController = TextEditingController();
  final _statusController = TextEditingController();

  void _submit() {
    if (_formKey.currentState.validate()) {
      Data data = Data(
        _billIDController.text,
        _sellerNameController.text,
        _dateController.text,
        _modelController.text,
        _picController.text,
        _statusController.text,
      );
      FormController formController = FormController((String response) {
        print('response = $response');
        if (response == FormController.STATUS_SUCCESS) {
          _showsnackBar('تم الارسال بنجاح');
        } else {
          _showsnackBar('لم يتم الارسال');
        }
      });
      //_showsnackBar('تم الارسال بنجاح');
      formController.submitForm(data);
    }
  }

  _showsnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _billIDController,
                    validator: (val) {
                      return val.isEmpty ? 'هذا الحقل مطلوب' : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'ادخل رقم الفاتورة',
                    ),
                  ),
                  TextFormField(
                    controller: _sellerNameController,
                    validator: (val) {
                      return val.isEmpty ? 'هذا الحقل مطلوب' : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'اختر اسم البائع',
                    ),
                  ),
                  TextFormField(
                    controller: _dateController,
                    validator: (val) {
                      return val.isEmpty ? 'هذا الحقل مطلوب' : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'وقت الإستلام',
                    ),
                  ),
                  TextFormField(
                    controller: _modelController,
                    validator: (val) {
                      return val.isEmpty ? 'هذا الحقل مطلوب' : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'رقم الموديل',
                    ),
                  ),
                  TextFormField(
                    controller: _picController,
                    validator: (val) {
                      return val.isEmpty ? 'هذا الحقل مطلوب' : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'صورة المنتج',
                    ),
                  ),
                  TextFormField(
                    controller: _statusController,
                    validator: (val) {
                      return val.isEmpty ? 'هذا الحقل مطلوب' : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'هل الحالة تتوافق؟',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
