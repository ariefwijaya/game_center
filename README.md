# Game Center App

Hi readers, I'm kinda excited to share you the journey when I build a simple app using Flutter. So, recently this week I received an assignment to build an app that help us to explore PS5 games. Then we will name it "Game Center" App. Before we start, I made some important points that will guide the development process:
1. Looking for UI/UX Ideas
2. Toolkit & External libraries
3. Clean and Complete architecture
4. Start Developing the module
5. Build and deploy Apps
6. Bonus (Release the WebApp version)

Ok, I think that's enough as an introduction, now without any further ado lets start our journey guys!

# Looking for UI/UX ideas
This part is quite challenging for me because I am not an artist, but I have idealism to try to get the perfect design even if it doesn't exist. So to save time, I made a quick selection of dribbble:
|[Preview 1](https://dribbble.com/shots/16666083-Game-Store-App)|[Preview 2](https://dribbble.com/shots/16716121-Game-Store-App)|
|---|---|
|<img src="https://user-images.githubusercontent.com/24664153/197448969-e353f13f-d034-4a06-888c-7481d37df286.jpg" width=200/>|<img src="https://user-images.githubusercontent.com/24664153/197449043-79d74c72-6d39-43fa-a226-2e12548d4536.png" width=200/>|

I like the first design, but the dark theme seems more suitable for game center app. So, mixing them will be cool. 
| Mixed |
|---|
|<img src="https://user-images.githubusercontent.com/24664153/197448628-57cafacb-34f3-4298-823a-ff0ca883c877.png" width=200/>|

# Toolkit & External libraries
We must prepare the toolkit and determine which external library to use. Here are the toolkit and SDK that I'm using in this assignment:
1. Macbook Pro M1 2020
2. Flutter Version Manager (FVM) + Sidekick GUI
3. Flutter 3.3.1
4. Latest Android Studio
5. Latest Visual Code Insider with Extensions:
    - Awesome Flutter Snippets 
    - bloc (required)
    - change-case
    - Dart (required)
    - Flutter (required)
    - Flutter Helpers
    - Dart Barrels Generator
    - GitLens — Git supercharged
    - Pubspec Assist
    - Todo Tree

For external libraries, I determine based on the needs of the use case only. Such as:
1. [auto_route](https://pub.dev/packages/auto_route) -> A routing solution that helps us generate navigation automatically. The generated route can also be useful for Robust, clean and easier Deeplink navigation
2. [alice](https://pub.dev/packages/alice) -> Http traffic observer, debugging made easily
3. [cached_network_image](https://pub.dev/packages/cached_network_image) -> To load and cache network images
4. [catcher](https://pub.dev/packages/catcher) -> Error catcher handler, it allows us to manage errors even integrate them into firebase crashlytics easily.
4. [dio](https://pub.dev/packages/dio) -> A powerful Http client for Dart,
5. [dio_cache_interceptor](https://pub.dev/packages/dio_cache_interceptor) -> to cache the responses from [dio] automatically. It has many cache strategy,
6. [easy_localization](https://pub.dev/packages/easy_localization) && [easy_localization_loader](https://github.com/ariefwijaya/easy_localization_loader.git) -> Easy and Fast internationalizing and localization for Flutter Apps
7. [envied](https://pub.dev/packages/envied) -> Convert Environment variable to dart. This is a good and safe way to store env in our apps
8. [equatable](https://pub.dev/packages/equatable) -> to Simplify Equality Comparisons
9. [flutter_bloc](https://pub.dev/packages/flutter_bloc) -> Our main state management. I love using bloc and this help me a lot to develop great app
10. [fluttertoast](https://pub.dev/packages/fluttertoast) -> to show native toast message
11. [google_fonts](https://pub.dev/packages/google_fonts) -> Use google font without import font files manually
12. [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) -> Lazily load and display pages of items as the user scrolls down our screen. I will integrate this with Bloc. 
13. [injectable](https://pub.dev/packages/injectable) -> to generate dependency injection using annotation
14. [json_annotation](https://pub.dev/packages/json_annotation) & [json_serializable](https://pub.dev/packages/json_serializable)  -> Data Model class generator that help us to generate a robust and clean model.
15. [shimmer](https://pub.dev/packages/shimmer) -> Skeleton loader to create beautiful loading
16. [photo_view](https://pub.dev/packages/photo_view) -> Interactive images viewer
17. [hive_flutter](https://pub.dev/packages/hive_flutter) -> No Sql storage to keep errorlytics data
18. [flutter_markdown](https://pub.dev/packages/flutter_markdown) -> To preview markdown format

Seems like a lot, right? Don't worry, we will wrap most of them so we can just change the library without affecting the results.

# Clean and Complete architecture
We will implement business requirements in a maintainable, scalable and testable manner. So we need to have a clean architecture that can suit our needs.
## BLoC Pattern

Since we use [BLoC](https://bloclibrary.dev/) as the main state management that manages User Interface changes based on the existing state. There are several terms and components used in the application of the BLoC Pattern:

- **Event** is the input for BLoC. Typically, keypress events or any commands to load data.
- **State** The screen will be adjusted based on the state generated from the BLoC.
- **Transition** is a state that changes when the event is received and before the state is updated.
- **Bloc** is the main component that sets the Events process to State. Our logic will be put in here.

![Bloc Pattern](https://user-images.githubusercontent.com/24664153/197450246-2802f442-a379-4bbd-893c-cd12b99c415d.png)

To support the application of BLOC, we need to use the BloC Pattern which consists of 3 main layers that are interconnected. This pattern will also have an influence on the project architecture used.

- **Layer 1**: *User Interface,* The layer that contains all the UI components or what we call “widgets”. This component can be seen and interacted with by the user, for example a button, form or other clickable object.
- **Layer 2**: BLoC or Cubit, This layer will be handling our business logic. It will act as a controller between UI and the data layers. E.g, email and password validation logic will be written here.
- **Layer 3**: Repository, This layer will make requests to the Backend or manage data on local storage. Sqlite, hive, or Restful API will be held here..

## Project Architecture

```
├──_localization_gen/
├──assets/
│  ├──images/
│  ├──localizations/
├──lib/
│  ├──config/
│  │  ├──injectable/
│  │  ├──routes/
│  │  ├──themes/
│  ├──constant/
│  ├──core/
│  │  ├──language/
│  │  ├──theme/
│  │  ├──errlytics/
│  │  ├──app_setting.dart
│  ├──env/
│  ├──modules/
│  ├──utils/
│  │  ├──helpers/
│  │  ├──services/
│  │  │  ├──rest_api_service/
│  │  │  ├──native_api_service.dart
│  ├──widgets/
│  │  ├──design_system/
│  │  ├──main.dart
│  │  ├──main.extend.dart
│  │  ├──main.library.dart
│  │  ├──main.import.dart
├──.env.*
├──analysis_options.yaml
├──build.yaml
├──pubspec.yaml
├──start_unix.sh
```

The architectural design of the project is adjusted to the needs of our app and the BLoC Pattern used to get a clean architecture. Here's a detailed explanation:

- `├──assets/`
    - `├──images/` → any images such as icons, illustrations, and logo
    - `├──localizations/` → all supported language localization file in .json format
- `|──config/`
    - `|──injectable/` → contains generated and initialization of dependency injection file
    - `├──routes/` → routes configuration , auth guard and generated routes file
    - `├──themes/` → theme configuration and color palette constant. Dark & Light
- `|──constant/` → any related constant for API endpoint path, custom icons data, error codes, generated localizations key, and assets path.
- `├──core/`
    - `├──language/` → Language module
    - `├──theme/` → Theme module
    - `├──errlytics/` → Alice and Errorlytics Observer module
    - `├──app_setting.dart` → Configuration for base url API, default theme, supported language, logs flag, and so on
- `├──env/` → selected and generated environment data from .env files
- `├──modules/` → Main modules that contain related UI components, bloc, providers and repository. For e.g, profile, home, transaction
- `├──utils/`
    - `├──helpers/` → any reusable general helper class such as online connection checker, money or time formatting, and so on
    - `├──services/`
        - `├──rest_api_service/` → restful API class handler
        - `├──native_api_service.dart` → Class definition to generate dependency injection for any plugin we use.
- `widgets/` → All reusable widgets
    - `├──design_system/` → Reusable Design system widgets to reduce boiler plate
- `sh start_unix.sh/` → A generator script before build this app, run `sh start_unix.sh -h` for available commands