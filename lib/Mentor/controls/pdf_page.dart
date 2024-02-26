import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PDFPage extends StatelessWidget {
  Future<dynamic> fetchContentFromServer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    var url = dotenv.env['SERVER'];
    final response =
        await http.get(Uri.parse('http://$url/mentor/content/$username'));
    if (response.statusCode == 200) {
      var content = json.decode(response.body)['result'];
      print(content);
      return content;
    } else {
      throw Exception('Failed to load content');
    }
  }

  Future<void> generateAndPreviewPdf(content) async {
    final pdf = pdfWidgets.Document();

    var studentData = content;
    print(studentData);

    for (int i = 0; i < studentData.length; i++) {
      pdf.addPage(
        pdfWidgets.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pdfWidgets.Column(
              children: [
                pdfWidgets.Header(
                  level: 0,
                  child: pdfWidgets.Text('Student Report'),
                ),
                pdfWidgets.Paragraph(
                  text: 'Name: ${studentData[i]['name']}',
                ),
                pdfWidgets.Paragraph(
                  text: 'Roll No: ${studentData[i]['roll_no']}',
                ),
                pdfWidgets.Paragraph(
                  text: 'Class: ${studentData[i]['class']}',
                ),
                pdfWidgets.Paragraph(
                  text: 'Section: ${studentData[i]['section']}',
                ),
                pdfWidgets.Paragraph(
                  text: 'Attendance: ${studentData[i]['attendance']}',
                ),
                pdfWidgets.Paragraph(
                  text: 'Marks: ${studentData[i]['marks']}',
                ),
              ],
            );
          },
        ),
      );
    }

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      return pdf.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Generate PDF'),
          onPressed: () async {
            var content = await fetchContentFromServer();
            await generateAndPreviewPdf(content);
          },
        ),
      ),
    );
  }
}
