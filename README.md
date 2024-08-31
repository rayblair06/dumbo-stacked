
# Dumbo Stacked

<div align="center">

![License](https://img.shields.io/github/license/rayblair06/dumbo-stacked)
![Issues](https://img.shields.io/github/issues/rayblair06/dumbo-stacked)
![Forks](https://img.shields.io/github/forks/rayblair06/dumbo-stacked)
![Stars](https://img.shields.io/github/stars/rayblair06/dumbo-stacked)

</div>

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

## About the Project

A micro-framework built on top of [Dumbo](https://github.com/notrab/dumbo).

### Built With

- [Dumbo](https://github.com/notrab/dumbo)
- [FrankenPHP](https://frankenphp.dev/)
- [Latte](https://latte.nette.org/en/)
- [PHP-DI](https://php-di.org/)

## Features

- Routes can be added to [routes/web.php](routes/web.php)
- Controllers can be added to [app/Http/Controllers](app/Http/Controllers).
    - See [IndexController.php](app/Http/Controllers/IndexController.php) and [ApiController.php](app/Http/Controllers/ApiController.php) for examples of rendering content and JSON.
- Container definitions can be added to [app/config/definitions.php](app/config/definitions.php)


## Installation

### Prerequisites

- Composer
- Docker

### Installation Steps

1. Clone the repository:
    ```bash
    git clone https://github.com/rayblair06/dumbo-stacked.git
    ```
2. Navigate to the project directory:
    ```bash
    cd dumbo-stacked
    ```
3. Build image:
    ```bash
    make build
    ```
4. Start the development server:
    ```bash
    make start
    ```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you'd like to contribute, please follow these steps:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Alternatively, check out the issues tab for tasks that need to be done.

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

## Contact

Ray Blair - rayblair06@hotmail.com

Project Link: [https://github.com/rayblair06/dumbo-stacked](https://github.com/rayblair06/dumbo-stacked)
