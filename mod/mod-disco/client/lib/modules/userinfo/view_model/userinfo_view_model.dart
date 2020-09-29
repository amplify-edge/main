import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/core/core.dart';

class UserInfoViewModel extends BaseModel {
  String _selectedCountry;
  String _selectedCity = "London";
  String _selectedAge = "16-20";
  String _selectedCampaignAffiliation = "Fridays for future";

  String get selectedCountry => _selectedCountry;
  String get selectedCity => _selectedCity;
  String get selectedAge => _selectedAge;
  String get selectedCampaignAffiliation => _selectedCampaignAffiliation;

  void navigateNext() {
    Modular.to.pushNamed(Modular.get<Paths>().orgs);
  }

  void changeCountry(country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void changeCity(city) {
    _selectedCity = city;
    notifyListeners();
  }

  void changeAge(age) {
    _selectedAge = age;
    notifyListeners();
  }

  void changeAffiliation(afl) {
    _selectedCampaignAffiliation = afl;
    notifyListeners();
  }

  List<String> _countries = [
    "United Kingdom",
    "Germany",
    "Spain",
    "Poland",
    "Norway"
  ];

  List<String> _cities = [
    "London",
    "Berlin",
    "Vancover",
    "New York",
  ];

  List<String> _age = [
    "10-15",
    "16-20",
    "21-30",
    "31-40",
    "41-50",
    "51-60",
    "61-60",
    "71 and over",
  ];

  List<String> _campaignAffiliations = [
    "Extinction Rebellion (XR)",
    "Fridays for future"
  ];

  List<String> get countries => _countries;
  List<String> get cities => _cities;
  List<String> get age => _age;
  List<String> get campaignAffiliations => _campaignAffiliations;
}
