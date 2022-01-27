# nt_news

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## App Working Flow With Folder structures

1. App Routs generator: App routs are defined in folder: config -> routes -> app_routes.dart 

2. Constant and APIs: Constant and APIs are listed in folder: core -> utils -> api.dart and constant.dart

3. Data related task: Data sources and models, data parser are defined in: 
   1. data -> datasources -> remote -> http_parser.dart and http_request.dart 
   2. data -> models -> most_popular_article_model.dart
   
4. Presentation and UI part: All UI/Pages and Blocs are defined in this module where blocs and pages are 
   communicating for data updates
   1. presentation -> blocs -> most_popular_article_bloc.dart
   2. presentation -> pages -> most_popular_article_page.dart
                            -> most_popular_article_page_details.dart
    

