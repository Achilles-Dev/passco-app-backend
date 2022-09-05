![](https://img.shields.io/badge/Microverse-blueviolet)

# WASSCE PAST QUESTIONS APP BACKEND

> This is the backend of the WASSCE Past Questions App. It is a Rails API that serves the frontend of the app.

## Built With
- Ruby
- Ruby on Rails
- PostgreSQL

## Getting Started
To get a local copy up and running follow these simple example steps.

### Prerequisites
- Ruby
- Ruby on Rails
- PostgreSQL

### Setup
  Clone the repository
  ```
  git clone https://github.com/Achilles-Dev/passco-app.git
  ```

  ```
  cd passco-app
  ```

Setup the development and the test databases:
  ```
  rails db:create
  ```
  ```
  rails db:migrate
  ```
### Install
  Install the gems:
   ```
   bundle install
   ```

### Usage
  To run the server use:
   ```
   rails s
   ```

### Run tests
  Run tests to generate the api documentation:
   ```
   rake rswag:specs:swaggerize
   ```

## Authors

👤 **Solomon Hagan**

- GitHub: [@Achilles-Dev](https://github.com/Achilles-Dev/)
- Twitter: [@SoloAchilles](https://twitter.com/SoloAchilles/)
- LinkedIn: [Solomon Hagan](https://www.linkedin.com/in/solomon-hagan/) 

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
