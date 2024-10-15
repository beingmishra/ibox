<div align="center">

  <!-- Resized iBox Logo -->
  <img src="https://raw.githubusercontent.com/beingmishra/ibox/refs/heads/main/assets/images/ibox_logo.png" style="width: 50%; max-width: 300px;" />

<h2>iBox - Movie & TV Show Finder</h2>
  <p>iBox is an open-source app that uses the <a href="https://www.themoviedb.org/">TMDB API</a> to provide users with detailed information about movies and TV shows. With iBox, you can explore the latest releases, popular titles, and discover trending content. The app offers rich details about each movie or show, including cast information, plot summaries, ratings, and more, all in a clean and user-friendly interface. Built to deliver an engaging and informative experience, iBox is perfect for movie enthusiasts who want easy access to up-to-date entertainment data.</p>

  <br/>

  <!-- Social & Badge Links -->
  <a href="https://twitter.com/beingmishraOG">
    <img src="https://img.shields.io/badge/twitter-%231DA1F2.svg?&style=for-the-badge&logo=twitter&logoColor=white" />
  </a>

  <img src="https://img.shields.io/github/stars/beingmishra/ibox?style=for-the-badge&logo=powerpages&color=cba6f7&logoColor=D9E0EE&labelColor=302D41"/>
  <img src="https://img.shields.io/github/last-commit/beingmishra/ibox?style=for-the-badge&logo=github&color=a6da95&logoColor=D9E0EE&labelColor=302D41"/>
  <img src="https://img.shields.io/github/repo-size/beingmishra/ibox?style=for-the-badge&logo=dropbox&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41"/>

  <br/>

</div>

<!-- Added Margin Above Screenshots Row -->
<div align="center" style="margin-top: 20px;">

  <!-- Screenshots Row -->
  <img src="https://raw.githubusercontent.com/beingmishra/ibox/refs/heads/main/screenshots/1.png" style="width: 18%; margin: 5px;" />
  <img src="https://raw.githubusercontent.com/beingmishra/ibox/refs/heads/main/screenshots/2.png" style="width: 18%; margin: 5px;" />
  <img src="https://raw.githubusercontent.com/beingmishra/ibox/refs/heads/main/screenshots/3.png" style="width: 18%; margin: 5px;" />
  <img src="https://raw.githubusercontent.com/beingmishra/ibox/refs/heads/main/screenshots/4.png" style="width: 18%; margin: 5px;" />
  <img src="https://raw.githubusercontent.com/beingmishra/ibox/refs/heads/main/screenshots/5.png" style="width: 18%; margin: 5px;" />

</div>

## Getting Started

To get started with iBox, you'll need to configure the TMDB API key and build the project in Android Studio. Follow the instructions below to set up the app on your local machine.

### Prerequisites

- Android Studio
- Git
- A TMDB API key (Instructions for generating are below)

### Generating a TMDB API Key

1. Go to the [TMDB website](https://www.themoviedb.org/).
2. Create an account if you don’t already have one.
3. Navigate to the **API** section under your account settings: [TMDB API](https://www.themoviedb.org/settings/api).
4. Apply for an API key by following the instructions on the page. It should be approved instantly.
5. Copy your API key; you'll need this for the next step.

### Installing the Project

1. **Clone the repository**:
   ```git clone https://github.com/beingmishra/ibox.git```

2. **Open the project in Android Studio**:
   - Open Android Studio and select Open an existing project.
   - Navigate to the cloned repository folder and open it.
   
3. **Build and Run**:
   - Sync the project with Gradle by clicking Sync Now when prompted.
   - Build and run the app in Android Studio to see iBox in action!

4. **Running the App with API Key at Runtime**:
   Alternatively, you can use the --dart-define option to pass the API key at runtime.
In the terminal, use the following command to build and run the project:
```flutter run --dart-define=TMDB_API_KEY=YOUR_API_KEY_HERE```
Replace YOUR_API_KEY_HERE with your actual TMDB API key.


### Contributing
We welcome contributions from anyone interested in helping to improve iBox! Here’s how you can contribute:

  - Fork the repository.
  - Create a new branch for your feature or bug fix.
  - Make your changes.
  - Commit your changes with a clear message.
  - Push your branch and create a pull request.

If you find any bugs or have suggestions for new features, feel free to open an issue!