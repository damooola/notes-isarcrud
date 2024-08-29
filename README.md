
# Notes Application with Isar Database

## Overview

This project is a simple Notes application that allows users to create, read, edit, and delete notes using the Isar database. This application serves as a practical example of how to implement basic CRUD (Create, Read, Update, Delete) operations with Isar, a high-performance NoSQL database for Flutter.

## Features

- Create new notes
- Read existing notes
- Edit notes
- Delete notes
- Storage using Isar database

## Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK (version 2.0 or higher)
- Dart SDK (version 2.12 or higher)
- Isar package (latest version)

## Getting Started

### Installation

1. Clone this repository to your local machine:
git clone <https://github.com/damooola/notes-isarcrud.git>
   cd notes-app
2. Install the dependencies:
flutter pub get

### Setting Up Isar

1. Add the Isar package to your  `pubspec.yaml` :
dependencies:

   - isar: ^latest_version
   - isar_flutter_libs: ^latest_version^
   - path_provider: ^latest_version
   - provider: ^latest_version

dev dependencies:

- build_runner: ^latest_version
- isar_generator: ^l/atest_version

2. Create your Isar model for the notes:

`sh`
   import 'package:isa/isar.dart';

   part 'note.g.dart';

   @Collection()
   class Note {
     Id id = Isar.autoIncrement;

     late String text;
   }
3. Run the build command to generate the necessary Isar code:
flutter pub run build_runner build

### Usage

1. **Create a New Note**: Use the provided UI to input the title and content of your note. Click the "Create" button to save it to the database.

2. **Read Notes**: The app will display a list of all saved notes. You can click on any note to view its details.

3. **Edit a Note**: Select a note from the list, make changes to the title or content, and click the "Update" button to save your changes.

4. **Delete a Note**: To remove a note, select it and click the "Delete" button. Confirm the deletion to remove it from the database.

### Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.

### License

This project is licensed under the MIT License.

## Acknowledgments

- [Isar Database](https://isar.dev/) for providing a powerful and efficient database solution.
- [Flutter](https://flutter.dev/) for enabling beautiful and fast mobile applications.
