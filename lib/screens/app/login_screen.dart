import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _emailLegnth = 0;

  String? _emailError;
  String? _passwordError;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  late String _language;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back...",
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Enter email & password",
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w300,
                  color: Colors.black45,
                  fontSize: 18,
                  height: 0.8),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailTextController,
              style: GoogleFonts.poppins(),
              keyboardType: TextInputType.emailAddress,
              //************************
              // textAlign: TextAlign.start,
              // textDirection: TextDirection.ltr,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical.center,
              obscureText: false,
              obscuringCharacter: '*',
              //************************
              onChanged: (String value) {
                setState(() {
                  _emailLegnth = value.length;
                });
              },
              onSubmitted: (String value) => print(value),
              onTap: () => print("Tapped"),
              //************************
              showCursor: true,
              cursorColor: Colors.blue,
              // cursorHeight: 10,
              cursorWidth: 2,
              cursorRadius: const Radius.circular(0),
              //************************
              enabled: true,
              readOnly: false,
              //************************
              autocorrect: true,
              autofocus: false,
              //************************
              autofillHints: ['@gmail.com', '@hotmail.com'],
              enableSuggestions: true,
              //************************
              // maxLength: 30,
              // buildCounter: (context, {required currentLength, required isFocused, maxLength}) {
              //   return null;
              //   // return Text('$currentLength :: $maxLength');
              // },
              //************************
              // minLines: 2,
              // maxLines: 2,
              //************************
              minLines: null,
              maxLines: null,
              expands: true,
              //************************
              decoration: InputDecoration(
                // counterText: '',
                // counterText: '$_emailLegnth/30',
                // counter: Text('${_emailLegnth}/30'),
                //************************
                // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                contentPadding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  maxHeight: _emailError == null ? 50 : 75,
                ),
                //************************
                hintText: "Email",
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                  fontSize: 14,
                ),
                hintMaxLines: 1,
                // hintTextDirection: TextDirection.ltr,
                //************************
                // labelText: 'Email',
                // labelStyle: GoogleFonts.poppins(
                //   fontWeight: FontWeight.w300,
                //   fontSize: 14,
                // ),
                // floatingLabelAlignment: FloatingLabelAlignment.start,
                // floatingLabelBehavior: FloatingLabelBehavior.never,
                // floatingLabelStyle: GoogleFonts.poppins(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 14,
                // ),
                // alignLabelWithHint: false,
                //************************
                fillColor: Colors.grey,
                filled: false,
                //************************
                // helperText: 'Ex: email@app.com',
                helperMaxLines: 1,
                helperStyle: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: 12,
                ),
                //************************
                enabled: false,
                //************************
                // icon: Icon(Icons.email),
                prefixIcon: const Icon(Icons.email),
                // prefixText: 'email-',
                // prefix: Text('email'),
                // prefixStyle: GoogleFonts.cabin(fontSize: 22),
                //************************
                // suffixIcon: IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.send),
                // ),
                // suffixText: 'Available',
                // suffixStyle: GoogleFonts.poppins(
                //   fontSize: 12,
                //   color: Colors.grey,
                // ),
                // suffix: Text('TEXT'),
                //************************
                // border: UnderlineInputBorder(),
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: Colors.blue.shade800),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                      strokeAlign: StrokeAlign.center,
                      style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue.shade700,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                //************************
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade400,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  ),
                ),
                errorText: _emailError,
                //************************
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordTextController,
              style: GoogleFonts.poppins(),
              obscureText: true,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: _passwordError == null ? 50 : 75,
                ),
                contentPadding: EdgeInsets.zero,
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                      strokeAlign: StrokeAlign.center,
                      style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue.shade700,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade400,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  ),
                ),
                errorText: _passwordError,
                //************************
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _performLogin(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text("Login",),
            ),

          ],
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    setState(() {
      _emailError = _emailTextController.text.isEmpty ? 'Enter email' : null;
      _passwordError =
          _passwordTextController.text.isEmpty ? 'Enter password' : null;
    });
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter required data"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        ),
    );
    return false;
  }

  void _login() async {
    Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
  }


}
