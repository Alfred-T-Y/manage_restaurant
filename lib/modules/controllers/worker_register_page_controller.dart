import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class WorkerRegisterPageController extends GetxController{

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final idFocus = FocusNode();
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final passWordFocus = FocusNode();
  final confirmPassWordFocus = FocusNode();
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  List<String> choices = ["Waiter","Kitchen manager","Deliver","Manager"];
  var choice = (null as String?).obs;
  String? animationPath;
  Color? pagecolor;
  String? code = "+237";
  final phonenumberController = TextEditingController();
  final phonenumberFocus = FocusNode();

  final iconmysilverappbar = IconButton(
    onPressed: () {
      Get.back();
    }, 
    icon: FaIcon(FontAwesomeIcons.userShield), 
  );



  void submission(){
    if(focussubmission.hasFocus){
      focussubmission.unfocus();
      signup();
    }
  }

    @override
  void onInit() {
    // Écouter les changements de focussubmission
    pageState();
    focussubmission.addListener(submission);
    ever(choice, (_)=>pageState());
    super.onInit();
  }

  //signup method
  void signup(){
    //authentification

    //home page
    if(formkey.currentState!.validate() /*&& choice != null*/){
      Get.offAllNamed(Routes.workerHomePage);
    }
  }

  void pageState(){
    switch(choice.value){
      case "Waiter":
        animationPath = "assets/server.json";
        pagecolor = const Color.fromARGB(255, 15, 224, 123);
        break;
      case "Kitchen manager":
        animationPath = "assets/kitchen_manager.json";
        pagecolor = const Color.fromARGB(255, 8, 202, 14);
        break;
      case "Deliver":
        animationPath = "assets/deliver.json";
        pagecolor = const Color.fromARGB(255, 25, 1, 112);
        break;
      case "Manager":
        animationPath = "assets/manager.json";
        pagecolor = const Color.fromARGB(255, 146, 144, 23);
        break;
      default:
        animationPath = "assets/server.json";
        pagecolor = const Color.fromARGB(255, 15, 224, 123);
    }
  }

  final List<String> countryPhoneCodes = [
    '🇦🇫 +93', // Afghanistan
    '🇦🇱 +355', // Albania
    '🇩🇿 +213', // Algeria
    '🇦🇸 +1-684', // American Samoa
    '🇦🇩 +376', // Andorra
    '🇦🇴 +244', // Angola
    '🇦🇮 +1-264', // Anguilla
    '🇦🇶 +672', // Antarctica
    '🇦🇬 +1-268', // Antigua and Barbuda
    '🇦🇷 +54', // Argentina
    '🇦🇲 +374', // Armenia
    '🇦🇼 +297', // Aruba
    '🇦🇺 +61', // Australia
    '🇦🇹 +43', // Austria
    '🇦🇿 +994', // Azerbaijan
    '🇧🇸 +1-242', // Bahamas
    '🇧🇭 +973', // Bahrain
    '🇧🇩 +880', // Bangladesh
    '🇧🇧 +1-246', // Barbados
    '🇧🇾 +375', // Belarus
    '🇧🇪 +32', // Belgium
    '🇧🇿 +501', // Belize
    '🇧🇯 +229', // Benin
    '🇧🇲 +1-441', // Bermuda
    '🇧🇹 +975', // Bhutan
    '🇧🇴 +591', // Bolivia
    '🇧🇦 +387', // Bosnia and Herzegovina
    '🇧🇼 +267', // Botswana
    '🇧🇷 +55', // Brazil
    '🇮🇴 +246', // British Indian Ocean Territory
    '🇻🇬 +1-284', // British Virgin Islands
    '🇧🇳 +673', // Brunei
    '🇧🇬 +359', // Bulgaria
    '🇧🇫 +226', // Burkina Faso
    '🇧🇮 +257', // Burundi
    '🇰🇭 +855', // Cambodia
    '🇨🇲 +237', // Cameroon
    '🇨🇦 +1', // Canada
    '🇨🇻 +238', // Cape Verde
    '🇰🇾 +1-345', // Cayman Islands
    '🇨🇫 +236', // Central African Republic
    '🇹🇩 +235', // Chad
    '🇨🇱 +56', // Chile
    '🇨🇳 +86', // China
    '🇨🇴 +57', // Colombia
    '🇰🇲 +269', // Comoros
    '🇨🇬 +242', // Congo (Brazzaville)
    '🇨🇩 +243', // Congo (Kinshasa)
    '🇨🇰 +682', // Cook Islands
    '🇨🇷 +506', // Costa Rica
    '🇭🇷 +385', // Croatia
    '🇨🇺 +53', // Cuba
    '🇨🇾 +357', // Cyprus
    '🇨🇿 +420', // Czech Republic
    '🇩🇰 +45', // Denmark
    '🇩🇯 +253', // Djibouti
    '🇩🇲 +1-767', // Dominica
    '🇩🇴 +1-809', // Dominican Republic
    '🇪🇨 +593', // Ecuador
    '🇪🇬 +20', // Egypt
    '🇸🇻 +503', // El Salvador
    '🇬🇶 +240', // Equatorial Guinea
    '🇪🇷 +291', // Eritrea
    '🇪🇪 +372', // Estonia
    '🇸🇿 +268', // Eswatini
    '🇪🇹 +251', // Ethiopia
    '🇫🇯 +679', // Fiji
    '🇫🇮 +358', // Finland
    '🇫🇷 +33', // France
    '🇬🇦 +241', // Gabon
    '🇬🇲 +220', // Gambia
    '🇬🇪 +995', // Georgia
    '🇩🇪 +49', // Germany
    '🇬🇭 +233', // Ghana
    '🇬🇷 +30', // Greece
    '🇬🇱 +299', // Greenland
    '🇬🇩 +1-473', // Grenada
    '🇬🇺 +1-671', // Guam
    '🇬🇹 +502', // Guatemala
    '🇬🇳 +224', // Guinea
    '🇬🇼 +245', // Guinea-Bissau
    '🇬🇾 +592', // Guyana
    '🇭🇹 +509', // Haiti
    '🇭🇳 +504', // Honduras
    '🇭🇰 +852', // Hong Kong
    '🇭🇺 +36', // Hungary
    '🇮🇸 +354', // Iceland
    '🇮🇳 +91', // India
    '🇮🇩 +62', // Indonesia
    '🇮🇷 +98', // Iran
    '🇮🇶 +964', // Iraq
    '🇮🇪 +353', // Ireland
    '🇮🇱 +972', // Israel
    '🇮🇹 +39', // Italy
    '🇨🇮 +225', // Ivory Coast
    '🇯🇲 +1-876', // Jamaica
    '🇯🇵 +81', // Japan
    '🇯🇴 +962', // Jordan
    '🇰🇿 +7', // Kazakhstan
    '🇰🇪 +254', // Kenya
    '🇰🇮 +686', // Kiribati
    '🇽🇰 +383', // Kosovo
    '🇰🇼 +965', // Kuwait
    '🇰🇬 +996', // Kyrgyzstan
    '🇱🇦 +856', // Laos
    '🇱🇻 +371', // Latvia
    '🇱🇧 +961', // Lebanon
    '🇱🇸 +266', // Lesotho
    '🇱🇷 +231', // Liberia
    '🇱🇾 +218', // Libya
    '🇱🇮 +423', // Liechtenstein
    '🇱🇹 +370', // Lithuania
    '🇱🇺 +352', // Luxembourg
    '🇲🇴 +853', // Macao
    '🇲🇰 +389', // North Macedonia
    '🇲🇬 +261', // Madagascar
    '🇲🇼 +265', // Malawi
    '🇲🇾 +60', // Malaysia
    '🇲🇻 +960', // Maldives
    '🇲🇱 +223', // Mali
    '🇲🇹 +356', // Malta
    '🇲🇭 +692', // Marshall Islands
    '🇲🇷 +222', // Mauritania
    '🇲🇺 +230', // Mauritius
    '🇲🇽 +52', // Mexico
    '🇫🇲 +691', // Micronesia
    '🇲🇩 +373', // Moldova
    '🇲🇨 +377', // Monaco
    '🇲🇳 +976', // Mongolia
    '🇲🇪 +382', // Montenegro
    '🇲🇸 +1-664', // Montserrat
    '🇲🇦 +212', // Morocco
    '🇲🇿 +258', // Mozambique
    '🇲🇲 +95', // Myanmar
    '🇳🇦 +264', // Namibia
    '🇳🇷 +674', // Nauru
    '🇳🇵 +977', // Nepal
    '🇳🇱 +31', // Netherlands
    '🇳🇿 +64', // New Zealand
    '🇳🇮 +505', // Nicaragua
    '🇳🇪 +227', // Niger
    '🇳🇬 +234', // Nigeria
    '🇰🇵 +850', // North Korea
    '🇲🇵 +1-670', // Northern Mariana Islands
    '🇳🇴 +47', // Norway
    '🇴🇲 +968', // Oman
    '🇵🇰 +92', // Pakistan
    '🇵🇼 +680', // Palau
    '🇵🇸 +970', // Palestine
    '🇵🇦 +507', // Panama
    '🇵🇬 +675', // Papua New Guinea
    '🇵🇾 +595', // Paraguay
    '🇵🇪 +51', // Peru
    '🇵🇭 +63', // Philippines
    '🇵🇱 +48', // Poland
    '🇵🇹 +351', // Portugal
    '🇶🇦 +974', // Qatar
    '🇷🇴 +40', // Romania
    '🇷🇺 +7', // Russia
    '🇷🇼 +250', // Rwanda
    '🇰🇳 +1-869', // Saint Kitts and Nevis
    '🇱🇨 +1-758', // Saint Lucia
    '🇻🇨 +1-784', // Saint Vincent and the Grenadines
    '🇼🇸 +685', // Samoa
    '🇸🇲 +378', // San Marino
    '🇸🇹 +239', // Sao Tome and Principe
    '🇸🇦 +966', // Saudi Arabia
    '🇸🇳 +221', // Senegal
    '🇷🇸 +381', // Serbia
    '🇸🇨 +248', // Seychelles
    '🇸🇱 +232', // Sierra Leone
    '🇸🇬 +65', // Singapore
    '🇸🇰 +421', // Slovakia
    '🇸🇮 +386', // Slovenia
    '🇸🇧 +677', // Solomon Islands
    '🇸🇴 +252', // Somalia
    '🇿🇦 +27', // South Africa
    '🇰🇷 +82', // South Korea
    '🇸🇸 +211', // South Sudan
    '🇪🇸 +34', // Spain
    '🇱🇰 +94', // Sri Lanka
    '🇸🇩 +249', // Sudan
    '🇸🇷 +597', // Suriname
    '🇸🇪 +46', // Sweden
    '🇨🇭 +41', // Switzerland
    '🇸🇾 +963', // Syria
    '🇹🇼 +886', // Taiwan
    '🇹🇯 +992', // Tajikistan
    '🇹🇿 +255', // Tanzania
    '🇹🇭 +66', // Thailand
    '🇹🇬 +228', // Togo
    '🇹🇴 +676', // Tonga
    '🇹🇹 +1-868', // Trinidad and Tobago
    '🇹🇳 +216', // Tunisia
    '🇹🇷 +90', // Turkey
    '🇹🇲 +993', // Turkmenistan
    '🇹🇻 +688', // Tuvalu
    '🇺🇬 +256', // Uganda
    '🇺🇦 +380', // Ukraine
    '🇦🇪 +971', // United Arab Emirates
    '🇬🇧 +44', // United Kingdom
    '🇺🇸 +1', // United States
    '🇺🇾 +598', // Uruguay
    '🇺🇿 +998', // Uzbekistan
    '🇻🇺 +678', // Vanuatu
    '🇻🇪 +58', // Venezuela
    '🇻🇳 +84', // Vietnam
    '🇾🇪 +967', // Yemen
    '🇿🇲 +260', // Zambia
    '🇿🇼 +263', // Zimbabwe
  ];
}