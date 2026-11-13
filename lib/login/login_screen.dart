import 'package:flutter/material.dart';
import '../register/Registration_Screen.dart';
import '../home_dashbroad/home_screen.dart' as dashboard;
import 'package:helium_solar/resendotp/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController =
  TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // ============================================================
  // LOGIN
  // ============================================================
  void _login() {
    final phone = _phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your phone number"),
        ),
      );
      return;
    }

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid 10 digit phone number"),
        ),
      );
      return;
    }

// Login Screen → OTP Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OtpScreen(),
      ),
    );
  }

  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery
            .of(context)
            .size
            .height;

    return Scaffold(
      backgroundColor: const Color(0xFF00253F),

      body: SafeArea(
        child: Column(
          children: [

            // ======================================================
            // HEADER
            // ======================================================

            SizedBox(
              height: screenHeight * 0.35,

              child: Stack(
                children: [

                  Positioned(
                    right: -70,
                    top: -70,

                    child: Opacity(
                      opacity: 0.10,

                      child: Container(
                        width: 300,
                        height: 300,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: Colors.white,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                      24,
                      45,
                      24,
                      24,
                    ),

                    child: Align(
                      alignment: Alignment.centerLeft,

                      child: Text(
                        "Login",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          height: 1.25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ======================================================
            // WHITE CARD
            // ======================================================

            Expanded(
              child: Container(
                width: double.infinity,

                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(0, -4),
                      blurRadius: 24,
                    ),
                  ],
                ),

                child: SingleChildScrollView(
                  physics:
                  const BouncingScrollPhysics(),

                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      32,
                      24,
                      48,
                    ),

                    child: Center(
                      child: ConstrainedBox(
                        constraints:
                        const BoxConstraints(
                          maxWidth: 480,
                        ),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.stretch,

                          children: [

                            const SizedBox(
                              height: 4,
                            ),

                            // =================================================
                            // PHONE LABEL
                            // =================================================

                            const Text(
                              "Enter your phone number",

                              style: TextStyle(
                                color:
                                Color(0xFF083B5E),

                                fontSize: 12,

                                height: 1.5,

                                fontWeight:
                                FontWeight.w500,
                              ),
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            // =================================================
                            // PHONE ROW
                            // =================================================

                            Row(
                              children: [

                                // COUNTRY CODE

                                Container(
                                  height: 30,

                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal: 8,
                                  ),

                                  decoration:
                                  BoxDecoration(
                                    color:
                                    const Color(
                                      0xFFF2F4F5,
                                    ),

                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      8,
                                    ),
                                  ),

                                  child: const Row(
                                    mainAxisSize:
                                    MainAxisSize.min,

                                    children: [

                                      Text(
                                        "🇮🇳",

                                        style:
                                        TextStyle(
                                          fontSize: 8,
                                        ),
                                      ),

                                      SizedBox(
                                        width: 5,
                                      ),

                                      Text(
                                        "+91",

                                        style:
                                        TextStyle(
                                          color:
                                          Color(
                                            0xFF42474E,
                                          ),

                                          fontSize: 10,

                                          fontWeight:
                                          FontWeight
                                              .w600,
                                        ),
                                      ),

                                      SizedBox(
                                        width: 2,
                                      ),

                                      Icon(
                                        Icons
                                            .keyboard_arrow_down,

                                        color:
                                        Color(
                                          0xFF72777F,
                                        ),

                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                // PHONE FIELD

                                Expanded(
                                  child: SizedBox(
                                    height: 40,

                                    child: TextField(
                                      controller:
                                      _phoneController,

                                      keyboardType:
                                      TextInputType
                                          .phone,

                                      maxLength: 10,

                                      style:
                                      const TextStyle(
                                        color:
                                        Color(
                                          0xFF191C1D,
                                        ),

                                        fontSize: 13,

                                        fontWeight:
                                        FontWeight.w500,
                                      ),

                                      decoration:
                                      InputDecoration(
                                        counterText: "",

                                        hintText:
                                        "XXXXXXXXXX",

                                        hintStyle:
                                        const TextStyle(
                                          color:
                                          Color(
                                            0xFF72777F,
                                          ),

                                          fontSize: 12,
                                        ),

                                        filled: true,

                                        fillColor:
                                        const Color(
                                          0xFFF2F4F5,
                                        ),

                                        contentPadding:
                                        const EdgeInsets
                                            .symmetric(
                                          horizontal: 18,
                                          vertical: 13,
                                        ),

                                        border:
                                        OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                            8,
                                          ),

                                          borderSide:
                                          BorderSide.none,
                                        ),

                                        enabledBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                            8,
                                          ),

                                          borderSide:
                                          BorderSide.none,
                                        ),

                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                            8,
                                          ),

                                          borderSide:
                                          const BorderSide(
                                            color:
                                            Color(
                                              0xFFBFCD89,
                                            ),

                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // =================================================
                            // LOGIN BUTTON
                            // =================================================

                            const SizedBox(
                              height: 24,
                            ),

                            SizedBox(
                              height: 45,
                              width: double.infinity,

                              child: ElevatedButton(
                                onPressed: _login,

                                style:
                                ElevatedButton
                                    .styleFrom(
                                  backgroundColor:
                                  const Color(
                                    0xFFDBEAA2,
                                  ),

                                  foregroundColor:
                                  const Color(
                                    0xFF5D6A30,
                                  ),

                                  elevation: 0,

                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      20,
                                    ),
                                  ),
                                ),

                                child: const Text(
                                  "Login",

                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.1,
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            // =================================================
                            // CREATE ACCOUNT
                            // =================================================

                            const SizedBox(
                              height: 24,
                            ),

                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const RegistrationScreen(),
                                    ),
                                  );
                                },

                                child: const Text(
                                  "Create New Account",

                                  textAlign:
                                  TextAlign.center,

                                  style: TextStyle(
                                    color:
                                    Color(
                                      0xFF083B5E,
                                    ),

                                    fontSize: 12,

                                    height: 1.3,

                                    fontWeight:
                                    FontWeight.w600,

                                    decoration:
                                    TextDecoration
                                        .underline,

                                    decorationThickness:
                                    2,

                                    decorationColor:
                                    Color(
                                      0xFF083B5E,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
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
