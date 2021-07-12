abstract class ApiUrls {
  static const mainUrl = 'api.cepi.xartcode.uz';
  static const http = 'http://';
  static const baseUrl = '$http$mainUrl';

  // Info
  static const news = '$baseUrl/handbook/news';
  static const faq = '$baseUrl/handbook/faq';
  static const contacts = '$baseUrl/handbook/contacts';
  static const authorPage = '$baseUrl/handbook/pages/authors_page';
  static const aboutPage = '$baseUrl/handbook/pages/about_page';
  static const apiLevel = '$baseUrl/handbook/api-level';

  // Auth
  static const login = '$baseUrl/auth/login';
  static const verify = '$baseUrl/auth/login-verify/';
  static const logOut = '$baseUrl/auth/logout/';

  // Profile
  static const profile = '$baseUrl/profile/show';

  //EEG
  static const eeg = '$baseUrl/eeg/index';
  static const eegStore = '$baseUrl/eeg/store';

  //profile
  static const profileUpdate = '$baseUrl/profile/update';

  //SEIZURES
  static const seizuresByDate = '$baseUrl/seizures/date';
  static const seizureStore = '$baseUrl/seizures/store';

  //HandBook

  static const seizureTypes = '$baseUrl/handbook/seizure-types';
  static const seizureReasons = '$baseUrl/handbook/seizure-reasons';
  static const seizurePlaces = '$baseUrl/handbook/seizure-places';
  static const seizureActivities = '$baseUrl/handbook/seizure-activities';

  // tendencies
  static const statistics = '$baseUrl/tendencies';

  //Drugs
  static const drugs = '$baseUrl/drugs/index';
  static const addDrug = '$baseUrl/drugs/store';
}
