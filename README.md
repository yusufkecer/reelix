# 🎬 Reelix

Flutter ile geliştirilmiş, kullanıcıların film listesini görüntüleyebildiği, favorilere ekleyebildiği ve profil yönetimi yapabildiği modern bir mobil uygulamadır.  
Clean Architecture + MVVM + BLoC state management prensipleriyle geliştirilmiştir.  

---

## 🚀 Özellikler

### 1. Kimlik Doğrulama
- Kullanıcı kayıt ve giriş işlemleri  
- Oturum token'ının güvenli bir şekilde saklanması  
- Başarılı giriş sonrası otomatik ana sayfa yönlendirmesi  

### 2. Ana Sayfa
- Sonsuz kaydırma (Infinite Scroll) ile film listesi  
- Her sayfada 5 film gösterimi  
- Otomatik yükleme göstergesi  
- Pull-to-refresh desteği  
- Favori film ekleme/çıkarma işlemlerinde anlık UI güncellemesi  

### 3. Profil
- Kullanıcı bilgilerini görüntüleme  
- Favori filmler listesi  
- Profil fotoğrafı yükleme özelliği  

### 4. Navigasyon
- Bottom Navigation Bar ile sayfalar arası geçiş  
- Ana sayfa state yönetimi ve korunması  
- **Navigation Service** ile merkezi yönlendirme yönetimi  

### 5. UI & Tema
- **Custom Theme** desteği (renk, yazı tipi, boyutlandırma)  
- **Responsive UI** (`flutter_screenutil`)  
- **Animasyon implementasyonları (Lottie vs.)**  

### 6. Çoklu Dil Desteği 🌍
- **easy_localization** ile çoklu dil desteği  
- **Türkçe** ve **İngilizce** dil desteği  
- Dinamik dil değiştirme özelliği  

### 7. Diğer Özellikler
- **Logger Service** → Gelişmiş log yönetimi (`logger`)  
- **Splash Screen** ve **uygulama ikonları** (`flutter_native_splash`, `icons_launcher`)  
- **Güvenli token yönetimi** (`shared_preferences` + cache layer)  

---

## 📂 Proje Mimarisi

Uygulama **Clean Architecture** ve **MVVM** prensiplerine uygun olarak geliştirilmiştir.  
Katmanlar şu şekilde yapılandırılmıştır:

└── 📁lib
├── 📁core # Çekirdek katman (base, network, theme, cache, util, widget, services)
├── 📁domain # Domain katmanı (Entity tanımları)
├── 📁feature # Feature bazlı modüller
│ ├── 📁home
│ ├── 📁login
│ ├── 📁movies
│ ├── 📁profile
│ ├── 📁register
│ ├── 📁splash
│ └── 📁upload_photo
├── 📁injection # Dependency Injection ayarları (get_it, injectable)
└── main.dart

## 🧩 Mimari Diyagram

            +-----------------------+
            |     Presentation      |
            |-----------------------|
            | View (Widget, Page)   |
            | ViewModel (Cubit/Bloc)|
            | UI Widgets            |
            +-----------▲-----------+
                        |
                        |
            +-----------▼-----------+
            |        Domain         |
            |-----------------------|
            | Entities              |
            | UseCases              |
            | Repository Interfaces |
            +-----------▲-----------+
                        |
                        |
            +-----------▼-----------+
            |         Data          |
            |-----------------------|
            | Repository Impl.      |
            | Remote Data Sources   |
            | Local Data Sources    |
            +-----------------------+


- **Presentation Layer** → UI, Bloc/Cubit, ViewModel  
- **Domain Layer** → İş kuralları, UseCase, Entity, Repository interface  
- **Data Layer (Core + Feature)** → Repository implementasyonları, API & Cache işlemleri  

---

## 🛠️ Kullanılan Paketler

| Paket | Açıklama |
|-------|----------|
| flutter_bloc | State management |
| equatable | Model karşılaştırma kolaylığı |
| dio | HTTP istekleri |
| flutter_native_splash | Splash ekran |
| icons_launcher | Uygulama ikonları |
| get_it | Dependency Injection (DI) |
| injectable | DI code generator |
| auto_route | Otomatik route yönetimi |
| json_annotation / json_serializable | Model serileştirme |
| logger | Loglama |
| lottie | Animasyonlar |
| shared_preferences | Local storage |
| infinite_scroll_pagination | Sonsuz kaydırma |
| envied | Ortam değişkenleri |
| flutter_screenutil | Responsive tasarım |
| kartal | Extension yardımcıları |
| image_picker | Fotoğraf seçimi |
| flutter_svg | SVG desteği |
| cached_network_image | Görsellerin cache’lenmesi |

# 📷 Ekran Görüntüleri

<img width="270" height="600" alt="Screenshot_1756248961" src="https://github.com/user-attachments/assets/15fa5712-9a4a-4095-8ab9-c356c7692444" />
<img width="270" height="600" alt="Screenshot_1756249577" src="https://github.com/user-attachments/assets/05404ec8-a0b9-432f-b7c9-e690f61d2a75" />
<img width="270" height="600" alt="Screenshot_1756249584" src="https://github.com/user-attachments/assets/ca49cddd-996a-4c1c-a3dd-49becc0cbcd2" />
<img width="270" height="600" alt="Screenshot_1756249573" src="https://github.com/user-attachments/assets/8193313b-fbd8-4eec-873c-e26c3d2a67bf" />
<img width="270" height="600" alt="Screenshot_1756248966" src="https://github.com/user-attachments/assets/65a986d3-d134-4f53-aa7f-214e63b67381" />
<img width="270" height="600" alt="Screenshot_1756249372" src="https://github.com/user-attachments/assets/7c7ebac9-15a9-4428-ad75-a80f47429732" />
<img width="270" height="600" alt="Screenshot_1756249375" src="https://github.com/user-attachments/assets/4d43c3ad-79c8-42db-a524-c0c263d7904d" />
<img width="270" height="600" alt="Screenshot_1756249368" src="https://github.com/user-attachments/assets/fb3b0157-d777-48ff-8224-c069c5be07ed" />
<img width="270" height="600" alt="Screenshot_1756249613" src="https://github.com/user-attachments/assets/9e44ca7e-1aa9-42b8-8d37-01bf2fd95b3c" />
<img width="270" height="600" alt="Screenshot_1756249388" src="https://github.com/user-attachments/assets/8752fdfb-2fa7-4252-bcb0-e6442ec17cf1" />
<img width="270" height="600" alt="Screenshot_1756249398" src="https://github.com/user-attachments/assets/9181a3ce-8736-4de8-bf0b-e2dd81a9fad5" />
<img width="270" height="600" alt="Screenshot_1756249629" src="https://github.com/user-attachments/assets/da8e0125-e6dd-44d6-b408-ee20fbe40e6e" />











