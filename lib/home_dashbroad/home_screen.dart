import 'package:flutter/material.dart';
import'package:helium_solar/myprojects/my_project_screen.dart';
import 'package:helium_solar/myhelp/help_screen.dart';
import 'package:helium_solar/account/account_screen.dart';
import 'package:helium_solar/language/select_language.dart';
import 'package:helium_solar/chatbox/chat_screen.dart';
class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _selectedIndex = 0;

  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color primaryGreen = Color(0xFF84CC16);
  static const Color textMuted = Color(0xFF64748B);

  final List<String> faqList = [
    "What are the benefits of installing solar panels on my home?",
    "What are the applications of solar power?",
    "Can I get an App to monitor my Solar System?",
    "How much do solar panels cost for a business?",
    "How much does a 1kW solar panel cost?",
    "Who offers an affordable solar panel subsidy?",
  ];

  final List<bool> faqExpanded = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // ================= HERO =================
                SliverToBoxAdapter(
                  child: _buildHeroSection(),
                ),

                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // ================= WHY CHOOSE US =================
                      _buildWhyChooseUs(),

                      const SizedBox(height: 30),

                      // ================= KNOW MORE =================
                      _buildSolarSection(),

                      const SizedBox(height: 30),

                      // ================= LOAN BANNER =================
                      _buildLoanBanner(),

                      const SizedBox(height: 30),

                      // ================= TESTIMONIALS =================
                      _buildTestimonials(),

                      const SizedBox(height: 30),

                      // ================= FAQ =================
                      _buildFAQ(),

                      const SizedBox(height: 30),

                      // ================= REFER & EARN =================
                      _buildReferEarn(),
                    ]),
                  ),
                ),
              ],
            ),

            // ================= FLOATING CHAT =================
            Positioned(
              right: 18,
              bottom: 90,
              child: _buildChatButton(context),
            ),
          ],
        ),
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ============================================================
  // HERO SECTION
  // ============================================================

  Widget _buildHeroSection() {
    return Container(
      height: 260,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF103058),
            Color(0xFF6084A4),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [

          // Background solar image
          Positioned.fill(
            child: Opacity(
              opacity: 0.35,
              child: Image.network(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuArONbsGhINN6KDO_Qerok9YNAFBTHz2wPnu816Be7tfOsybB0c5NoxW0_tnAz8Ic6dxUTX52Pz7UsZKQR0TrFBwJwXqHG1mylSYqYSMbZTvEsRvm_LrnnYueCh7UBB8gubT6Z-7nxtZ9F7NgQNGaxvYKOL2LKKgPdKDbD8_A3roM58RZwtzAeKOVjJgg8TIt9IlVJeDkGgQkXo7x-AF3vxyOzA7RWRrBiQ96AYT71xgUGx8xDbGj79",
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (_, __, ___) {
                  return const SizedBox();
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome to helium Solar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "vijay",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 10),
                    // LANGUAGE BUTTON
                    // LANGUAGE BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectLanguageScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: primaryGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.translate,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),


                 SizedBox(height: 15,),
                // MAIN TEXT
                const Text(
                  "Checkout how much you can save\nwith Solar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    height: 1.25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                // BUTTONS
                SizedBox(height: 48),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _heroButton(
                        icon: Icons.calculate_outlined,
                        text: "Savings Calculator",
                      ),

                      const SizedBox(width: 8),

                      _heroButton(
                        icon: Icons.calendar_month_outlined,
                        text: "Request Quote",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroButton({
    required IconData icon,
    required String text,
  }) {
    return Container(
      height: 40,
      width: 150, // 👈 dono buttons same width
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 17,
          ),

          const SizedBox(width: 5),

          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  // ============================================================
  // WHY CHOOSE US
  // ============================================================

  Widget _buildWhyChooseUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Why Choose Us?",
          style: TextStyle(
            color: primaryBlue,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.10),
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              _benefit(
                Icons.workspace_premium_outlined,
                "10+ Yrs",
                "Experience",
                const Color(0xFFFFF5D9),
                Colors.orange,
              ),
              _benefit(
                Icons.currency_rupee,
                "Zero-Cost",
                "EMI",
                const Color(0xFFE3F2FF),
                Colors.blue,
              ),
              _benefit(
                Icons.update,
                "24/7",
                "Support",
                const Color(0xFFE1F8F1),
                Colors.teal,
              ),
              _benefit(
                Icons.verified_user_outlined,
                "10,000+",
                "Installations",
                const Color(0xFFF0F7DE),
                primaryGreen,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _benefit(
      IconData icon,
      String title,
      String subtitle,
      Color bg,
      Color iconColor,
      ) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: primaryBlue,
              fontSize: 5,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: primaryBlue,
              fontSize: 7,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SOLAR SECTION
  // ============================================================

  Widget _buildSolarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Know More About Solar",
              style: TextStyle(
                color: primaryBlue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: primaryGreen,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _solarCard(
                image:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuA3nG3cSI8gHXjXsL-V1SNFQP_T1UDVs6CJZeo94lvUv3XhR-rzRLvqRJf7h8OuELIS6IYiYC-4Ve2H4Ac1WQ433gmHnA4YOImN5pOOIIDfix1tQYwXhosC96mUcR3fb_d_BNIwTWhFeFT1Nabcu89FkIRbovki6rJcrDPDhKWmZmbpqurpm8GsZYdVH-NEmbUePWUR0KF9jnvUa3TimR4u5NrEGKN1UwrxgXhiKqyTDC6oFmThGzLU",
                title: "Why Is India Promoting Solar Roof...",

              ),

              const SizedBox(width: 6),

              _solarCard(
                image:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuAx9xNDzKuEF07Duh4OYWvaTrSTBQ8rSKoncnpP_CB5qDCGVCMnxoryKMGeR3PLq7yGX1OoVohV7RQEvKT5xp3ho1uN9WNtLxZUWp7o5CHyOMZn-yOeocfG13f9smiuiOvSVCbWKDh32ECcz2MKsHkjv4zP3BmlVeGcfABU3E6YXZFgds1B461WoGANTkX7Fqh0i-HzF7Lwp2v6a2nNAli13D0YPhGHzON4Y1nuTZzyKAwJ3TyRdsFQ",
                title: "How To Create Perfect Solar...",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _solarCard({
    required String image,
    required String title,
  }) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 6,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130
            ,
            width: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.image,
                    size: 50,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: primaryBlue,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SOLAR LOAN
  // ============================================================

  Widget _buildLoanBanner() {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF102B4E),
            Color(0xFF1C4B78),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Solar Loans That\nWork For You",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  children: const [
                    Text(
                      "Learn More",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 7),
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Color(0xFF59B59A),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Icon(
            Icons.account_balance_wallet_outlined,
            color: Colors.white,
            size: 75,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TESTIMONIALS
  // ============================================================
  Widget _buildTestimonials() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Testimonials",
              style: TextStyle(
                color: primaryBlue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: primaryGreen,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        _testimonialCard(
          name: "Gajendra Shkya",
          location: "Indore, Madhya Pradesh",
          text:
          "It's been 1 year since Freyr Energy installed system on my home. We have not faced any issues and are very happy with their service. Highly recommend Freyr Energy.",

          image:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBlXKVpQXYurKJPzLpysq-T8Hhc31gGnapXorLuWcJOuLQIdmH84StRqPkpwjq9cIoySGlhN65xjwD3Bs5KByeWIsg8tOceF4DRmChkFguE77ntapRKOLBu7mFFubkhijuV_8qnvUSaR9dn6JEVl2Fzjr2LJBSiJ1On-MLKRyYlyH_LW4K2Yln7GmShjIQPst0qEmyo1FgpYeCMB_eWBrZydZez5xbtzCBvKC40W6o6b3ex0XsxO0gh",
        ),

        const SizedBox(height: 8),

        _testimonialCard(
          name: "Uttam Malani",
          location: "Hyderabad, Telangana",
          text:
          "We have installed solar in 4 of our facilities with Freyr Energy and our energy costs has reduced substantially. Our consumers are already appreciating our efforts.",
          image:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCDD8r6pSWjesGwnd-xRRaSGRPS9GTE3XqxuWc5D0qSQ06vsqGs1EPSKw-V7fRYwMQTP1FBE6jyjcCCbdFSRARpBiAtRtetssmAqwHn7FkFgvQeLB2NQylxBc3CBZi7-IBhTNysOFiQ6CvfIqHCNCNZoJ23XTvk6gzZjPnrnMbAXXyeGbqMtcI749-qRmaiwcosyLrFxhBMfkw5Klh5NiBwBXjfyeci8_DbG5aysq25UehEDFs2czWN",
        ),

        const SizedBox(height: 8),

        _testimonialCard(
          name: "Mahesh Mishra",
          location: "Jabalpur, Madhya Pradesh",
          text:
          "Freyr Energy installed 3kW system on my house in Hyderabad. I used to pay ₹ 2,500-3,000 before solar in electricity bills and last month I paid only ₹ 300! Their after-sales is also very quick & reliable.",
          image:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuANG9jNpjla5Hts4pVJst37DbAIdELDLm8YIFo9OVUKrUiEyuXiTZL8mXF8CXhzvU96JGIU0bLgbTwfFE9fWKmkjP_07smh2RKNFGCNPwBRy-ZIIp09A0CPq5rZAhi8x-p5E_Hi0nLUK0sc2MFFh2CA61nSRWBL8-xPyQ2Ec4x-BKdRZ4w4nh9_mVkQPH4Tu4wB_O4FsmfOxo3rI4nTjUWIlrAK18kpuvLxmtkS_Mjk5YvakFLPE0Yg",
        ),
      ],
    );
  }

  Widget _testimonialCard({
    required String name,
    required String location,
    required String text,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  image,
                  width: 58,
                  height: 58,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 58,
                      height: 58,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.person),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: primaryGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Color(0xFF7890A5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.share_outlined,
                color: Colors.black87,
                size: 18,
              ),
            ],

          ),

          const SizedBox(height: 15),

          Text(
            '"$text"',
            style: const TextStyle(
              color: Color(0xFF7890A5),
              fontSize: 10,
              height: 1.3,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 12),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 21,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Watch",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FAQ
  // ============================================================

  Widget _buildFAQ() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "FAQ's",
              style: TextStyle(
                color: primaryBlue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: primaryGreen,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        ...List.generate(
          faqList.length,
              (index) {
            return _faqItem(
              index,
              faqList[index],
            );
          },
        ),
      ],
    );
  }

  Widget _faqItem(int index, String question) {
    return GestureDetector(
      onTap: () {
        setState(() {
          faqExpanded[index] = !faqExpanded[index];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: const TextStyle(
                      color: primaryBlue,
                      fontSize: 11,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  if (faqExpanded[index]) ...[
                    const SizedBox(height: 12),
                    const Text(
                      "Learn more about solar energy, installation and savings.",
                      style: TextStyle(
                        color: textMuted,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(width: 10),

            Icon(
              faqExpanded[index]
                  ? Icons.remove
                  : Icons.add,
              color: Colors.grey.shade400,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // REFER & EARN
  // ============================================================

  Widget _buildReferEarn() {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4DB),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Refer & Earn",
                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 11),

                Text(
                  "₹7,500/- reward for successful referrals\n"
                      "— applicable to active Freyr Energy customers only.",
                  style: TextStyle(
                    color: Color(0xFF476077),
                    fontSize: 9,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.campaign_outlined,
                color: primaryGreen,
                size: 65,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CHAT BUTTON
  // ============================================================
  Widget _buildChatButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatHelpScreen(),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 62,
        decoration: const BoxDecoration(
          color: primaryGreen,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          Icons.chat_bubble_outline,
          color: Colors.white,
          size: 29,
        ),
      ),
    );
  }
  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _buildBottomNavigation() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
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
          _navItem(
            icon: Icons.home_outlined,
            label: "Home",
            index: 0,
          ),
          _navItem(
            icon: Icons.assignment_outlined,
            label: "My Projects",
            index: 1,
          ),
          _navItem(
            icon: Icons.headset_mic_outlined,
            label: "Help",
            index: 2,
          ),
          _navItem(
            icon: Icons.person_outline,
            label: "Account",
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool active = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyProjectsScreen(),
              ),
            );
          } else if ( index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HelpScreen(),
              ),
            );
          }
          else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          }



          else {
            setState(() {
              _selectedIndex = index;

            });

          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 27,
              color: active ? primaryGreen : primaryBlue,
            ),

            const SizedBox(height: 5),

            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: active ? primaryGreen : primaryBlue,
                fontSize: 6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}