import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/TendenciesController.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/bar_chart_sample.dart';
import 'package:epilepsy/widgets/pie_chart_sample.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

const types = [
  'Частота',
  'Распределение',
  'Вид',
  'Возможная причина',
  'Активность',
  'Места'
];

class SeizuresScreen extends StatefulWidget {
  @override
  _SeizuresScreenState createState() => _SeizuresScreenState();
}

class _SeizuresScreenState extends State<SeizuresScreen> {
  int tabIndex = 0;
  final TendenciesController _tendenciesController =
      Get.put(TendenciesController());

  @override
  void initState() {
    _tendenciesController.fetchStatistics();
    super.initState();
  }

  void setTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  BoxDecoration _applyDecoration(bool active) {
    if (active) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(250.0),
        color: const Color(0xffedeef2),
        gradient: LinearGradient(
          begin: Alignment(-1.0, -1.0),
          end: Alignment(1.0, 1.0),
          colors: [const Color(0xffad6ee5), const Color(0xff9749db)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xb2ffffff),
            offset: Offset(-2, -2),
            blurRadius: 3,
          ),
        ],
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(250.0),
        color: const Color(0xffeaebf3),
        border: Border.all(width: 1.0, color: const Color(0xff9f5dd9)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xb2ffffff),
            offset: Offset(-2, -2),
            blurRadius: 3,
          ),
        ],
      );
    }
  }

  Widget _buildTypeItem({String text, int index}) {
    final isActive = index == tabIndex;
    return GestureDetector(
      onTap: () => setTabIndex(index),
      child: Container(
        margin: EdgeInsets.only(right: 28),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: _applyDecoration(isActive),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'SF UI Display',
            fontSize: 15,
            color: Color(isActive ? 0xffffffff : 0xff9f5dd9),
            letterSpacing: 0.004200000017881393,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildList() {
    return Container(
      height: 31,
      margin: EdgeInsets.only(bottom: 29),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) =>
            _buildTypeItem(text: types[index], index: index),
        itemCount: types.length,
      ),
    );
  }

  Widget _buildFrequency() {
    return Column(
      children: [
        SimpleBarChart(
          _tendenciesController.statistics.first.weekFrequency,
          animate: true,
          title: 'За последнюю неделю',
        ),
        SimpleBarChart(
          _tendenciesController.statistics.first.monthFrequency,
          animate: true,
          title: 'За последний месяц',
        ),
        SimpleBarChart(
          _tendenciesController.statistics.first.yearFrequency,
          animate: true,
          title: 'За последний месяц',
        ),
      ],
    );
  }

  Widget _buildDistribution() {
    return Column(
      children: [
        SimpleBarChart(
          _tendenciesController.statistics.first.distributionByHour,
          animate: true,
          title: 'За последнюю неделю',
        ),
        SimpleBarChart(
          _tendenciesController.statistics.first.distributionByWeek,
          animate: true,
          title: 'За последний месяц',
        ),
        SimpleBarChart(
          _tendenciesController.statistics.first.distributionByYear,
          animate: true,
          title: 'За последний месяц',
        ),
      ],
    );
  }

  Widget _buildPlaces() {
    return Column(
      children: [
        SimplePieChart(
          _tendenciesController.statistics.first.weekPlaces,
          animate: true,
          title: 'За последнюю неделю',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.weekPlaces,
          animate: true,
          title: 'За последний месяц',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.yearPlaces,
          animate: true,
          title: 'За последний год',
        ),
      ],
    );
  }

  Widget _buildTypes() {
    return Column(
      children: [
        SimplePieChart(
          _tendenciesController.statistics.first.weekTypes,
          animate: true,
          title: 'За последнюю неделю',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.monthTypes,
          animate: true,
          title: 'За последний месяц',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.yearTypes,
          animate: true,
          title: 'За последний год',
        ),
      ],
    );
  }

  Widget _buildActivities() {
    return Column(
      children: [
        SimplePieChart(
          _tendenciesController.statistics.first.weekActivities,
          animate: true,
          title: 'За последнюю неделю',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.monthActivities,
          animate: true,
          title: 'За последний месяц',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.yearActivities,
          animate: true,
          title: 'За последний год',
        ),
      ],
    );
  }

  Widget _buildReasons() {
    return Column(
      children: [
        SimplePieChart(
          _tendenciesController.statistics.first.weekReasons,
          animate: true,
          title: 'За последнюю неделю',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.monthReasons,
          animate: true,
          title: 'За последний месяц',
        ),
        SimplePieChart(
          _tendenciesController.statistics.first.yearReasons,
          animate: true,
          title: 'За последний год',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_tendenciesController.statistics);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Тенденции',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            _buildList(),
            Obx(() {
              if (_tendenciesController.isLoading()) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return [
                  _buildFrequency(),
                  _buildDistribution(),
                  _buildTypes(),
                  _buildReasons(),
                  _buildActivities(),
                  _buildPlaces(),
                ][tabIndex];
              }
            }),
          ],
        ),
      ),
    );
  }
}
