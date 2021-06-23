import 'package:epilepsy/models/faq.dart';

class FAQApi {
  List<FAQ> faq;

  FAQApi({this.faq});

  FAQApi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      faq = <FAQ>[];
      json['data'].forEach((v) {
        faq.add(FAQ.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.faq != null) {
      data['data'] = this.faq.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
