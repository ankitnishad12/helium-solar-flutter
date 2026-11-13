import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title:const Text("Help  Support"),
        titleTextStyle: TextStyle(
          fontSize: 15,
        ),


        backgroundColor: const Color(0xFF083B66),
        foregroundColor: Colors.white,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7FBF8),
              Color(0xFFE6F4EA),
            ],
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How can we help you?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF083B66),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Find answers to common questions or contact our support team.",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 12),

              _helpItem(
                Icons.help_outline,
                "Frequently Asked Questions",
                "Find answers to common questions.",
              ),

              _helpItem(
                Icons.support_agent,
                "Contact Support",
                "Get help from our support team.",
              ),

              _helpItem(
                Icons.info_outline,
                "About the App",
                "Learn more about this application.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _helpItem(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF083B66),
            size: 25,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}