# U-Tracker

## Description

U-Tracker is a comprehensive solution that combines Geo-fencing and location-based task management. It empowers employers to effortlessly track employee attendance by automatically recording their time-in and time-out based on site fencing (Geo-fencing). Additionally, U-Tracker offers location-based task management to streamline and enhance productivity. 

## Features

- SaaS model
- Auto attendance using Geo Fence
- Location based Task Management
- Online/Offline Data Sync

## Installation

- [install Git](https://github.com/git-guides/install-git)
- [Install flutter SDK ](https://docs.flutter.dev/get-started/install)
- [Install android studio ](https://developer.android.com/studio)
- [Editor setup ](https://docs.flutter.dev/get-started/editor?tab=vscode)
- [App Mangments / Deployments - firebase-cli](https://firebase.google.com/docs/cli)

## Project setup 

1. Clone the repository: 
`shell git clone https://github.com/your-username/utracker.git`
2. Change to the project directory: 
`shell cd utracker`
3. Install the dependencies: 
`shell flutter pub get`
4. Run the app: 
`shell flutter run`
5. Project structure : Feature fist model, [more](https://github.com/bizz84/flutter-tips-and-tricks/blob/main/tips/0039-flutter-project-structure-feature-first-or-layer-first/index.md) 

## Technologies Used

- Flutter
- Firebase (Firestore, Authentication, etc.)
- Git for code managment 
- Git Actions for deployment pipelines(web, apk, etc)
- Application based on [Clean Architecture](https://github.com/guilherme-v/flutter-clean-architecture-example)
- Firebase act as BASS(back-end-as-service-layer)
- Figma for UI designs, [Utracker-Figma](https://www.figma.com/file/gzawjW7mIarjiCCL2u3A6u/UTracker?type=design&node-id=47909-2&mode=design&t=OY0OZxDmM25yQOLa-0)

## Deployment
- Local run, Developer choose, run it from editors or Command line.
  - CORS - Enable security during local development : `dart pub global activate flutter_cors`
  - CORS - Disable security during local development : `fluttercors --disable`
  - APK location : `find the apk in <root-folder>/build/app/outputs/flutter-apk/app-release.apk`
- `DEV` `UAT` `PROD` - Deployments will go through the CI/CD pipeline (git actions)


## Contributors

- [List the contributors or team members involved in the project]

## License

U-Tracker is licensed by Datamedai Solutions. All rights reserved.

## Acknowledgements

- [Mention any acknowledgements or credits for external resources used in the project]
- [Dart Style Guide](https://dart.dev/effective-dart/style)
- [Flutter Style Guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo) 
- [Material-UI-color-schema](https://m3.material.io/theme-builder#/custom)
  

## Contact

For any inquiries or feedback, please contact [your email address].


