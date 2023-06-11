import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _hasAgreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Introduction',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'Welcome to our book store app. By using our app, you agree to be bound by these terms and conditions. If you do not agree to these terms and conditions, you should not use our app.'),
            SizedBox(height: 16.0),
            Text(
              'Use of the app',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'Our app is provided for your personal, non-commercial use. You may not use our app for any illegal or unauthorized purpose, and you agree to comply with all applicable laws and regulations.'),
            SizedBox(height: 16.0),
            Text(
              'Payment and refunds',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'When you purchase a book through our app, you will be charged the price listed on the books page. All sales are final, and we do not offer refunds except in cases where the book is defective or damaged.'),
            SizedBox(height: 16.0),
            Text(
              'Intellectual property',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'All content and materials provided through our app, including but not limited to text, graphics, images, and software, are the property of our company or our licensors and are protected by copyright, trademark, and other intellectual property laws.'),
            SizedBox(height: 16.0),
            Text(
              'Disclaimer of warranties',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'Our app is provided "as is" and without warranties of any kind, either express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose, or non-infringement. We do not guarantee that our app will be uninterrupted, error-free, or free of viruses or other harmful components.'),
            SizedBox(height: 16.0),
            Text(
              'Limitation of liability',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'In no event shall our company, our affiliates, or our licensors be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of our app, whether based on contract, tort, strict liability, or any other legal theory.'),
            SizedBox(height: 16.0),
            Text(
              'Termination',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'We reserve the right to terminate your use of our app at any time and for any reason, without notice.'),
            SizedBox(height: 16.0),
            Text(
              'Governing law',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'These terms and conditions shall be governed by and construed in accordance with the laws of [your country or state]. Any disputes arising under or in connection with these terms and conditions shall be subject to the exclusive jurisdiction of the courts of [your country or state].'),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('I agree to the terms and conditions'),
              value: _hasAgreedToTerms,
              onChanged: (value) {
                setState(() {
                  _hasAgreedToTerms = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Continue'),
              onPressed: _hasAgreedToTerms
                  ? () {
                      Get.back();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
