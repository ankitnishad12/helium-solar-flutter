import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() =>
      _SelectLanguageScreenState();
}

class _SelectLanguageScreenState
    extends State<SelectLanguageScreen> {
  String selectedLanguage = "English";

  static const Color primaryBlue = Color(0xFF1C3A5B);
  static const Color primaryGreen = Color(0xFF9CCB5F);
  static const Color lightGreen = Color(0xFFEAF4DF);

  final List<Map<String, String>> languages = [
    {
      "name": "English",
      "letter": "E",
    },
    {
      "name": "हिन्दी",
      "letter": "ह",
    },
    {
      "name": "తెలుగు",
      "letter": "తె",
    },
    {
      "name": "मराठी",
      "letter": "म",
    },
    {
      "name": "മലയാളം",
      "letter": "മ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F5),

      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: _buildBottomNavigation(),

      body: SafeArea(
        child: Center(
          child: Container(
            width :280,
            height: 600,
            margin: const EdgeInsets.fromLTRB(
              1,
              0,
              1,
              0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),

            child: Column(
              children: [
                // =========================
                // TOP AREA
                // =========================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      8,
                      20,
                      10,
                    ),
                    child: Column(
                      children: [
                        // CLOSE BUTTON
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 2),

                        // =========================
                        // TITLE
                        // =========================
                        const Text(
                          "  Select Language",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 16,
                            height: 1.15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // =========================
                        // LANGUAGE LIST
                        // =========================
                        Column(
                          children: languages.map((language) {
                            final bool selected =
                                selectedLanguage ==
                                    language["name"];

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedLanguage =
                                  language["name"]!;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.only(
                                  bottom: 11,
                                ),
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 11,
                                ),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? lightGreen
                                      : Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  border: Border.all(
                                    color: selected
                                        ? lightGreen
                                        : const Color(
                                      0xFFE5E7EB,
                                    ),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // LETTER BOX
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: primaryGreen,
                                        borderRadius:
                                        BorderRadius.circular(
                                          8,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 3,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          language["letter"]!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    // LANGUAGE NAME
                                    Expanded(
                                      child: Text(
                                        language["name"]!,
                                        style: const TextStyle(
                                          color: primaryBlue,
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ),

                                    // CHECK
                                    if (selected)
                                      const Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF7BA93E),
                                        size: 15,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _buildBottomNavigation() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFFD2DCE6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          _bottomItem(
            icon: Icons.home,
            title: "Home",
            selected: true,
          ),

          _bottomItem(
            icon: Icons.assignment,
            title: "My Projects",
            selected: false,
          ),

          _bottomItem(
            icon: Icons.headset_mic,
            title: "Help",
            selected: false,
          ),

          _bottomItem(
            icon: Icons.person_outline,
            title: "Account",
            selected: false,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM NAV ITEM
  // ============================================================

  Widget _bottomItem({
    required IconData icon,
    required String title,
    required bool selected,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: selected
                ? const Color(0xFF7BA93E)
                : primaryBlue.withOpacity(0.75),
          ),

          const SizedBox(height: 2),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected
                  ? const Color(0xFF7BA93E)
                  : primaryBlue.withOpacity(0.75),
              fontSize: 9,
              height: 1.1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}