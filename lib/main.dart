// main Screen

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_3/pdf_page.dart';

import 'Global_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'home': (context) => const invoiceApp(),
      'pdf': (context) => const pdfPage(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, 'home'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Image(
        image: AssetImage("assets/Invoice/logo.png"),
        height: 200,
        width: 200,
      ),
    );
  }
}

class invoiceApp extends StatefulWidget {
  const invoiceApp({Key? key}) : super(key: key);

  @override
  State<invoiceApp> createState() => _invoiceAppState();
}

class _invoiceAppState extends State<invoiceApp> {
  int price = 0, qun = 0, gst = 0, cess = 0;
  late double total = ((price * qun) + totalGst + totalGst + (totalCess));
  late double totalGst = ((price * qun * 0.01) * (gst / 2));
  late double totalCess = ((price * qun * 0.01 * cess));

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "INVOICE GENERATOR",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
              wordSpacing: 2),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )),
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.98,
                      width: w,
                      padding: const EdgeInsets.all(25),
                      child: Form(
                        key: GlobalVar.businessDetail,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        GlobalVar.businessDetail.currentState!
                                            .reset();
                                        GlobalVar.bBusiness.clear();
                                        GlobalVar.bName.clear();
                                        GlobalVar.bGST.clear();
                                        GlobalVar.bDate.clear();
                                        GlobalVar.bStreet.clear();
                                        GlobalVar.bCity.clear();
                                        GlobalVar.bState.clear();
                                        GlobalVar.bZip.clear();
                                        GlobalVar.bLocate.clear();
                                      });
                                    },
                                    child: Text(
                                      "Clear",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red.shade700,
                                      ),
                                    )),
                                Text(
                                  "Business Details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w400),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Business Name",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(
                                        "*",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "    Your Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      controller: GlobalVar.bBusiness,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "please enter this";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          GlobalVar.businessB = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      controller: GlobalVar.bName,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "please enter this";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          GlobalVar.nameB = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "GSTIN",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "    Business Location",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: GlobalVar.bGST,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "please enter this";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          GlobalVar.gstB = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      controller: GlobalVar.bLocate,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "please enter this";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          GlobalVar.locateB = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Date",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 45,
                              width: w,
                              child: TextFormField(
                                controller: GlobalVar.bDate,
                                keyboardType: TextInputType.none,
                                onTap: () async {
                                  DateTime? selectDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2010),
                                      lastDate: DateTime(2030));
                                  if (selectDate != null) {
                                    GlobalVar.dateB = DateFormat("dd/MM/YYYY")
                                        .format(selectDate);
                                    setState(() {
                                      GlobalVar.bDate.text = GlobalVar.dateB;
                                    });
                                  }
                                },
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "please enter this";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "DD/MM/YY"),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Street",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 45,
                              width: w,
                              child: TextFormField(
                                controller: GlobalVar.bStreet,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "please enter this";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    GlobalVar.streetB = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "City",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade700,
                                        fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "    State",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade700,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      controller: GlobalVar.bCity,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "please enter this";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          GlobalVar.cityB = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      controller: GlobalVar.bState,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "please enter this";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          GlobalVar.streetB = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Choose State"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "ZIP/Postal Code",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 45,
                              width: w,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: GlobalVar.bZip,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "please enter this";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    GlobalVar.zipB = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                if (GlobalVar.businessDetail.currentState!
                                    .validate()) {
                                  GlobalVar.businessDetail.currentState!.save();
                                }
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                height: 50,
                                width: w,
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Done",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.grey.shade500,
            ),
            color: Colors.grey.shade500,
          )
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: w,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xffE2E3E6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        alignment: Alignment.center,
                        child: Column(
                          children: const [
                            Text(
                              "New Invoice",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff081631),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "       Fill in the required details\nto generate and share this Invoice",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff375080),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Form(
                          key: GlobalVar.page1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Customer",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Text(
                                    "*",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: const EdgeInsets.all(25),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.85,
                                            width: w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          GlobalVar
                                                              .customerDetail
                                                              .currentState!
                                                              .reset();
                                                          GlobalVar.cName
                                                              .clear();
                                                          GlobalVar.cGSTNo
                                                              .clear();
                                                          GlobalVar.cPlace
                                                              .clear();
                                                          GlobalVar.cStreet
                                                              .clear();
                                                          GlobalVar.cState
                                                              .clear();
                                                          GlobalVar.cZipCode
                                                              .clear();
                                                          GlobalVar.cCountry
                                                              .clear();
                                                          GlobalVar.cCity
                                                              .clear();
                                                        });
                                                      },
                                                      child: Text(
                                                        "Clear",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors
                                                                .red.shade700),
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Customer Details",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Colors.grey,
                                                ),
                                                Form(
                                                  key: GlobalVar.customerDetail,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Customer Name",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          const Text(
                                                            "*",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .deepOrange,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      SizedBox(
                                                        height: 50,
                                                        width: w,
                                                        child: TextFormField(
                                                          controller:
                                                              GlobalVar.cName,
                                                          validator: (val) {
                                                            if (val == null ||
                                                                val.isEmpty) {
                                                              return "please enter this";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              GlobalVar.nameC =
                                                                  val;
                                                            });
                                                          },
                                                          decoration: const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  "Who are you selling to?"),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "GSTIN",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "    Place Of Supply",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                    keyboardType: TextInputType.number,
                                                                controller:
                                                                    GlobalVar
                                                                        .cGSTNo,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .GstC =
                                                                        val;
                                                                  });
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 30),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    GlobalVar
                                                                        .cPlace,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .placeC =
                                                                        val;
                                                                  });
                                                                },
                                                                decoration: const InputDecoration(
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        "Choose State ^"),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Text(
                                                          "Street",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .grey.shade700),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      SizedBox(
                                                        height: 45,
                                                        width: w,
                                                        child: TextFormField(
                                                          controller:
                                                              GlobalVar.cStreet,
                                                          validator: (val) {
                                                            if (val == null ||
                                                                val.isEmpty) {
                                                              return "please enter this";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              GlobalVar
                                                                      .streetC =
                                                                  val;
                                                            });
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder()),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "City",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "     State",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    GlobalVar
                                                                        .cCity,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .cityC =
                                                                        val;
                                                                  });
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 30),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    GlobalVar
                                                                        .cState,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .stateC =
                                                                        val;
                                                                  });
                                                                },
                                                                decoration: const InputDecoration(
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        "Choose State ^"),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "ZIP Code",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "    Country",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                    keyboardType: TextInputType.number,
                                                                controller:
                                                                    GlobalVar
                                                                        .cZipCode,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .zipC =
                                                                        val;
                                                                  });
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 30),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    GlobalVar
                                                                        .cCountry,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .countryC =
                                                                        val;
                                                                  });
                                                                },
                                                                decoration: const InputDecoration(
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        "India"),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      InkWell(
                                                        onTap: () {
                                                          if (GlobalVar
                                                              .customerDetail
                                                              .currentState!
                                                              .validate()) {
                                                            GlobalVar
                                                                .customerDetail
                                                                .currentState!
                                                                .save();
                                                          }
                                                          setState(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 50,
                                                          width: w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.indigo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                            "Done",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF0F1F3),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add_circle,
                                        color: Colors.indigo,
                                      ),
                                      Text(
                                        "  Add Customer Details",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Invoice Date",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Text(
                                          "*",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Due Date",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Text(
                                          "*",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: 60,
                                      child: TextFormField(
                                        controller: GlobalVar.invoiceDt,
                                        keyboardType: TextInputType.none,
                                        onTap: () async {
                                          DateTime? selectDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2010),
                                                  lastDate: DateTime(2030));
                                          if (selectDate != null) {
                                            GlobalVar.inDate =
                                                DateFormat("dd/MM/yyyy")
                                                    .format(selectDate);
                                            setState(() {
                                              GlobalVar.invoiceDt.text =
                                                  GlobalVar.inDate;
                                            });
                                          }
                                        },
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return "please enter this";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "DD/YY/MM"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: 60,
                                      child: TextFormField(
                                        controller: GlobalVar.dueDate,
                                        keyboardType: TextInputType.none,
                                        onTap: () async {
                                          DateTime? selectDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2010),
                                                  lastDate: DateTime(2030));
                                          if (selectDate != null) {
                                            GlobalVar.dueDt =
                                                DateFormat("dd/MM/yyyy")
                                                    .format(selectDate);
                                            setState(() {
                                              GlobalVar.dueDate.text =
                                                  GlobalVar.dueDt;
                                            });
                                          }
                                        },
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return "please enter this";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "DD/YY/MM"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Invoice Number",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Text(
                                          "*",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Currency",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Text(
                                          "*",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: 60,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: GlobalVar.inNumber,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return "please enter this";
                                          }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            GlobalVar.num = val;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "INV-0001"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: 60,
                                      child: TextFormField(
                                        controller: GlobalVar.currency,
                                        keyboardType: TextInputType.number,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return "please enter this";
                                          }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            GlobalVar.curre = val;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "INR"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Text(
                                    "Item",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Text(
                                    "*",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        elevation: 0,
                                        enableDrag: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: const EdgeInsets.all(25),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.95,
                                            width: w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          GlobalVar.itemDetail
                                                              .currentState!
                                                              .reset();
                                                          GlobalVar.iName
                                                              .clear();
                                                          GlobalVar.iHSN
                                                              .clear();
                                                          GlobalVar.iPrice
                                                              .clear();
                                                          GlobalVar.iQun
                                                              .clear();
                                                          GlobalVar.iGST
                                                              .clear();
                                                          GlobalVar.iCess
                                                              .clear();
                                                        });
                                                      },
                                                      child: Text(
                                                        "Clear",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors
                                                                .red.shade700),
                                                      ),
                                                    ),
                                                    Text(
                                                      "Item Details",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors
                                                              .grey.shade700),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(height: 20),
                                                Form(
                                                  key: GlobalVar.itemDetail,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Item Name",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          const Text(
                                                            "*",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .deepOrange,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      SizedBox(
                                                        height: 45,
                                                        width: w,
                                                        child: TextFormField(
                                                          controller:
                                                              GlobalVar.iName,
                                                          validator: (val) {
                                                            if (val == null ||
                                                                val.isEmpty) {
                                                              return "please enter this";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              GlobalVar.nameI =
                                                                  val;
                                                            });
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                "What are you selling? ",
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "HSN",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors
                                                                .grey.shade700),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      SizedBox(
                                                        height: 45,
                                                        width: w,
                                                        child: TextFormField(
                                                          controller:
                                                              GlobalVar.iHSN,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: (val) {
                                                            if (val == null ||
                                                                val.isEmpty) {
                                                              return "please enter this";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              GlobalVar.hsnI =
                                                                  val;
                                                            });
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Price",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .red
                                                                          .shade700),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "    Quantity",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .red
                                                                          .shade700),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    GlobalVar
                                                                        .iPrice,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .priceI =
                                                                        val;
                                                                    price = GlobalVar
                                                                            .priceI
                                                                        as int;
                                                                  });
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      "INR 0.00",
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 30),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 45,
                                                              width: 140,
                                                              child:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    GlobalVar
                                                                        .iQun,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return "please enter this";
                                                                  }
                                                                  return null;
                                                                },
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    GlobalVar
                                                                            .qunI =
                                                                        val;
                                                                    qun = GlobalVar
                                                                            .qunI
                                                                        as int;
                                                                  });
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color: Colors
                                                                .grey.shade700,
                                                          ),
                                                          Text(
                                                            "This Price is tax exclusive",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .grey
                                                                    .shade400),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "GST",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "   Cess",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            height: 45,
                                                            width: 140,
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  GlobalVar
                                                                      .iGST,
                                                              validator: (val) {
                                                                if (val ==
                                                                        null ||
                                                                    val.isEmpty) {
                                                                  return "please enter this";
                                                                }
                                                                return null;
                                                              },
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  GlobalVar
                                                                          .gstI =
                                                                      val;
                                                                  gst = GlobalVar
                                                                          .gstI
                                                                      as int;
                                                                });
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      hintText:
                                                                          "Tax %"),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 45,
                                                            width: 140,
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  GlobalVar
                                                                      .iCess,
                                                              validator: (val) {
                                                                if (val ==
                                                                        null ||
                                                                    val.isEmpty) {
                                                                  return "please enter this";
                                                                }
                                                                return null;
                                                              },
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  GlobalVar
                                                                          .cessI =
                                                                      val;
                                                                  cess = GlobalVar
                                                                          .cessI
                                                                      as int;
                                                                });
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(),
                                                                hintText:
                                                                    "Tax %",
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      InkWell(
                                                        onTap: () {
                                                          if (GlobalVar
                                                              .itemDetail
                                                              .currentState!
                                                              .validate()) {
                                                            GlobalVar.itemDetail
                                                                .currentState!
                                                                .save();
                                                          }
                                                          setState(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.indigo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                            "Done",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF0F1F3),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add_circle,
                                        color: Colors.indigo,
                                      ),
                                      Text(
                                        "  Add Item Details",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Notes",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: GlobalVar.notes,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "please enter this";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    GlobalVar.note = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        "It was great doing business with you."),
                                maxLines: 3,
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: GlobalVar.condition,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "please enter this";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    GlobalVar.condi = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        "Please make the payment by the due date."),
                                maxLines: 3,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        GlobalVar.page1.currentState!.reset();
                                        GlobalVar.invoiceDt.clear();
                                        GlobalVar.dueDate.clear();
                                        GlobalVar.inNumber.clear();
                                        GlobalVar.currency.clear();
                                        GlobalVar.notes.clear();
                                        GlobalVar.condition.clear();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Clear",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (GlobalVar.page1.currentState!
                                          .validate()) {
                                        GlobalVar.page1.currentState!.save();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 80,
            width: w,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1))),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  GlobalVar.cGst = (int.parse(GlobalVar.gstI) * 0.5);
                  GlobalVar.sGst = (int.parse(GlobalVar.gstI) * 0.5);
                  GlobalVar.totalPrice =
                      (int.parse(GlobalVar.priceI) * int.parse(GlobalVar.qunI));
                  GlobalVar.totalGst = (GlobalVar.totalPrice *
                      (int.parse(GlobalVar.gstI) * 0.005));
                  GlobalVar.totalCess = (GlobalVar.totalPrice *
                      (int.parse(GlobalVar.cessI) * 0.01));
                  GlobalVar.totalBill = GlobalVar.totalPrice +
                      GlobalVar.totalGst +
                      GlobalVar.totalGst +
                      GlobalVar.totalCess;
                  Navigator.pushNamed(context, 'pdf');
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                  height: 50,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Generate Invoice",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
