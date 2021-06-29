import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/models.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileData = <ProfileData>[].obs;

  void fetchProfile() async {
    try {
      isLoading(true);
      var fetchedProfile = await ApiService.fetchProfile();
      if (fetchedProfile != null) {
        profileData.clear();

        profileData.add(fetchedProfile.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
