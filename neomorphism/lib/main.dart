import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Color baseColor = const Color(0xFFf2f2f2);
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
    stagger(firstDepth, _animationController.value, 0.25)!;
    double calculatedSecondDepth =
    stagger(secondDepth, _animationController.value, 0.5)!;
    double calculatedThirdDepth =
    stagger(thirdDepth, _animationController.value, 0.75)!;
    double calculatedFourthDepth =
    stagger(fourthDepth, _animationController.value, 1)!;

    return Container(
      color: baseColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClayContainer(
                color: baseColor,
                height: 140,
                width: 140,
                borderRadius: 70,
                curveType: CurveType.concave,
                spread: 30,
                depth: calculatedFirstDepth.toInt(),
                child: Center(
                  child: ClayContainer(
                    height: 120,
                    width: 120,
                    borderRadius: 60,
                    depth: calculatedSecondDepth.toInt(),
                    curveType: CurveType.convex,
                    color: baseColor,
                    child: Center(
                      child: ClayContainer(
                          height: 100,
                          width: 100,
                          borderRadius: 50,
                          color: baseColor,
                          depth: calculatedThirdDepth.toInt(),
                          curveType: CurveType.concave,
                          child: Center(
                              child: ClayContainer(
                                height: 70,
                                width: 70,
                                borderRadius: 35,
                                color: baseColor,
                                depth: calculatedFourthDepth.toInt(),
                                curveType: CurveType.convex,
                              ),
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClayContainer(
                color: baseColor,
                height: 70,
                width: 70,
                borderRadius: 10,
                curveType: CurveType.concave,
                spread: 30,
                depth: calculatedFirstDepth.toInt(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClayContainer(
                color: baseColor,
                height: 140,
                width: 140,
                borderRadius: 30,
                curveType: CurveType.concave,
                spread: 30,
                depth: calculatedFirstDepth.toInt(),
                child: Center(
                  child: ClayContainer(
                    height: 120,
                    width: 120,
                    borderRadius: 30,
                    depth: calculatedSecondDepth.toInt(),
                    curveType: CurveType.convex,
                    color: baseColor,
                    child: Center(
                      child: ClayContainer(
                        height: 100,
                        width: 100,
                        borderRadius: 30,
                        color: baseColor,
                        depth: calculatedThirdDepth.toInt(),
                        curveType: CurveType.concave,
                        child: Center(
                          child: ClayContainer(
                            height: 70,
                            width: 70,
                            borderRadius: 30,
                            color: baseColor,
                            depth: calculatedFourthDepth.toInt(),
                            curveType: CurveType.convex,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClayContainer(
                color: baseColor,
                height: 140,
                width: 140,
                borderRadius: 20,
                curveType: CurveType.concave,
                spread: 30,
                depth: calculatedFirstDepth.toInt(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClayContainer(
                color: baseColor,
                height: 140,
                width: 140,
                borderRadius: 5,
                curveType: CurveType.concave,
                spread: 30,
                depth: calculatedFirstDepth.toInt(),
                child: Center(
                  child: ClayContainer(
                    height: 100,
                    width: 100,
                    borderRadius: 5,
                    depth: calculatedSecondDepth.toInt(),
                    curveType: CurveType.convex,
                    color: baseColor,
                    child: Center(
                      child: ClayContainer(
                        height: 70,
                        width: 70,
                        borderRadius: 5,
                        color: baseColor,
                        depth: calculatedFourthDepth.toInt(),
                        curveType: CurveType.convex,

                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClayContainer(
                height: 100,
                width: 100,
                borderRadius: 5,
                depth: calculatedSecondDepth.toInt(),
                curveType: CurveType.convex,
                color: baseColor,
                child: Center(
                  child: ClayContainer(
                    height: 70,
                    width: 70,
                    borderRadius: 5,
                    color: baseColor,
                    depth: calculatedFourthDepth.toInt(),
                    curveType: CurveType.convex,

                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}