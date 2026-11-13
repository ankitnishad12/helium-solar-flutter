import 'package:flutter/material.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

  static const Color navy = Color(0xFF0F2A4A);
  static const Color green = Color(0xFF8CC63F);
  static const Color background = Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= HEADER =================
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "My Projects",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: navy,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      child: Icon(
                        Icons.battery_alert_outlined,
                        color: Colors.redAccent,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),

              // ================= ONGOING =================
              _sectionTitle("Ongoing Projects"),

              _projectCard(
                title: "Residential Solar System",
                location: "Lucknow, Uttar Pradesh",
                capacity: "5 kW Rooftop Solar",
                date: "Expected Completion: 25 May 2025",
                status: "In Progress",
                progress: 0.60,
                image:
                "https://images.unsplash.com/photo-1508514177221-188b1cf16e9d?auto=format&fit=crop&w=500&q=80",
                ongoing: true,
              ),

              _projectCard(
                title: "Commercial Solar Project",
                location: "Kanpur, Uttar Pradesh",
                capacity: "50 kW Rooftop Solar",
                date: "Expected Completion: 10 Jun 2025",
                status: "In Progress",
                progress: 0.35,
                image:
                "https://images.unsplash.com/photo-1497435334941-8c899ee9e8e9?auto=format&fit=crop&w=500&q=80",
                ongoing: true,
              ),

              _projectCard(
                title: "Public School Solar",
                location: "Agra, Uttar Pradesh",
                capacity: "20 kW Rooftop Solar",
                date: "Expected Completion: 05 Aug 2025",
                status: "In Progress",
                progress: 0.15,
                image:
                "https://images.unsplash.com/photo-1466611653911-95081537e5b7?auto=format&fit=crop&w=500&q=80",
                ongoing: true,
              ),

              const SizedBox(height: 10),

              // ================= COMPLETED =================
              _sectionTitle("Completed Projects"),

              _projectCard(
                title: "Home Solar Installation",
                location: "Lucknow, Uttar Pradesh",
                capacity: "3 kW Rooftop Solar",
                date: "Completed On: 15 Apr 2025",
                status: "Completed",
                progress: 1.0,
                image:
                "https://images.unsplash.com/photo-1559302504-64aae6ca6b6d?auto=format&fit=crop&w=500&q=80",
                ongoing: false,
              ),

              _projectCard(
                title: "Industrial Solar Plant",
                location: "Kanpur, Uttar Pradesh",
                capacity: "100 kW Solar Plant",
                date: "Completed On: 20 Mar 2025",
                status: "Completed",
                progress: 1.0,
                image:
                "https://images.unsplash.com/photo-1509391366360-2e959784a276?auto=format&fit=crop&w=500&q=80",
                ongoing: false,
              ),

              _projectCard(
                title: "Farm Solar System",
                location: "Varanasi, Uttar Pradesh",
                capacity: "10 kW Ground Mount",
                date: "Completed On: 02 Feb 2025",
                status: "Completed",
                progress: 1.0,
                image:
                "https://images.unsplash.com/photo-1509390144018-eeaf6505229b?auto=format&fit=crop&w=500&q=80",
                ongoing: false,
              ),

              // ================= ADD PROJECT =================
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add New Project action
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Add New Project",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      elevation: 5,
                      shadowColor: green.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomItem(
                  Icons.home_outlined,
                  "Home",
                  false,
                ),

                _bottomItem(
                  Icons.list_alt_outlined,
                  "My Projects",
                  true,
                ),

                _bottomItem(
                  Icons.help_outline,
                  "Help",
                  false,
                ),

                _bottomItem(
                  Icons.person_outline,
                  "Account",
                  false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 5, 16, 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: navy,
        ),
      ),
    );
  }

  // ============================================================
  // PROJECT CARD
  // ============================================================

  Widget _projectCard({
    required String title,
    required String location,
    required String capacity,
    required String date,
    required String status,
    required double progress,
    required String image,
    required bool ongoing,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [

          // ================= TOP CONTENT =================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // IMAGE
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      image,
                      width: 125,
                      height: 125,
                      fit: BoxFit.cover,

                      errorBuilder: (
                          context,
                          error,
                          stackTrace,
                          ) {
                        return Container(
                          width: 125,
                          height: 125,
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.solar_power,
                            size: 45,
                            color: green,
                          ),
                        );
                      },
                    ),
                  ),

                  // STATUS
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 14),

              // DETAILS
              Expanded(
                child: SizedBox(
                  height: 125,
                  child: Stack(
                    children: [

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade600,
                          size: 21,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            // TITLE
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: navy,
                                height: 1.2,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // LOCATION
                            _infoRow(
                              Icons.location_on_outlined,
                              location,
                            ),

                            const SizedBox(height: 5),

                            // CAPACITY
                            _infoRow(
                              Icons.bolt_outlined,
                              capacity,
                            ),

                            const SizedBox(height: 5),

                            // DATE
                            _infoRow(
                              Icons.calendar_today_outlined,
                              date,
                            ),

                            // WORKING
                            if (!ongoing) ...[
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: green,
                                    size: 13,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Working",
                                    style: TextStyle(
                                      color: green,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ================= PROGRESS =================
          if (ongoing) ...[
            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor:
                      const Color(0xFFE2E8F0),
                      valueColor:
                      const AlwaysStoppedAnimation<Color>(
                        green,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // ============================================================
  // INFO ROW
  // ============================================================

  Widget _infoRow(
      IconData icon,
      String text,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Icon(
          icon,
          color: green,
          size: 14,
        ),

        const SizedBox(width: 5),

        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10.5,
              color: Color(0xFF1E293B),
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BOTTOM NAV ITEM
  // ============================================================

  Widget _bottomItem(
      IconData icon,
      String title,
      bool active,
      ) {
    return GestureDetector(
      onTap: () {
        // Navigation add here
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(
            icon,
            size: 25,
            color: active ? green : navy,
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: active ? green : navy,
            ),
          ),
        ],
      ),
    );
  }
}