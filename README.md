# 🎬 Reelix

Flutter ile geliştirilmiş, kullanıcıların film listesini görüntüleyebildiği, favorilere ekleyebildiği ve profil yönetimi yapabildiği modern bir mobil uygulamadır.  
Clean Architecture + MVVM + BLoC state management prensipleriyle geliştirilmiştir.  

---

## 🚀 Özellikler

### 1. Kimlik Doğrulama
- Kullanıcı kayıt ve giriş işlemleri  
- Oturum tokenının güvenli bir şekilde saklanması  
- Kayıtlı oturumun korunması ve uygulamaya giriş yapılması
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
- **Navigation Service** ile merkezi yönlendirme yönetimi  (`auto_route`)  

### 5. UI & Tema
- **Custom Theme** desteği (renk, yazı tipi, boyutlandırma)  
- **Responsive UI** (`flutter_screenutil`)  
- **Animasyon implementasyonları (Lottie vs.)**  

### 6. Çoklu Dil Desteği 🌍
- **easy_localization** ile çoklu dil desteği  
- **Türkçe** ve **İngilizce** dil desteği  
- Dinamik dil değiştirme özelliği  

### 7. Firebase Entegrasyonu 🔥
- **Firebase Crashlytics** →  Crash ve hata takibi


### 8. Diğer Özellikler
- **Logger Service** → Gelişmiş log yönetimi (`logger`)  
- **Splash Screen** ve **uygulama ikonları** (`flutter_native_splash`, `icons_launcher`)  
- **Güvenli token yönetimi** (`shared_preferences` + cache layer)  


---

## 📂 Proje Mimarisi

Uygulama **Clean Architecture** ve **MVVM** prensiplerine uygun olarak geliştirilmiştir.  
Katmanlar şu şekilde yapılandırılmıştır:

```
└── 📁lib
    ├── 📁core
    │   ├── 📁base
    │   ├── 📁cache
    │   ├── 📁constants
    │   ├── 📁enums
    │   ├── 📁env
    │   ├── 📁exception
    │   ├── 📁extension
    │   ├── 📁init
    │   │   └── 📁language
    │   │       └── 📁cubit
    │   ├── 📁network
    │   ├── 📁router
    │   ├── 📁theme
    │   ├── 📁util
    │   │   ├── 📁constants
    │   │   ├── 📁dialogs
    │   │   ├── 📁model
    │   │   │   └── 📁network
    │   │   └── 📁space
    │   └── 📁widget
    ├── 📁domain
    │   └── 📁entity
    ├── 📁feature
    │   ├── 📁home
    │   │   ├── 📁cubit
    │   │   ├── 📁model
    │   │   ├── 📁service
    │   │   └── 📁view
    │   ├── 📁login
    │   │   ├── 📁cubit
    │   │   ├── 📁model
    │   │   ├── 📁service
    │   │   └── 📁view
    │   ├── 📁movies
    │   │   ├── 📁cubit
    │   │   ├── 📁model
    │   │   ├── 📁service
    │   │   └── 📁view
    │   ├── 📁profile
    │   │   ├── 📁cubit
    │   │   ├── 📁model
    │   │   ├── 📁service
    │   │   └── 📁view
    │   ├── 📁register
    │   │   ├── 📁cubit
    │   │   ├── 📁model
    │   │   ├── 📁service
    │   │   └── 📁view
    │   ├── 📁splash
    │   │   └── 📁view
    │   └── 📁upload_photo
    │       ├── 📁cubit
    │       ├── 📁model
    │       └── 📁view
    ├── 📁injection
    └── main.dart
```

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

<img width="270" height="600" alt="Screenshot_1756329935" src="https://github.com/user-attachments/assets/bc10b9d7-a730-4602-bdc4-2dad58ab27fe" />
<img width="270" height="600" alt="Screenshot_1756329937" src="https://github.com/user-attachments/assets/bebadd51-d0bb-463f-ae92-07f98d003c8c" />
<img width="270" height="600" alt="Screenshot_1756330007" src="https://github.com/user-attachments/assets/34ba4884-78ac-4626-9173-bc6fda4cd4e5" />
<img width="270" height="600" alt="Screenshot_1756330010" src="https://github.com/user-attachments/assets/bd5eafe1-19a6-41ea-93b4-1c300db3522f" />
<img width="270" height="600" alt="Screenshot_1756330102" src="https://github.com/user-attachments/assets/90452437-2674-4aca-ad8a-ee7eff8f6a64" />
<img width="270" height="600" alt="Screenshot_1756329973" src="https://github.com/user-attachments/assets/3bf80f6c-0960-41dd-928d-89d5c2cc7ac8" />
<img width="270" height="600" alt="Screenshot_1756329969" src="https://github.com/user-attachments/assets/c9fa995b-75c4-4cbc-91a8-3bd1e1ff326d" />
<img width="270" height="600" alt="Screenshot_1756330206" src="https://github.com/user-attachments/assets/affa8ac1-0fbf-46e3-a276-3e11922d2f9f" />
<img width="270" height="600" alt="Screenshot_1756329978" src="https://github.com/user-attachments/assets/2353da44-2ae7-4ab1-bd76-5ee548dff013" />
<img width="270" height="600" alt="Screenshot_1756329990" src="https://github.com/user-attachments/assets/8775a7be-f105-47b3-a9ab-f2a9a1b6e970" />
<img width="270" height="600" alt="Screenshot_1756330135" src="https://github.com/user-attachments/assets/59e17c13-66dc-4304-94f4-3cafd2f34675" />
<img width="270" height="600" alt="Screenshot_1756330156" src="https://github.com/user-attachments/assets/71270a1d-9dbc-4f19-92ad-eb8811c1a2af" />
<img width="270" height="600" alt="Screenshot_1756329983" src="https://github.com/user-attachments/assets/62f31049-63bc-4169-9079-0f8f33a4cd3f" />
<img width="270" height="600" alt="Screenshot_1756329992" src="https://github.com/user-attachments/assets/c76d3bd7-88c8-4183-a034-802673d3763a" />












