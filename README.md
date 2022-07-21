## **Irohasu - Learn Flutter**

# About

Building a manga reader app on the process of learning bloc. Project unfinished.

# Demo

|             Library Screen              |             Detail Screen              |
| :------------------------------------:  | :------------------------------------: |
| ![library tab](.github/readme-images/library.png) | ![manga detail screen](.github/readme-images/MangaDetails.png) | |

|             Search Screen             |           Vertically Screen            |          Horizontally Screen           |
| :-----------------------------------: | :------------------------------------: | :------------------------------------: |
| ![search_advanced](.github/readme-images/search.png) | ![list_chapter](.github/readme-images/chapter.png) | ![webtoon mode](.github/readme-images/webtoon.png) |

## Download

Get the app from our [releases page](https://github.com/viviethoang99/irohasu/releases).

## Installation

- Check if you are in the beta channel of flutter SDK and the version v2.17.0 or higher. [Instruction to change flutter channel](https://github.com/flutter/flutter/wiki/Flutter-build-release-channels#how-to-change-channels).
- Clone the repo

  ```sh
  git clone https://github.com/viviethoang99/convert_link.git
  ```

- And then we can use the normal build and run procedure

  ```sh
  flutter pub get
  flutter run
  ```

- Some files like `*.freezed.dart`, `*.g.dart`, `*.iconfig.dart` are auto generated. If there is any issue from these files just run this command to regenerate them.

  ```sh
  flutter pub run build_runner watch --delete-conflicting-outputs
  ```

# Disclaimer

The developer of this application does not have any affiliation with the content providers available.
