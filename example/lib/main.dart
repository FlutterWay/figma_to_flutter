import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'widgets/my_bottom_navigation_bar.dart';
import 'widgets/view_category.dart';
import 'widgets/view_image.dart';

void main() {
  Figma.setup(deviceWidth: 375, deviceHeight: 812);
  runApp(const TravellApp());
}

class TravellApp extends StatelessWidget {
  const TravellApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color textColor = const Color(0xFF242424);
  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const MyBottomNavigationBar(),
        body: Padding(
          padding: figma.paddingOnly(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              figma.spacer(60, Axis.vertical),
              FigmaContainer(
                height: 40,
                padding: figma.paddingOnly(right: 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bashkortostan",
                          style: figma.style(
                              googleFont: "Rubik",
                              fontSize: 34,
                              color: textColor,
                              fontWeight: FontWeight.w500)),
                      Image.asset(
                        "assets/icons/map.png",
                        width: figma.px(24, Axis.horizontal),
                      )
                    ]),
              ),
              figma.spacer(8, Axis.vertical),
              Padding(
                padding: figma.paddingOnly(right: 24),
                child: Text(
                  "Choose another",
                  style: figma.style(
                      fontSize: 12,
                      color: textColor.withOpacity(0.5),
                      fontWeight: FontWeight.w400),
                ),
              ),
              figma.spacer(24, Axis.vertical),
              Padding(
                padding: figma.paddingOnly(right: 24),
                child: FigmaContainer(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: figma.style(
                        googleFont: "Rubik",
                        fontSize: 15,
                        color: textColor,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        hintText: "Enter name or category ",
                        hintStyle: figma.style(
                            googleFont: "Rubik",
                            fontSize: 15,
                            color: textColor.withOpacity(0.4),
                            fontWeight: FontWeight.w400),
                        contentPadding: figma.paddingOnly(left: 16),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: textColor.withOpacity(0.4),
                          size: figma.px(20, Axis.horizontal),
                        )),
                  ),
                ),
              ),
              figma.spacer(28, Axis.vertical),
              Text("Category",
                  style: figma.style(
                      googleFont: "Rubik",
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.w500)),
              figma.spacer(16, Axis.vertical),
              FigmaBox(
                height: 52,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ViewCategory(
                        iconBackground: Color(0xFFEACB8E),
                        iconPath: "assets/icons/star.png",
                        text: "Top 30 places"),
                    ViewCategory(
                        iconBackground: Color(0xFF8DE8C7),
                        iconPath: "assets/icons/tree.png",
                        text: "Nature"),
                    ViewCategory(
                        iconBackground: Color(0xFFEB5757),
                        iconPath: "assets/icons/food.png",
                        text: "Gastro"),
                  ],
                ),
              ),
              figma.spacer(28, Axis.vertical),
              FigmaBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ViewImage(
                        imagePath: "assets/images/Salavat Yulaev.png",
                        text: "Monument to Salavat Yulaev"),
                    ViewImage(
                        imagePath: "assets/images/Krasnyy klyuch.png",
                        text: "Krasnyy klyuch spring"),
                  ],
                ),
              ),
              const Spacer()
            ],
          ),
        ));
  }
}
