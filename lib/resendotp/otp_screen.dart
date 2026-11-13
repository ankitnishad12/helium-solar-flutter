import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../home_dashbroad/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpScreen(),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static const Color primaryBlue = Color(0xFF113D5E);
  static const Color textBlue = Color(0xFF285473);
  static const Color green = Color(0xFFD1E49B);
  static const Color darkGreen = Color(0xFF91B83A);

  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());

  final List<FocusNode> otpFocusNodes =
  List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final node in otpFocusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  // ============================================================
  // OTP INPUT
  // ============================================================

  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      otpFocusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  // ============================================================
  // CONFIRM OTP
  // ============================================================
  void confirmOtp() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeDashboard(),
      ),
          (route) => false,
    );
  }

  // ============================================================
  // EDIT PHONE
  // ============================================================

  void editPhone() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Edit phone number"),
      ),
    );
  }

  // ============================================================
  // RESEND OTP
  // ============================================================

  void resendOtp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP resent"),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final bool smallScreen = size.height < 700;
    final bool smallWidth = size.width < 350;

    final double horizontalPadding = smallWidth ? 26 : 36;

    final double titleSize = smallWidth ? 28 : 32;

    return Scaffold(
      backgroundColor: primaryBlue,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Column(
          children: [

            // ======================================================
            // BLUE HEADER
            // ======================================================

            SizedBox(
              height: smallScreen ? 145 : 175,
              width: double.infinity,

              child: Padding(
                padding: EdgeInsets.only(
                  left: 26,
                  top: smallScreen ? 32 : 42,
                ),

                child: Text(
                  "Login",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // ======================================================
            // WHITE OTP CONTAINER
            // ======================================================

            Expanded(
              child: Container(
                width: double.infinity,

                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    smallScreen ? 55 : 75,
                    horizontalPadding,
                    20,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                      // ==================================================
                      // OTP MESSAGE
                      // ==================================================

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Expanded(
                            child: Text(
                              "Enter the OTP sent to +91\n",

                              style: TextStyle(
                                color: textBlue,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.25,
                              ),
                            ),
                          ),

                          const SizedBox(width: 5),

                          GestureDetector(
                            onTap: editPhone,

                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 13,
                              ),

                              child: Text(
                                "Edit",

                                style: TextStyle(
                                  color: darkGreen,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: smallScreen ? 15 : 30,
                      ),

                      // ==================================================
                      // OTP BOXES
                      // ==================================================

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: List.generate(
                          6,
                              (index) {
                            return SizedBox(
                              width: smallWidth ? 40 : 50,
                              height: smallScreen ? 70 : 78,

                              child: TextField(
                                controller:
                                otpControllers[index],

                                focusNode:
                                otpFocusNodes[index],

                                keyboardType:
                                TextInputType.number,

                                textAlign: TextAlign.center,

                                maxLength: 1,

                                onChanged: (value) {
                                  onOtpChanged(
                                    value,
                                    index,
                                  );
                                },

                                style: TextStyle(
                                  color: textBlue,
                                  fontSize:
                                  smallWidth ? 20 : 27,
                                  fontWeight:
                                  FontWeight.w500,
                                ),

                                decoration:
                                InputDecoration(
                                  counterText: "",

                                  contentPadding:
                                  EdgeInsets.zero,

                                  border:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                      15,
                                    ),

                                    borderSide:
                                    const BorderSide(
                                      color:
                                      Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),

                                  enabledBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                      15,
                                    ),

                                    borderSide:
                                    const BorderSide(
                                      color:
                                      Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),

                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                      15,
                                    ),

                                    borderSide:
                                    const BorderSide(
                                      color: textBlue,
                                      width: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // ==================================================
                      // CONFIRM BUTTON
                      // ==================================================

                      SizedBox(
                        height: smallScreen ? 55 : 60,
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: confirmOtp,

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor: green,

                            foregroundColor:
                            Colors.white,

                            elevation: 0,

                            padding: EdgeInsets.zero,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),

                          child: const Text(
                            "Confirm",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      // ==================================================
                      // RESEND OTP
                      // ==================================================

                      SizedBox(
                        height: smallScreen ? 35 : 38,
                      ),

                      GestureDetector(
                        onTap: resendOtp,

                        child: const Center(
                          child: Text(
                            "Resend OTP",

                            style: TextStyle(
                              color: textBlue,
                              fontSize: 15,
                              fontWeight:
                              FontWeight.w600,

                              decoration:
                              TextDecoration
                                  .underline,

                              decorationThickness: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}