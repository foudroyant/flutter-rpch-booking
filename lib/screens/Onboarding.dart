import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rpchbooking/main.dart';
import 'package:rpchbooking/models/OnboardingInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<OnboardingInfo> controller = [
    OnboardingInfo(
        titre: "🌟 Facilité de Réservation",
        description: "Réservez en quelques clics et profitez d'un processus simplifié pour garantir une expérience utilisateur fluide.",
        image: "assets/lotties/animation-3.json"
    ),
    OnboardingInfo(
        titre: "⌚ Gagnez du Temps",
        description: "Oubliez les tracas liés à la planification. RPCH-Booking vous permet de maximiser votre temps et de minimiser le stress.",
        image: "assets/lotties/animation-2.json"
    ),
    OnboardingInfo(
        titre: "📱 Application Intuitive",
        description: "Notre interface conviviale rend la navigation agréable, que vous soyez un expert en technologie ou un utilisateur débutant.",
        image: "assets/lotties/animation.json"
    ),
  ];

  final pageController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: controller.length,
          controller: pageController,
          onPageChanged: (index)=>setState(() => isLast = controller.length - 1 == index ),
          itemBuilder: (context, index){
          final item = controller[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(item.image),
              const SizedBox(height: 15,),
              Text(item.titre, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              const SizedBox(height: 15,),
              Text(item.description, style: const TextStyle(fontSize: 17, color: Colors.grey), textAlign: TextAlign.center,)
            ],
          ),
        );
      }),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLast ? StartedButton() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              pageController.jumpToPage(controller.length - 1);
            }, child: const Text("Passer")),

            SmoothPageIndicator(
              controller: pageController,
              count: controller.length,
              onDotClicked: (index){
                pageController.animateToPage(index, duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
              },
              effect: const WormEffect(
                activeDotColor: Colors.purple,
                dotHeight: 12,
                dotWidth: 12
              ),
            ),

            TextButton(onPressed: (){
              pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
            }, child: const Text("Suivant"))
          ],
        ),
      ),
    );
  }

  Widget StartedButton(){
    return Container(
      decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(child: const Text("Commencez dès Maintenant!", style: TextStyle(color: Colors.white),), onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("onboarding", true);

        if(!mounted) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=>AuthenticationWrapper())
        );
      }),
    );
  }
}
