class CitiesManagement {
  List<String> citiesAccordingToGov(String govName) {
    List<String> selectedCities = [];
    cities.forEach((key, value) {
      if (key == govName) {
        selectedCities = value;
        return;
      }
    });
    return selectedCities;
  }

  late Map<String, List<String>> cities = {
    'بغداد': baghdadCities,
    'دهوك': dohukCities,
    'أربيل': erbilCities,
    'السليمانية': alSulaymaniyahCities,
    'كركوك': kirkukCities,
    'نينوى': ninevehCities,
    'الأنبار': alAnbarCities,
    'صلاح الدين': saladinCities,
    'ديالى': diyalaCities,
    'بابل': babilCities,
    'كربلاء': karbalaCities,
    'النجف': alNajafCities,
    'المثنى': alMuthannaCities,
    'القادسية': alQadisiyyahCities,
    'حلبجة': halabjaCities,
    'واسط': wasitCities,
    'البصرة': basraCities,
    'ميسان': maysanCities,
    'ذي قار': dhiQarCities,
  };
  List<String> ninevehCities = [];
  List<String> alAnbarCities = [];
  List<String> saladinCities = [];
  List<String> diyalaCities = [];
  List<String> babilCities = [];
  List<String> karbalaCities = [];
  List<String> alNajafCities = [];
  List<String> alMuthannaCities = [];
  List<String> alQadisiyyahCities = [];
  List<String> halabjaCities = [];
  List<String> wasitCities = [];
  List<String> basraCities = [];
  List<String> maysanCities = [];
  List<String> dhiQarCities = [];

  List<String> baghdadCities = [
    'بغداد الجديدة',
    'الصدر',
    'الكاظمية',
    'المنصور',
    'الدورة',
    'الرصافة',
    'الكرادة',
    'العامرية',
    'الشعلة',
    'الغزالية',
    'الزعفرانية',
    'الشعب',
    'الأعظمية',
    'حي العامل',
    'حي الجامعة',
    'مدينة الصدر',
    'البياع',
    'السيدية',
    'الحارثية',
    'حي العدل',
    'حي الخضراء',
    'العطيفية',
    'حي تونس',
    'الحبيبية',
    'سبع أبكار',
    'حي اور',
    'البلديات',
    'حي التراث',
    'حي الفرات',
    'حي النصر',
    'حي الربيع',
    'حي جميلة',
    'حي البنوك',
    'حي الصحة',
    'حي الرسالة',
    'حي الزهراء'
  ];

  List<String> dohukCities = [
    // Add cities in Dohuk here
    'زاخو',
    'دهوك',
    'سميل',
    'باتفايا',
    'الفيشخابور',
    'باميرا',
    'كلك',
    'بردرش',
    'كنعانية',
    'سميل',
    'مسكان'
  ];

  List<String> erbilCities = [
    // Add cities in Erbil here
    'أربيل',
    'كويسنجق',
    'صلاح الدين',
    'سوران',
    'سراي',
    'خانقين',
    'عقرة',
    'مريانة',
    'بانه',
    'رانية',
    'قره داغ',
    'كفره',
    'خانقين',
    'حلافجة'
  ];

  List<String> alSulaymaniyahCities = [
    // Add cities in Sulaymaniyah here
    'السليمانية',
    'پنجوايه',
    'كلار',
    'داقوق',
    'باوه رستم',
    'بلانج',
    'دهكاني',
    'صله ديزه',
    'سملقان',
    'سرشيوه',
    'خانقين',
    'توكومان',
    'قزيلجه',
    'كورامسين',
    'كلار',
    'قروه',
    'دشت برزان'
  ];

  List<String> kirkukCities = [
    // Add cities in Kirkuk here
    'كركوك',
    'الحويجة',
    'دبس',
    'الحويجة',
    'رياض',
    'دبس',
    'زربازين',
    'دبس',
    'حسان',
    'بابا',
    'طوزخورماتو',
  ];
}
