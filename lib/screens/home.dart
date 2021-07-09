import 'dart:ui';

import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/seizure_activities_controller.dart';
import 'package:epilepsy/controllers/seizure_places_controller.dart';
import 'package:epilepsy/controllers/seizure_reasons_controller.dart';
import 'package:epilepsy/controllers/seizure_type_controller.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/trainer_card.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;

  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    super.initState();
    print(Prefs.token);
    _controller =
        AnimationController(vsync: this, duration: _HomeScreenState.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('controller end');
    _controller.reverse();
    super.didChangeDependencies();
  }

  _toggleAnimation() {
    _controller.isDismissed ? _controller.forward() : _controller.reverse();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = !_controller.isDismissed &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (!shouldDrag) return;

    double delta = updateDetails.primaryDelta / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }
    double _kminFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();
    if (dragVelocity >= _kminFlingVelocity) {
      double visualVelocityInPx =
          dragEndDetails.velocity.pixelsPerSecond.dx / GetSize.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < .5) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  final SeizureTypesController seizureTypesController =
      Get.put(SeizureTypesController());

  final SeizureReasonsController seizureReasonsController =
      Get.put(SeizureReasonsController());

  final SeizurePlacesController seizurePlacesController =
      Get.put(SeizurePlacesController());
  final SeizureActivitiesController seizureActivitiesController =
      Get.put(SeizureActivitiesController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);

          return Stack(
            children: [
              CustomDrawer(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                alignment: Alignment.centerLeft,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(GetSize.width, 100.0),
                    child: CustomAppBar(
                      onTap: () => _toggleAnimation(),
                      hasAction: true,
                      isHome: true,
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCard(),
                        const SizedBox(height: 23.0),
                        Text(
                          'Последние приступы',
                          style: const TextStyle(
                            fontFamily: 'SF-UI-Display',
                            color: Palette.darkBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 23.0),
                        Expanded(
                          flex: 4,
                          child: ListView.separated(
                            itemCount: 3,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10.0),
                            itemBuilder: (context, index) => TrainerCard(),
                          ),
                        ),
                        HomeFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
