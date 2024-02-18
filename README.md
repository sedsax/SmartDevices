# smart_devices

Proje Mimarisi (MVVM)

Smart Devices
lib
  constants
    - colors.dart
    - routine_textstyle.dart
  models
    - device.dart
    - routine.dart
  util
    - device_card_list.dart
    - device_card.dart
    - routine_card_list.dart
    - routine_card.dart
    - welcome_user.dart
  view
    - home_screen.dart
    - new_routine_screen.dart
    - routine_detail_screen.dart
  view-models
    - device_view_model.dart
  main.dart

Dependencies:
  - Provider
  - SharedPreferences

[Smart Devices App](https://youtube.com/shorts/9hyyJFpr5Yc?feature=share)

| ![Dashboard-off](Simulator Screenshot - iPhone 15 Pro - 2024-02-18 at 23.30.46.png) | ![Dashboard-on](Simulator Screenshot - iPhone 15 Pro - 2024-02-18 at 23.30.53.png) |

Smart Devices uygulaması ile akıllı cihazları ekleyebilir ve program planlayıp rutinler oluşturabilirsiniz. 
Rutin ekleme ve silme işlemleri yapılıyor.
Sayfalar arası veri aktarımı yapılıyor.
Detay sayfasından rutin bilgisi ve cihaz durumu görülebiliyor.
Küçük bir proje olduğu için state yönetiminde Provider kullandım. 
Cihazların on/off bilgisini SharedPreferences ile lokalde tuttum.
UI için internetten araştırma yapıp kendime göre uyarladım.


Kaynak:
  - https://www.youtube.com/watch?v=jzrzTtpc92U&ab_channel=LambdaStudio (UI)
  - https://www.youtube.com/watch?v=FMV8pbz0sN8&ab_channel=MitchKoko (UI)
  - https://pub.dev/packages/provider (state management)
  - https://pub.dev/packages/shared_preferences (local storage)


