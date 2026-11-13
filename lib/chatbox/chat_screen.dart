import 'package:flutter/material.dart';

class ChatHelpScreen extends StatelessWidget {
  const ChatHelpScreen({super.key});

  static const Color primaryGreen = Color(0xFF84CC16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),

      body: SafeArea(
        child: Column(
          children: [

            // =====================================================
            // TOP BAR
            // =====================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF111C2C),
                      size: 24,
                    ),
                  ),

                  const Expanded(
                    child: Text(
                      "Need Assistance?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF111C2C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),
                ],
              ),
            ),

            const SizedBox(height: 13),

            // =====================================================
            // CONTENT
            // =====================================================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  10,
                  16,
                  24,
                ),
                child: Column(
                  children: [

                    const Text(
                      "We are here to help with your solar journey.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF424938),
                        fontSize: 12,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =================================================
                    // GREEN ACTION BOX
                    // =================================================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [

                          // =========================================
                          // CHAT ON WHATSAPP
                          // =========================================
                          InkWell(
                            onTap: () {
                              // WhatsApp action
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [

                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF25D366)
                                          .withOpacity(0.10),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.chat,
                                      color: Color(0xFF25D366),
                                      size: 26,
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  const Expanded(
                                    child: Text(
                                      "Chat on WhatsApp",
                                      style: TextStyle(
                                        color: Color(0xFF111C2C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF737A66),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          // =========================================
                          // REQUEST CALLBACK
                          // =========================================
                          InkWell(
                            onTap: () {
                              // Request callback action
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [

                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: primaryGreen.withOpacity(0.10),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.phone_callback,
                                      color: Color(0xFF416900),
                                      size: 26,
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  const Expanded(
                                    child: Text(
                                      "Request Call Back",
                                      style: TextStyle(

                                        color: Color(0xFF111C2C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF737A66),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // =================================================
                    // CANCEL
                    // =================================================
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF4E5F7E),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            color: Color(0xFF4E5F7E),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}