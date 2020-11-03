<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/lzxindustries/alphabet">
    <img src="resources/icon128.png" alt="LZX Industries Logo" width="128" height="128">
  </a>

  <h3 align="center">Alphabet</h3>

  <p align="center">
    Alphabet is a cross-platform desktop application for managing serial communication between the desktop environment and embedded hardware devices.
    <br />
    <a href="https://lzxindustries.github.io/alphabet"><strong>Explore The Documentation »</strong></a>
    <br />
    <br />
    <a href="https://github.com/lzxindustries/alphabet/issues">Report Bug</a>
    ·
    <a href="https://github.com/lzxindustries/alphabet/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

- [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project

Alphabet was written to serve as a cross-platform application for firmware upgrade and testing of LZX Industries hardware devices. We'd like to share our work with others who have a need for such a cross-platform application.

Alphabet is built on a multi-component installer, so it is intended to serve as a single application to manage multiple expansion components, and serve user upgrades without requiring the download and installation of a new package.

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Qt 5.14.2
* Qt Installer Framework 3.2.2
* CMake 3.16

### Installation

1. Clone
```sh
git clone https://github.com/lzxindustries/alphabet.git
```

2. Build
```
cd alphabet
mkdir build
cd build
cmake --build .
```

<!-- USAGE EXAMPLES -->
## Usage

_For more examples, please refer to the [Documentation](https://lzxindustries.github.io/alphabet)_

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/lzxindustries/alphabet/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the GNU GPL v3. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

The LZX Team - support@lzxindustries.net - [https://www.lzxindustries.net](https://www.lzxindustries.net)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [starlingcode/viaflash](https://github.com/starlingcode/viaflash)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/lzxindustries/alphabet.svg?style=flat-square
[contributors-url]: https://github.com/lzxindustries/alphabet/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/lzxindustries/alphabet.svg?style=flat-square
[forks-url]: https://github.com/lzxindustries/alphabet/network/members
[stars-shield]: https://img.shields.io/github/stars/lzxindustries/alphabet.svg?style=flat-square
[stars-url]: https://github.com/lzxindustries/alphabet/stargazers
[issues-shield]: https://img.shields.io/github/issues/lzxindustries/alphabet.svg?style=flat-square
[issues-url]: https://github.com/lzxindustries/alphabet/issues
[license-shield]: https://img.shields.io/github/license/lzxindustries/alphabet.svg?style=flat-square
[license-url]: https://github.com/lzxindustries/alphabet/blob/master/LICENSE
[product-screenshot]: images/screenshot.png