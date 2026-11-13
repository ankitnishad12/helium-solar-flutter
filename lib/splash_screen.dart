import 'dart:async';
import 'package:flutter/material.dart';
import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _logoSlideAnimation;
  late Animation<double> _logoFadeAnimation;

  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<double> _subtitleFadeAnimation;

  @override
  void initState() {
    super.initState();

    // ============================================================
    // ANIMATION CONTROLLER
    // ============================================================

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // ============================================================
    // LOGO SLIDE
    // ============================================================

    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.1,
          0.8,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    // ============================================================
    // LOGO FADE
    // ============================================================

    _logoFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.1,
          0.8,
          curve: Curves.easeIn,
        ),
      ),
    );

    // ============================================================
    // SUBTITLE SLIDE
    // ============================================================

    _subtitleSlideAnimation = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.3,
          1.0,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    // ============================================================
    // SUBTITLE FADE
    // ============================================================

    _subtitleFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.3,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    // ============================================================
    // START ANIMATION
    // ============================================================

    _controller.forward();

    // ============================================================
    // SPLASH SCREEN → LOGIN SCREEN
    // ============================================================

    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002C45),

      body: Stack(
        fit: StackFit.expand,

        children: [
          // ========================================================
          // BACKGROUND IMAGE
          // ========================================================

          Opacity(
            opacity: 0.20,

            child: Image.network(
              "https://images.unsplash.com/photo-1509391366360-2e959784a276?w=1200",

              fit: BoxFit.cover,

              errorBuilder:
                  (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF002C45),
                );
              },
            ),
          ),

          // ========================================================
          // GRADIENT OVERLAY
          // ========================================================

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,

                colors: [
                  Color(0xFF002C45),
                  Color(0xCC002C45),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // ========================================================
          // CONTENT
          // ========================================================

          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),

                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: [
                    // ==================================================
                    // LOGO
                    // ==================================================

                    SlideTransition(
                      position:
                      _logoSlideAnimation,

                      child: FadeTransition(
                        opacity:
                        _logoFadeAnimation,

                        child: FittedBox(
                          fit: BoxFit.scaleDown,

                          child: Row(
                            mainAxisSize:
                            MainAxisSize.min,

                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children: [
                              // ========================================
                              // HELIUM ICON
                              // ========================================

                              const Icon(
                                Icons.all_inclusive,
                                size: 58,
                                color:
                                Color(0xFFBEF456),
                              ),

                              const SizedBox(width: 6),

                              // ========================================
                              // HELIUM SOLAR
                              // ========================================

                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Helium",

                                      style:
                                      TextStyle(
                                        fontSize: 40,
                                        color:
                                        Colors.white,
                                        fontWeight:
                                        FontWeight.bold,
                                        letterSpacing: -1,
                                      ),
                                    ),

                                    TextSpan(
                                      text: " Solar",

                                      style:
                                      TextStyle(
                                        fontSize: 40,
                                        color:
                                        Colors.white,
                                        fontWeight:
                                        FontWeight.w300,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==================================================
                    // SUBTITLE
                    // ==================================================

                    SlideTransition(
                      position:
                      _subtitleSlideAnimation,

                      child: FadeTransition(
                        opacity:
                        _subtitleFadeAnimation,

                        child: const Text(
                          "making solar simple",

                          textAlign:
                          TextAlign.center,

                          style: TextStyle(
                            color:
                            Color(0xFFA2CBEE),
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight:
                            FontWeight.w400,
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
    );
  }
}