import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const Color primaryBlue = Color(0xFF1E3A5F);
  static const Color primaryGreen = Color(0xFF84CC16);
  static const Color secondaryText = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FCF8),

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(.92),
        title: const Text(
          "Profile & Settings",
          style: TextStyle(
            color: primaryBlue,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1.3,
                colors: [
                  Color(0xFFE6F4EA),
                  Color(0xFFF8FCF8),
                ],
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
            child: Column(
              children: [
                // ================= PROFILE =================
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryBlue,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dev",
                            style: TextStyle(
                              color: primaryBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "+91 9336149127",
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: primaryGreen,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // ================= MENU =================
                _menuCard(
                  context,
                  icon: Icons.grid_view_rounded,
                  title: "My Projects",
                  subtitle: "View all your projects",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.calculate_outlined,
                  title: "Savings Calculator",
                  subtitle: "Calculate your savings",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.assignment_turned_in_outlined,
                  title: "Request Quote",
                  subtitle: "Get your instant quote",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.receipt_long_outlined,
                  title: "Invoices & Payment History",
                  subtitle: "Manage your invoices",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.description_outlined,
                  title: "Documents",
                  subtitle: "View your project documents",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.bolt_outlined,
                  title: "Energy Reports",
                  subtitle: "View your energy reports",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  subtitle: "Get help and feedback",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.star_border_rounded,
                  title: "Rate Us",
                  subtitle: "Spread the love ❤️",
                  onTap: () {},
                ),

                _menuCard(
                  context,
                  icon: Icons.logout,
                  title: "Logout",
                  subtitle: "Sign out from the app",
                  onTap: () {},
                ),

                const SizedBox(height: 8),

                // ================= REFER & EARN =================
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF5E5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refer & Earn",
                              style: TextStyle(
                                color: primaryBlue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "₹7,500/- reward for successful",
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.campaign_outlined,
                        color: primaryGreen,
                        size: 55,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ================= CHAT BUTTON =================
          Positioned(
            right: 16,
            bottom: 25,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF8CC63F),
              elevation: 6,
              onPressed: () {},
              child: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MENU CARD
  // ============================================================

  Widget _menuCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade100,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: primaryGreen,
                size: 20,
              ),
            ),

            const SizedBox(width: 14),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: primaryBlue,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: secondaryText,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}