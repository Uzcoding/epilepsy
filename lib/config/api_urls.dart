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
}
