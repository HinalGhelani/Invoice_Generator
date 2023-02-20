import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'Global_page.dart';
import 'Modal/Models.dart';

class pdfPage extends StatefulWidget {
  const pdfPage({Key? key}) : super(key: key);

  @override
  State<pdfPage> createState() => _pdfPageState();
}

class _pdfPageState extends State<pdfPage> {
  final pdf = pw.Document();

  List<String> Details = [
    "Item\nName",
    "Qun",
    "Rate",
    "SGST",
    "CGST",
    "Cess",
    "Amount"
  ];

  List<Invoice> allDetail = [
    Invoice(
        name: GlobalVar.nameI,
        qun: GlobalVar.qunI,
        rate: GlobalVar.priceI,
        sGst: GlobalVar.sGst,
        cGst: GlobalVar.cGst,
        cess: GlobalVar.cessI,
        amount: GlobalVar.priceI)
  ];

  @override
  void initState() {
    super.initState();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(15),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text(
                    "Tax Invoice",
                    style: pw.TextStyle(
                      fontSize: 20,
                      color: const PdfColor.fromInt(0xff424242),
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            GlobalVar.businessB,
                            style: pw.TextStyle(
                                fontSize: 15,
                                fontWeight: pw.FontWeight.bold,
                                color: const PdfColor.fromInt(0xff424242)),
                          ),
                          pw.Text(
                            GlobalVar.nameB,
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            GlobalVar.streetB,
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            "${GlobalVar.stateB}, ${GlobalVar.zipB}",
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            "India",
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            "GSTIN  ${GlobalVar.gstB}",
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.Expanded(child: pw.Container()),
                  ],
                ),
                pw.SizedBox(height: 30),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "Bill To",
                            style: pw.TextStyle(
                                fontSize: 13,
                                fontWeight: pw.FontWeight.bold,
                                color: const PdfColor.fromInt(0xff424242)),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Text(
                            GlobalVar.nameC,
                            style: const pw.TextStyle(
                                fontSize: 10,
                                color: PdfColor.fromInt(0xff757575)),
                          ),
                          pw.Text(
                            GlobalVar.stateC,
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            "${GlobalVar.stateC}, ${GlobalVar.zipC}",
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            GlobalVar.countryC,
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.Text(
                            "GSTIN  ${GlobalVar.GstC}",
                            style: const pw.TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff757575),
                            ),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Place of Supply : ",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    color: const PdfColor.fromInt(0xff424242),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                GlobalVar.placeC,
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff757575),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              pw.Text(
                                "Invoice Number",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    color: const PdfColor.fromInt(0xff424242),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                "     ${GlobalVar.num}",
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xff757575),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Invoice Date",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    color: const PdfColor.fromInt(0xff424242),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                "              ${GlobalVar.inDate}",
                                style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff757575)),
                              )
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Due Date",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    color: const PdfColor.fromInt(0xff424242),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                "                       ${GlobalVar.dueDt}",
                                style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff757575)),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                pw.SizedBox(height: 30),
                pw.Container(
                  height: 35,
                  width: double.infinity,
                  color: const PdfColor.fromInt(0xff595959),
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "Item Name",
                              style: const pw.TextStyle(
                                fontSize: 8,
                                color: PdfColor.fromInt(0xffFFFFFF),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                "Qun",
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xffFFFFFF),
                                ),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                "Rate",
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xffFFFFFF),
                                ),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                "SGST",
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xffFFFFFF),
                                ),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                "CGST",
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xffFFFFFF),
                                ),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                "Cess",
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xffFFFFFF),
                                ),
                              ),
                            )),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Text(
                              "Amount",
                              style: const pw.TextStyle(
                                fontSize: 8,
                                color: PdfColor.fromInt(0xffFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 25,
                  width: double.infinity,
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            GlobalVar.nameI,
                            style: const pw.TextStyle(
                              fontSize: 8,
                              color: PdfColor.fromInt(0xff424242),
                            ),
                          ),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                GlobalVar.qunI,
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xff424242),
                                ),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                GlobalVar.priceI,
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xff424242),
                                ),
                              ),
                            )),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                GlobalVar.gstI,
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xff424242),
                                ),
                              ),
                            )),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Text(
                              GlobalVar.gstI,
                              style: const pw.TextStyle(
                                fontSize: 8,
                                color: PdfColor.fromInt(0xff424242),
                              ),
                            ),
                          ),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                GlobalVar.cessI,
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColor.fromInt(0xff424242),
                                ),
                              ),
                            )),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Text(
                              GlobalVar.priceI,
                              style: const pw.TextStyle(
                                fontSize: 8,
                                color: PdfColor.fromInt(0xff424242),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.all(8),
                  height: 25,
                  width: double.infinity,
                  child: pw.Row(
                    children: [
                      pw.Text(
                        "HSN",
                        style: const pw.TextStyle(
                            fontSize: 8, color: PdfColor.fromInt(0xff424242)),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                        GlobalVar.hsnI,
                        style: const pw.TextStyle(
                          fontSize: 8,
                          color: PdfColor.fromInt(0xff424242),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Divider(
                  height: 1,
                  endIndent: 8,
                  indent: 8,
                  color: const PdfColor.fromInt(0xff757575),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.all(8),
                  height: 100,
                  child: pw.Row(
                    children: [
                      pw.Expanded(flex: 3, child: pw.Container()),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                                child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.end,
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              children: [
                                pw.Text(
                                  "Sub Total",
                                  style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff424242),
                                  ),
                                ),
                                pw.Text(
                                  "SGST (9%)",
                                  style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff424242),
                                  ),
                                ),
                                pw.Text(
                                  "CGST (9%)",
                                  style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff424242),
                                  ),
                                ),
                                pw.Text(
                                  "Cess (12%)",
                                  style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff424242),
                                  ),
                                ),
                                pw.Text(
                                  "Total",
                                  style: const pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColor.fromInt(0xff424242),
                                  ),
                                ),
                              ],
                            )),
                            pw.Expanded(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceAround,
                                children: [
                                  pw.Text(
                                    GlobalVar.priceI,
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      fontWeight: pw.FontWeight.bold,
                                      color: const PdfColor.fromInt(0xff424242),
                                    ),
                                  ),
                                  pw.Text(
                                    GlobalVar.gstI,
                                    style: const pw.TextStyle(
                                      fontSize: 8,
                                      color: PdfColor.fromInt(0xff424242),
                                    ),
                                  ),
                                  pw.Text(
                                    GlobalVar.gstI,
                                    style: const pw.TextStyle(
                                      fontSize: 8,
                                      color: PdfColor.fromInt(0xff424242),
                                    ),
                                  ),
                                  pw.Text(
                                    GlobalVar.cessI,
                                    style: const pw.TextStyle(
                                      fontSize: 8,
                                      color: PdfColor.fromInt(0xff424242),
                                    ),
                                  ),
                                  pw.Text(
                                    (GlobalVar.priceI),
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      fontWeight: pw.FontWeight.bold,
                                      color: const PdfColor.fromInt(0xff424242),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 8, top: 20),
                  height: 60,
                  width: 150,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Notes",
                        style: pw.TextStyle(
                            fontSize: 10,
                            color: const PdfColor.fromInt(0xff424242),
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        GlobalVar.note,
                        style: const pw.TextStyle(
                            fontSize: 8, color: PdfColor.fromInt(0xff757575)),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 8, top: 5),
                  height: 60,
                  width: 150,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Terms & Conditions",
                        style: pw.TextStyle(
                            fontSize: 10,
                            color: const PdfColor.fromInt(0xff424242),
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        GlobalVar.condi,
                        style: const pw.TextStyle(
                            fontSize: 8, color: PdfColor.fromInt(0xff757575)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PDF Page",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() async {
                  Uint8List data = await pdf.save();
                  await Printing.layoutPdf(onLayout: (format) => data);
                });
              },
              icon: const Icon(Icons.save_alt_sharp))
        ],
      ),
      body: SizedBox(
        height: 3580,
        width: 2480,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Tax Invoice",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff424242),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GlobalVar.businessB,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff424242)),
                        ),
                        Text(
                          GlobalVar.nameB,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        Text(
                          GlobalVar.streetB,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        Text(
                          "${GlobalVar.stateB}, ${GlobalVar.zipB}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        const Text(
                          "India",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        Text(
                          "GSTIN  ${GlobalVar.gstB}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bill To",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff424242)),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          GlobalVar.nameC,
                          style: const TextStyle(
                              fontSize: 10, color: Color(0xff757575)),
                        ),
                        Text(
                          GlobalVar.stateC,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        Text(
                          "${GlobalVar.stateC}, ${GlobalVar.zipC}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        Text(
                          GlobalVar.countryC,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        Text(
                          "GSTIN  ${GlobalVar.GstC}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff757575),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              "Place of Supply : ",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff424242),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              GlobalVar.placeC,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xff757575),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Invoice Number",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff424242),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "     ${GlobalVar.num}",
                              style: const TextStyle(
                                fontSize: 8,
                                color: Color(0xff757575),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Invoice Date",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff424242),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "              ${GlobalVar.inDate}",
                              style: const TextStyle(
                                  fontSize: 8, color: Color(0xff757575)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Due Date",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff424242),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "                       ${GlobalVar.dueDt}",
                              style: const TextStyle(
                                  fontSize: 8, color: Color(0xff757575)),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: DataTable(
                  columnSpacing: 16,
                  headingRowHeight: 40,
                  dataRowHeight: 30,
                  showBottomBorder: true,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xff595959)),
                  columns: Details.map(
                    (e) => DataColumn(
                      label: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ).toList(),
                  rows: allDetail
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                e.name,
                                style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                              ),
                            ),
                            DataCell(
                              Text(e.qun,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            ),
                            DataCell(
                              Text(e.rate,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            ),
                            DataCell(
                              Text("${e.sGst}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            ),
                            DataCell(
                              Text("${e.cGst}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            ),
                            DataCell(
                              Text(e.cess,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            ),
                            DataCell(
                              Text(e.amount,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),

              // Container(
              //   height: 35,
              //   width: double.infinity,
              //   color: const Color(0xff595959),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: const [
              //         Expanded(
              //             flex: 2,
              //             child: Text(
              //               "Item Name",
              //               style: TextStyle(
              //                 fontSize: 8,
              //                 color: Color(0xffFFFFFF),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 "Qun",
              //                 style: TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xffFFFFFF),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 "Rate",
              //                 style: TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xffFFFFFF),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 "SGST",
              //                 style: TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xffFFFFFF),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 "CGST",
              //                 style: TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xffFFFFFF),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 "Cess",
              //                 style: TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xffFFFFFF),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //           flex: 1,
              //           child: Align(
              //             alignment: Alignment.centerRight,
              //             child: Text(
              //               "Amount",
              //               style: TextStyle(
              //                 fontSize: 8,
              //                 color: Color(0xffFFFFFF),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              //
              // SizedBox(
              //   height: 25,
              //   width: double.infinity,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           flex: 2,
              //           child: Text(
              //             GlobalVar.nameI,
              //             style: const TextStyle(
              //               fontSize: 8,
              //               color: Color(0xff424242),
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 GlobalVar.qunI,
              //                 style: const TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xff424242),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 GlobalVar.priceI,
              //                 style: const TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xff424242),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 '${GlobalVar.cGst}',
              //                 style: const TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xff424242),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //           flex: 1,
              //           child: Align(
              //             alignment: Alignment.centerRight,
              //             child: Text(
              //               '${GlobalVar.sGst}',
              //               style: const TextStyle(
              //                 fontSize: 8,
              //                 color: Color(0xff424242),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 GlobalVar.cessI,
              //                 style: const TextStyle(
              //                   fontSize: 8,
              //                   color: Color(0xff424242),
              //                 ),
              //               ),
              //             )),
              //         Expanded(
              //           flex: 1,
              //           child: Align(
              //             alignment: Alignment.centerRight,
              //             child: Text(
              //               GlobalVar.priceI,
              //               style: const TextStyle(
              //                 fontSize: 8,
              //                 color: Color(0xff424242),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.all(8),
                height: 25,
                width: double.infinity,
                child: Row(
                  children: [
                    const Text(
                      "HSN",
                      style: TextStyle(fontSize: 8, color: Color(0xff424242)),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      GlobalVar.hsnI,
                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xff424242),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                endIndent: 8,
                indent: 8,
                color: Color(0xff757575),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 100,
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Container()),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Sub Total",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff424242),
                                ),
                              ),
                              Text(
                                "SGST (${GlobalVar.cGst}%)",
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff424242),
                                ),
                              ),
                              Text(
                                "CGST (${GlobalVar.sGst}%)",
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff424242),
                                ),
                              ),
                              Text(
                                "Cess (${GlobalVar.cessI}%)",
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff424242),
                                ),
                              ),
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff424242),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${GlobalVar.totalPrice}",
                                  style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff424242),
                                  ),
                                ),
                                Text(
                                  "${GlobalVar.totalGst}",
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Color(0xff424242),
                                  ),
                                ),
                                Text(
                                  "${GlobalVar.totalGst}",
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Color(0xff424242),
                                  ),
                                ),
                                Text(
                                  "${GlobalVar.totalCess}",
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Color(0xff424242),
                                  ),
                                ),
                                Text(
                                  "₹ ${GlobalVar.totalBill}",
                                  style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff424242),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 20),
                height: 60,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notes",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff424242),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      GlobalVar.note,
                      style: const TextStyle(
                          fontSize: 8, color: Color(0xff757575)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 5),
                height: 60,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Terms & Conditions",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff424242),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      GlobalVar.condi,
                      style: const TextStyle(
                          fontSize: 8, color: Color(0xff757575)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

