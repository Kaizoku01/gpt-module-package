# gpt-module-package

<!-- [![Pub Version](https://img.shields.io/pub/v/package_name)](https://pub.dev/packages/package_name)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/your_username/package_name.svg?branch=master)](https://travis-ci.org/your_username/package_name) -->

## Description

The Gpt Module Flutter Package provides a modular and streamlined way to interact with the ChatGPT API. This package is specifically designed to handle both image and text inputs for both GPT-3.5 and GPT-4. Currently, the package focuses on GPT-3.5 and GPT-4 for efficient communication with the ChatGPT models, reducing the amount of code required.

## Features

- Modular approach for using the ChatGPT API.
- Supports both image and text inputs.
- Streamlined communication with GPT-3.5 and GPT-4.
- Simplifies the process of interacting with ChatGPT models.

## Getting Started

### Installation

In your `pubspec.yaml` file, add:

```yaml
dependencies:
    gpt-module-package:
      git:
        url: git@github.com:Kaizoku01/gpt-module-package.git
        ref: stable
```

### Import
```dart
import 'package:gpt_module_package/gpt_module_package.dart';
```

### Configuration
Initialize the service by passing the apiKey through `OpenAiServiceManager` instance in main method.
```dart
  OpenAiServiceManager().initialize(apiKey: "API_KEY_HERE");
  ```

## Usage
```dart
/// input type : text
/// model : gpt 3.5 turbo
/// output : text
  Future<Response?> your_method() async {
    OpenAiServices service = OpenAiServices(model: ModelType.gpt3_5Turbo, prompt: "ask gpt here");
    return await service.requestAndGet();;
  }
  ```
  ```dart
  /// input type : text & local assest image
  /// model : gpt 4 vision preview
  /// output : text
Future<Response?> your_method() async {
    OpenAiServices service = OpenAiServices(model: ModelType.gpt4VisionPreview, prompt: "which god is in the image?",image: IMAGE_BYTES);
        return await service.requestAndGet();
  }
  ```
  ```dart
  ///convert image path to image bytes before requesting using below statement
  Uint8List bytes = await rootBundle.load('assets/images/god_image.jpg').then((ByteData data) => data.buffer.asUint8List());
  ```
  ```dart
  /// input type : text & network image
  /// model : gpt 4 vision preview
  /// output : text
Future<Response?> your_method() async {
    OpenAiServices service = OpenAiServices(model: ModelType.gpt4VisionPreview, prompt: "which god is in the image?",image: 'IMAGE_URL');
        return await service.requestAndGet();
  }
  ```
  - Note: When passing image as url no need for byte conversion.

## Contributing
If you want to contribute to this package, take a look at the open issues section.
If you think you have some other improvements feel free to fork and raise a pull request.

## License
This package is open source and available under the MIT License.

## About the Author
Use this package to be the king of developers.<br>

~ kaizoku01 <br>
peace out ✌️

[Linkedin](https://www.linkedin.com/in/sarvagya-saxena-513a841b6/)
<br>
[Email](kaizokusarvagya15@gmail.com)
