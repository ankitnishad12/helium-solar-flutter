import 'package:flutter/material.dart';
import '../resendotp/otp_screen.dart';
import '../login/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState
    extends State<RegistrationScreen> {

  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController mobileController =
  TextEditingController();

  final TextEditingController firstNameController =
  TextEditingController();

  final TextEditingController lastNameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  // ============================================================
  // COLORS
  // ============================================================

  static const Color blue = Color(0xFF113D5E);
  static const Color textBlue = Color(0xFF285473);
  static const Color lightGrey = Color(0xFFF4F5F7);
  static const Color buttonGreen = Color(0xFFCBE29F);

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    mobileController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  // ============================================================
  // CREATE ACCOUNT
  // ============================================================

  void createAccount() {

    // No validation.
    // User can open OTP screen without entering any details.

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OtpScreen(),
      ),
    );
  }

  // ============================================================
  // BACK TO LOGIN
  // ============================================================

  void goToLogin() {
    Navigator.pop(context);
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {

    final screenWidth =
        MediaQuery.of(context).size.width;

    final screenHeight =
        MediaQuery.of(context).size.height;

    final bool smallScreen =
        screenHeight < 700;

    final bool smallWidth =
        screenWidth < 340;

    final double horizontalPadding =
    smallWidth ? 20 : 26;

    final double fieldHeight =
    smallScreen ? 42 : 46;

    final double inputFontSize =
    smallWidth ? 14 : 16;

    return Scaffold(
      backgroundColor: blue,

      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Column(
          children: [

            // ======================================================
            // HEADER
            // ======================================================

            SizedBox(
              height:
              smallScreen ? 110 : 125,

              width: double.infinity,

              child: Padding(
                padding:
                EdgeInsets.symmetric(
                  horizontal:
                  horizontalPadding,
                ),

                child: Row(
                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),

                    const Expanded(
                      child: Text(
                        'Create New Account',

                        textAlign:
                        TextAlign.center,

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 48,
                    ),
                  ],
                ),
              ),
            ),

            // ======================================================
            // WHITE FORM
            // ======================================================

            Expanded(
              child: Container(
                width: double.infinity,

                decoration:
                const BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.only(
                    topLeft:
                    Radius.circular(28),

                    topRight:
                    Radius.circular(28),
                  ),
                ),

                child:
                SingleChildScrollView(
                  padding:
                  EdgeInsets.fromLTRB(
                    horizontalPadding,

                    smallScreen
                        ? 20
                        : 28,

                    horizontalPadding,

                    30,
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.stretch,

                    children: [

                      // ==================================================
                      // MOBILE NUMBER
                      // ==================================================

                      const Text(
                        'Mobile Number*',

                        style: TextStyle(
                          color: textBlue,
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),

                      const SizedBox(
                        height: 6,
                      ),

                      Row(
                        children: [

                          // COUNTRY CODE

                          Container(
                            height:
                            fieldHeight,

                            padding:
                            const EdgeInsets
                                .symmetric(
                              horizontal: 10,
                            ),

                            decoration:
                            BoxDecoration(
                              color:
                              lightGrey,

                              borderRadius:
                              BorderRadius
                                  .circular(
                                9,
                              ),
                            ),

                            child:
                            const Row(
                              children: [

                                Text(
                                  '🇮🇳',

                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                  ),
                                ),

                                SizedBox(
                                  width: 5,
                                ),

                                Text(
                                  '+91',

                                  style:
                                  TextStyle(
                                    color:
                                    textBlue,
                                    fontSize:
                                    14,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            width: 8,
                          ),

                          // MOBILE INPUT

                          Expanded(
                            child:
                            SizedBox(
                              height:
                              fieldHeight,

                              child:
                              TextField(
                                controller:
                                mobileController,

                                keyboardType:
                                TextInputType
                                    .phone,

                                maxLength: 10,

                                style:
                                TextStyle(
                                  color:
                                  Colors
                                      .black87,
                                  fontSize:
                                  inputFontSize,
                                ),

                                decoration:
                                InputDecoration(
                                  counterText:
                                  '',

                                  hintText:
                                  'XXXXXXXXXX',

                                  hintStyle:
                                  TextStyle(
                                    color:
                                    Colors
                                        .grey,
                                    fontSize:
                                    inputFontSize,
                                  ),

                                  filled: true,

                                  fillColor:
                                  lightGrey,

                                  contentPadding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal:
                                    12,
                                  ),

                                  border:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      9,
                                    ),

                                    borderSide:
                                    BorderSide
                                        .none,
                                  ),

                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      9,
                                    ),

                                    borderSide:
                                    const BorderSide(
                                      color:
                                      textBlue,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height:
                        smallScreen
                            ? 10
                            : 14,
                      ),

                      // ==================================================
                      // FIRST NAME
                      // ==================================================

                      const Text(
                        'First Name*',

                        style: TextStyle(
                          color: textBlue,
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      buildTextField(
                        controller:
                        firstNameController,
                        hint:
                        'Enter your first name',
                        height:
                        fieldHeight,
                        fontSize:
                        inputFontSize,
                        keyboardType:
                        TextInputType.name,
                      ),

                      SizedBox(
                        height:
                        smallScreen
                            ? 10
                            : 14,
                      ),

                      // ==================================================
                      // LAST NAME
                      // ==================================================

                      const Text(
                        'Last Name*',

                        style: TextStyle(
                          color: textBlue,
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      buildTextField(
                        controller:
                        lastNameController,
                        hint:
                        'Enter your last name',
                        height:
                        fieldHeight,
                        fontSize:
                        inputFontSize,
                        keyboardType:
                        TextInputType.name,
                      ),

                      SizedBox(
                        height:
                        smallScreen
                            ? 10
                            : 14,
                      ),

                      // ==================================================
                      // EMAIL
                      // ==================================================

                      const Text(
                        'Email*',

                        style: TextStyle(
                          color: textBlue,
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      buildTextField(
                        controller:
                        emailController,
                        hint:
                        'Enter your email',
                        height:
                        fieldHeight,
                        fontSize:
                        inputFontSize,
                        keyboardType:
                        TextInputType
                            .emailAddress,
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // ==================================================
                      // CREATE ACCOUNT BUTTON
                      // ==================================================

                      SizedBox(
                        height:
                        smallScreen
                            ? 35
                            : 45,

                        width:
                        double.infinity,

                        child:
                        ElevatedButton(
                          onPressed:
                          createAccount,

                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            buttonGreen,

                            foregroundColor:
                            Colors.white,

                            elevation: 0,

                            padding:
                            EdgeInsets.zero,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                25,
                              ),
                            ),
                          ),

                          child:
                          FittedBox(
                            fit:
                            BoxFit.scaleDown,

                            child:
                            Text(
                              'Create New Account',

                              style:
                              TextStyle(
                                fontSize:
                                smallWidth
                                    ? 16
                                    : 18,

                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // LOGIN
                      // ==================================================

                      GestureDetector(
                        onTap:
                        goToLogin,

                        child:
                        Center(
                          child:
                          FittedBox(
                            fit:
                            BoxFit.scaleDown,

                            child:
                            Text(
                              'Already have an account?',

                              style:
                              TextStyle(
                                color:
                                textBlue,

                                fontSize:
                                smallWidth
                                    ? 11
                                    : 14,

                                fontWeight:
                                FontWeight
                                    .w600,

                                decoration:
                                TextDecoration
                                    .underline,
                              ),
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

  // ============================================================
  // TEXT FIELD
  // ============================================================

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required double height,
    required double fontSize,
    required TextInputType keyboardType,
  }) {

    return SizedBox(
      height: height,

      child: TextField(
        controller: controller,

        keyboardType:
        keyboardType,

        style: TextStyle(
          color: Colors.black87,
          fontSize: fontSize,
        ),

        decoration:
        InputDecoration(
          hintText: hint,

          hintStyle:
          TextStyle(
            color: Colors.grey,
            fontSize: fontSize,
          ),

          contentPadding:
          const EdgeInsets
              .symmetric(
            horizontal: 12,
            vertical: 4,
          ),

          border:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(5),

            borderSide:
            const BorderSide(
              color:
              Color(0xFFD0D0D0),
            ),
          ),

          enabledBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(5),

            borderSide:
            const BorderSide(
              color:
              Color(0xFFD0D0D0),
            ),
          ),

          focusedBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(5),

            borderSide:
            const BorderSide(
              color: textBlue,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}