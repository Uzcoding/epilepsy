class TendenciesApi {
  Tendencies data;

  TendenciesApi({this.data});

  TendenciesApi.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Tendencies.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Tendencies {
  WeekFrequency weekFrequency;
  WeekFrequency monthFrequency;
  WeekFrequency yearFrequency;
  WeekFrequency distributionByHour;
  WeekFrequency distributionByWeek;
  WeekFrequency distributionByYear;
  WeekFrequency weekTypes;
  WeekFrequency monthTypes;
  WeekFrequency yearTypes;
  List<String> typesColors;
  WeekFrequency weekReasons;
  WeekFrequency monthReasons;
  WeekFrequency yearReasons;
  List<String> reasonColors;
  WeekFrequency weekActivities;
  WeekFrequency monthActivities;
  WeekFrequency yearActivities;
  List<String> activitiesColors;
  WeekFrequency weekPlaces;
  WeekFrequency monthPlaces;
  WeekFrequency yearPlaces;
  List<String> placesColors;

  Tendencies(
      {this.weekFrequency,
      this.monthFrequency,
      this.yearFrequency,
      this.distributionByHour,
      this.distributionByWeek,
      this.distributionByYear,
      this.weekTypes,
      this.monthTypes,
      this.yearTypes,
      this.typesColors,
      this.weekReasons,
      this.monthReasons,
      this.yearReasons,
      this.reasonColors,
      this.weekActivities,
      this.monthActivities,
      this.yearActivities,
      this.activitiesColors,
      this.weekPlaces,
      this.monthPlaces,
      this.yearPlaces,
      this.placesColors});

  Tendencies.fromJson(Map<String, dynamic> json) {
    weekFrequency = json['weekFrequency'] != null
        ? new WeekFrequency.fromJson(json['weekFrequency'])
        : null;
    monthFrequency = json['monthFrequency'] != null
        ? new WeekFrequency.fromJson(json['monthFrequency'])
        : null;
    yearFrequency = json['yearFrequency'] != null
        ? new WeekFrequency.fromJson(json['yearFrequency'])
        : null;
    distributionByHour = json['distributionByHour'] != null
        ? new WeekFrequency.fromJson(json['distributionByHour'])
        : null;
    distributionByWeek = json['distributionByWeek'] != null
        ? new WeekFrequency.fromJson(json['distributionByWeek'])
        : null;
    distributionByYear = json['distributionByYear'] != null
        ? new WeekFrequency.fromJson(json['distributionByYear'])
        : null;
    weekTypes = json['weekTypes'] != null
        ? new WeekFrequency.fromJson(json['weekTypes'])
        : null;
    monthTypes = json['monthTypes'] != null
        ? new WeekFrequency.fromJson(json['monthTypes'])
        : null;
    yearTypes = json['yearTypes'] != null
        ? new WeekFrequency.fromJson(json['yearTypes'])
        : null;
    typesColors = json['typesColors'].cast<String>();
    weekReasons = json['weekReasons'] != null
        ? new WeekFrequency.fromJson(json['weekReasons'])
        : null;
    monthReasons = json['monthReasons'] != null
        ? new WeekFrequency.fromJson(json['monthReasons'])
        : null;
    yearReasons = json['yearReasons'] != null
        ? new WeekFrequency.fromJson(json['yearReasons'])
        : null;
    reasonColors = json['reasonColors'].cast<String>();
    weekActivities = json['weekActivities'] != null
        ? new WeekFrequency.fromJson(json['weekActivities'])
        : null;
    monthActivities = json['monthActivities'] != null
        ? new WeekFrequency.fromJson(json['monthActivities'])
        : null;
    yearActivities = json['yearActivities'] != null
        ? new WeekFrequency.fromJson(json['yearActivities'])
        : null;
    activitiesColors = json['activitiesColors'].cast<String>();
    weekPlaces = json['weekPlaces'] != null
        ? new WeekFrequency.fromJson(json['weekPlaces'])
        : null;
    monthPlaces = json['monthPlaces'] != null
        ? new WeekFrequency.fromJson(json['monthPlaces'])
        : null;
    yearPlaces = json['yearPlaces'] != null
        ? new WeekFrequency.fromJson(json['yearPlaces'])
        : null;
    placesColors = json['placesColors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weekFrequency != null) {
      data['weekFrequency'] = this.weekFrequency.toJson();
    }
    if (this.monthFrequency != null) {
      data['monthFrequency'] = this.monthFrequency.toJson();
    }
    if (this.yearFrequency != null) {
      data['yearFrequency'] = this.yearFrequency.toJson();
    }
    if (this.distributionByHour != null) {
      data['distributionByHour'] = this.distributionByHour.toJson();
    }
    if (this.distributionByWeek != null) {
      data['distributionByWeek'] = this.distributionByWeek.toJson();
    }
    if (this.distributionByYear != null) {
      data['distributionByYear'] = this.distributionByYear.toJson();
    }
    if (this.weekTypes != null) {
      data['weekTypes'] = this.weekTypes.toJson();
    }
    if (this.monthTypes != null) {
      data['monthTypes'] = this.monthTypes.toJson();
    }
    if (this.yearTypes != null) {
      data['yearTypes'] = this.yearTypes.toJson();
    }
    data['typesColors'] = this.typesColors;
    if (this.weekReasons != null) {
      data['weekReasons'] = this.weekReasons.toJson();
    }
    if (this.monthReasons != null) {
      data['monthReasons'] = this.monthReasons.toJson();
    }
    if (this.yearReasons != null) {
      data['yearReasons'] = this.yearReasons.toJson();
    }
    data['reasonColors'] = this.reasonColors;
    if (this.weekActivities != null) {
      data['weekActivities'] = this.weekActivities.toJson();
    }
    if (this.monthActivities != null) {
      data['monthActivities'] = this.monthActivities.toJson();
    }
    if (this.yearActivities != null) {
      data['yearActivities'] = this.yearActivities.toJson();
    }
    data['activitiesColors'] = this.activitiesColors;
    if (this.weekPlaces != null) {
      data['weekPlaces'] = this.weekPlaces.toJson();
    }
    if (this.monthPlaces != null) {
      data['monthPlaces'] = this.monthPlaces.toJson();
    }
    if (this.yearPlaces != null) {
      data['yearPlaces'] = this.yearPlaces.toJson();
    }
    data['placesColors'] = this.placesColors;
    return data;
  }
}

class WeekFrequency {
  List<String> labels;
  List<int> data;

  WeekFrequency({this.labels, this.data});

  WeekFrequency.fromJson(Map<String, dynamic> json) {
    labels = json['labels'].cast<String>();
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labels'] = this.labels;
    data['data'] = this.data;
    return data;
  }
}
