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
|<img src="https://cdn.dribbble.com/users/3102427/screenshots/16666083/media/63e0b6f0c13499e51e2e30c8849664dc.jpg" width=200/>|<img src="https://cdn.dribbble.com/users/4559563/screenshots/16716121/media/0e9150bb29b9558ff80646c1fc87cdaf.png" width=200/>|

I like the first design, but the dark theme seems more suitable for game center app. So, mixing them will be cool. 
| Mixed |
|---|
|<img src="https://cdn.dribbble.com/users/3102427/screenshots/16666083/media/63e0b6f0c13499e51e2e30c8849664dc.jpg" width=200/>|

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

Seems like a lot, right? Don't worry, we will wrap most of them so we can just change the library without affecting the results.

# Clean and Complete architecture