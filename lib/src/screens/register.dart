import 'package:flutter/material.dart';
import '../mixins/validation.dart';

class RegisterScreen extends StatefulWidget {
  createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> with Validation{

  final formKey = GlobalKey<FormState>(); //MEMBUAT GLOBAL KEY UNTUK VALIDASI 
  
  // DEFINE VARIABLE
  String name = '';
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0), //SET MARGIN DARI CONTAINER 
      child: Form(
        key: formKey, 
        child: Column( 
          //CHILDREN DARI COLUMN BERISI 4 BUAH OBJECT YANG AKAN DI-RENDER, YAKNI
          // TextInput UNTUK NAME, EMAIL, PASSWORD DAN TOMBOL DAFTAR
          children: [
            nameField(),
            emailField(),
            passwordField(),
            registerButton(),
          ],
        )
      ),
    );
  }

  Widget nameField() {
    //MEMBUAT TEXT INPUT 
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama Lengkap' //DENGAN LABEL Nama Lengkap
      ),
      validator: validateName, //validateName ADALAH NAMA FUNGSI PADA FILE validation.dart
      onSaved: (String value) { //KETIKA LOLOS VALIDASI
        name = value; //MAKA VARIABLE name AKAN DIISI DENGAN TEXT YANG TELAH DI-INPUT
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress, // KEYBOARD TYPENYA ADALAH EMAIL ADDRESS
      //AGAR SYMBOL @ DILETAKKAN DIDEPAN KETIKA KEYBOARD DI TAMPILKAN
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@example.com',
      ),
      validator: validateEmail, //BERLAKU SAMA DENGAN HELPERS SEBELUMNYA
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true, //KETIKA obsecureText bernilai TRUE
      //MAKA SAMA DENGAN TYPE PASSWORD PADA HTML
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
      ),
     validator: validatePassword, ////BERLAKU SAMA DENGAN HELPERS SEBELUMNYA
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget registerButton() {
    //MEMBUAT TOMBOL
    return RaisedButton(
      color: Colors.blueAccent, //MENGATUR WARNA TOMBOL
      onPressed: () {
         if (formKey.currentState.validate()) { //JIKA TRUE
          formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN
          
          //DISINI KAMU BISA MENGHANDLE DATA YANG SDH DITAMPUNG PADA MASING-MASING VARIABLE
          //KAMU DAPAT MENGIRIMNYA KE API ATAU APAPUN
          //NAMUN UNTUK SEMENTARA KITA PRINT KE CONSOLE SAJA
          //KARENA BELUM MEMBAHAS TENTANG HTTP REQUEST
          print('Nama lengkap: $name');
          print('Email: $email');
          print('Passwor: $password');
        }
      },
      child: Text('Daftar'), //TEXT YANG AKAN DITAMPILKAN PADA TOMBOL
    );
  }
}