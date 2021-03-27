import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/epilepsy_icons.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'FAQ',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        hasIcon: false,
                      ),
                      header: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Palette.scaffoldBackgorund,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(.2),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Как родители могут помочь в\nлечении эпилепсии у ребенка?',
                                style: TextStyles.accordionTitle,
                              ),
                            ),
                            ExpandableIcon(
                              theme: ExpandableThemeData(
                                expandIcon: EpilepsyIcons.right_open,
                                collapseIcon: EpilepsyIcons.down_open,
                                iconSize: 18.0,
                                iconColor: Palette.accordionIcon,
                              ),
                            )
                          ],
                        ),
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Ребенок зачастую не способен правильно и регулярно выполнять назначения врача. Контроль над лечением должны обеспечить родители. Необходимо тщательно регистрировать состояние ребенка, т.е. вести «дневник пациента». Родители должны обеспечивать регулярное посещение врача и выполнение всех его назначений. Кроме того, родители должны организовать правильный режим дня ребенка, следить, чтобы он спал достаточное количество времени, не переутомлялся, гулял на свежем воздухе, занимался физическими упражнениями, регулярно и правильно питался, соблюдал назначения лечащего врача надлежащим образом.',
                          style: TextStyles.accordionText,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        hasIcon: false,
                      ),
                      header: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Palette.scaffoldBackgorund,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(.2),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'О чем нужно помнить родителям подростков?',
                                style: TextStyles.accordionTitle,
                              ),
                            ),
                            ExpandableIcon(
                              theme: ExpandableThemeData(
                                expandIcon: EpilepsyIcons.right_open,
                                collapseIcon: EpilepsyIcons.down_open,
                                iconSize: 18.0,
                                iconColor: Palette.accordionIcon,
                              ),
                            )
                          ],
                        ),
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Ребенок зачастую не способен правильно и регулярно выполнять назначения врача. Контроль над лечением должны обеспечить родители. Необходимо тщательно регистрировать состояние ребенка, т.е. вести «дневник пациента». Родители должны обеспечивать регулярное посещение врача и выполнение всех его назначений. Кроме того, родители должны организовать правильный режим дня ребенка, следить, чтобы он спал достаточное количество времени, не переутомлялся, гулял на свежем воздухе, занимался физическими упражнениями, регулярно и правильно питался, соблюдал назначения лечащего врача надлежащим образом.',
                          style: TextStyles.accordionText,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        hasIcon: false,
                      ),
                      header: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Palette.scaffoldBackgorund,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(.2),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Можно ли ребенку с эпилепсией делать прививки?',
                                style: TextStyles.accordionTitle,
                              ),
                            ),
                            ExpandableIcon(
                              theme: ExpandableThemeData(
                                expandIcon: EpilepsyIcons.right_open,
                                collapseIcon: EpilepsyIcons.down_open,
                                iconSize: 18.0,
                                iconColor: Palette.accordionIcon,
                              ),
                            )
                          ],
                        ),
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Ребенок зачастую не способен правильно и регулярно выполнять назначения врача. Контроль над лечением должны обеспечить родители. Необходимо тщательно регистрировать состояние ребенка, т.е. вести «дневник пациента». Родители должны обеспечивать регулярное посещение врача и выполнение всех его назначений. Кроме того, родители должны организовать правильный режим дня ребенка, следить, чтобы он спал достаточное количество времени, не переутомлялся, гулял на свежем воздухе, занимался физическими упражнениями, регулярно и правильно питался, соблюдал назначения лечащего врача надлежащим образом.',
                          style: TextStyles.accordionText,
                          softWrap: true,
                        ),
                      ),
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
}
