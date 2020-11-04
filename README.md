<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![Automated Release Notes by gren](https://img.shields.io/badge/%F0%9F%A4%96-release%20notes-00B2EE.svg)](https://github-tools.github.io/github-release-notes/)

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/lzxindustries/lzxconsole">
    <img src="src/resources/package/images/icon128.png" alt="LZX Industries Logo" width="128" height="128">
  </a>

  <h3 align="center">LZX Console</h3>

  <p align="center">
    LZX Console is a cross-platform desktop application for managing serial communication between the desktop environment and embedded hardware devices.
    <br />
    <a href="https://lzxindustries.github.io/lzxconsole"><strong>Explore The Documentation »</strong></a>
    <br />
    <br />
    <a href="https://github.com/lzxindustries/lzxconsole/issues">Report Bug</a>
    ·
    <a href="https://github.com/lzxindustries/lzxconsole/issues">Request Feature</a>
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

LZX Console was written to serve as a cross-platform application for firmware upgrade and testing of LZX Industries hardware devices. We'd like to share our work with others who have a need for such a cross-platform application.

LZX Console is built on a multi-component installer, so it is intended to serve as a single application to manage multiple expansion components, and serve user upgrades without requiring the download and installation of a new package.

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
git clone https://github.com/lzxindustries/lzxconsole.git
```

2. Build
```
cd lzxconsole
mkdir build
cd build
cmake --build .
```

<!-- USAGE EXAMPLES -->
## Usage

_For more examples, please refer to the [Documentation](https://lzxindustries.github.io/lzxconsole)_

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/lzxindustries/lzxconsole/issues) for a list of proposed features (and known issues).

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
[contributors-shield]: https://img.shields.io/github/contributors/lzxindustries/lzxconsole.svg?style=flat-square
[contributors-url]: https://github.com/lzxindustries/lzxconsole/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/lzxindustries/lzxconsole.svg?style=flat-square
[forks-url]: https://github.com/lzxindustries/lzxconsole/network/members
[stars-shield]: https://img.shields.io/github/stars/lzxindustries/lzxconsole.svg?style=flat-square
[stars-url]: https://github.com/lzxindustries/lzxconsole/stargazers
[issues-shield]: https://img.shields.io/github/issues/lzxindustries/lzxconsole.svg?style=flat-square
[issues-url]: https://github.com/lzxindustries/lzxconsole/issues
[license-shield]: https://img.shields.io/github/license/lzxindustries/lzxconsole.svg?style=flat-square
[license-url]: https://github.com/lzxindustries/lzxconsole/blob/master/LICENSE
[product-screenshot]: images/screenshot.png