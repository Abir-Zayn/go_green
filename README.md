# go_green

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


lib/
├── common/
│ │ ├── Widgets/
│ │ ├── app_search_bar.dart
├── core/
│ ├── constants/
│ │ ├── api_constants.dart
│ │ ├── app_constants.dart
│ ├── theme/
│ │ ├── app_colors.dart
│ │ ├── app_theme.dart
│ │ └── text_styles.dart
│ │ └── app_styles.dart
│ └── utils/
│ │ └── routes/
│ │ └── app_routes.dart
├── data/
│ ├── models/
│ │ ├── auth/
│ │ └── home/
│ ├── repositories/
│ └── services/
│ └── api_service.dart
├── pages/
│ ├── auth/
│ │ ├── bloc/
│ │ │ ├── auth_bloc.dart
│ │ │ ├── auth_event.dart
│ │ │ └── auth_state.dart
│ │ ├── controllers/
│ │ │ └── auth_controller.dart
│ │ └── views/
│ │ ├── login_screen.dart
│ │ ├── register_screen.dart
│ │ └── widgets/
│ │ ├── custom_text_field.dart
│ │ └── auth_button.dart
│ ├── home/
│ │ ├── bloc/
│ │ │ ├── home_bloc.dart
│ │ │ ├── home_event.dart
│ │ │ └── home_state.dart
│ │ ├── controllers/
│ │ │ └── home_controller.dart
│ │ └── views/
│ │ ├── home_screen.dart
│ └── splash/
│ ├── bloc/
│ │ ├── splash_bloc.dart
│ │ ├── splash_event.dart
│ │ └── splash_state.dart
│ ├── controllers/
│ │ └── splash_controller.dart
│ └── views/
│ └── splash_screen.dart
└── main.dart