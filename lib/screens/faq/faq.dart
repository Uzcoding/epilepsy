import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/FAQController.dart';
import 'package:epilepsy/models/faq.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/faq_card.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final FAQsController faqsController = Get.put(FAQsController());
  @override
  void initState() {
    super.initState();
    faqsController.fetchFAQs();
  }

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
      body: Obx(() {
        var faqs = faqsController?.faqsList;
        if (faqsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!faqsController.isLoading.value && faqs == null ||
            faqs.isEmpty) {
          Center(
            child: Text('No data'),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  final FAQ data = faqs[index];
                  return FAQCard(data: data);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
