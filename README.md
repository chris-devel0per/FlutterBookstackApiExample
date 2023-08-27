# BookStackAPI Flutter/Dart Script Readme

This Flutter/Dart script demonstrates the usage of the BookStackAPI library to interact with a BookStack instance. The script showcases various functions available in the BookStackAPI library, allowing you to perform operations such as fetching books, chapters, and pages, creating new content, updating existing content, and more.

![Flutter](https://img.shields.io/badge/Flutter-%5E2.0.0-blue)
![Dart](https://img.shields.io/badge/Dart-%5E2.15.0-blue)
![BookStackAPI](https://img.shields.io/badge/BookStackAPI-%5E1.0.0-green)

## First of all: 

Check out Bookstack: [LINK TO BOOKSTACK](https://github.com/BookStackApp/BookStack)

## Getting Started

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/chris-devel0per/FlutterBookstackApiExample.git
   cd FlutterBookstackApiExample
   ```

2. Install Flutter and Dart if you haven't already. Follow the [official installation guide](https://flutter.dev/docs/get-started/install) for your platform.

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure the BookStackAPI settings:

   Open the `lib/controller/server_info.dart` file and provide your BookStack instance's base URL, API token, and other configuration details.

5. Run the script:

   ```bash
   flutter run
   ```

## Features

### Authentication

The script demonstrates how to authenticate with the BookStack API using your API token and make authenticated requests.

### Fetching Books, Chapters, and Pages

You can use the library to fetch a list of books, chapters within a book, and pages within a chapter. The script showcases how to retrieve this hierarchical content structure.

### Creating Content

Learn how to create new books, chapters, and pages using the BookStackAPI library. The script includes examples of creating various types of content.

### Updating Content

See how to update existing content such as book titles, chapter names, and page content.

### Deleting Content

The script demonstrates how to delete books, chapters, and pages. Be cautious when using this functionality, as it permanently removes content.

### Search

Learn how to perform search queries using the BookStackAPI library. The script showcases searching for books, chapters, and pages based on keywords.

### Attachments

Learn how to interact with the Attachments

### Image-Gallery

Learn how to interact with the Image-Gallery

### USER & ROLES

Learn how to manage users and Roles

### ATTENTION

These methods are <ins>!!!NOT!!!</ins> supported:


Recycle-Bin>restore


Recycle-Bin>destroy



Content-permissions>update

## Documentation

For more detailed information about the available functions and classes in the BookStackAPI library, refer to the official documentation provided with the library. You can find it [here](https://demo.bookstackapp.com/api/docs).

## Contributions

Contributions to this script and the associated documentation are welcome. If you find any bugs or have suggestions for improvement, please open an issue or submit a pull request on the GitHub repository.

## License

This script is released under the [MIT License](LICENSE).

---

Happy coding! If you have any questions or need assistance, feel free to reach out to the author at Discord (skiddybison5924).
