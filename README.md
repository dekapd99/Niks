<!-- ABOUT THE PROJECT -->
<h1 align="center">
  <br>
    <a href="#" target="_blank"><img src="logo.png" width="400"></a>
  <br>
  <p>Niks</p>
</h1>

<h4 align="center">Niks are made with <a href="https://developer.apple.com/swift/" target="_blank">Swift 5</a> & <a href="https://figma.com" target="_blank">Figma</a>.</h4>

<p align="center">
  <a href="#about">About</a> •
  <a href="#preview">Preview</a> •
  <a href="#installation">Installation</a> •
  <a href="#features">Features</a> •
  <a href="#contributors">Contributors</a> •
  <a href="#license">License</a>
</p>

# About
Niks is an app that we crafted to empower academy fellow learners to build a habit that will relax their minds and body to help them fall asleep faster. Many of them, just like Bobby, are overwhelmed by their daily activities, thus making them unable to easily fall asleep. Our app will show you a variety of animation and pleasing visuals, with seamless flow and easy control for the user to use.

### Preview
<p align="center">
  <a href="#" target="_blank"><img src="preview.gif"></a>
</p>

<!-- ABOUT THE FILE & FOLDER STRUCTURE -->
## Folder & File Structure
Here is the file and folder structure for Niks:

    .
    ├── Assets                              # Contains Colors, Logo & Images
    ├── Shared                              # Contains Watch Connectivity Manager
    ├── Audio                               # Contains Audio Files for Apps Default Music
    ├── NiksWatch Watch App                 # Contains Niks Watch Apps
    ├── NiksApp                             # Contains Niks Root Project
    ├── ContentView                         # Contains Preview Page Logic with HomeView
    ├── Component                           # Contains Reusable & Recyclable Components
    │   ├── BubbleDialogueComponent.swift
    │   ├── BubblePopupComponent.swift
    │   ├── LoadingComponent.swift
    │   ├── SidebarComponent.swift
    │   └── TimerComponent.swift                 
    │
    ├── Core                                # Contains Constant & Custom Modifier
    │   ├── BackButtonStyle.swift
    │   ├── ButtonStyle.swift
    │   ├── EffectStyle.swift
    │   ├── FontStyle.swift
    │   ├── IconStyle.swift
    │   ├── ImageStyle.swift
    │   └── Constant
    │       ├── Constant.swift
    │       ├── Dialogues.swift
    │       └── Shapes.swift             
    │
    ├── Model                               # Contains Data & Their Type for Each Content
    │   ├── AnimatorModel.swift       
    │   ├── AudioPlayerModel.swift      
    │   └── MusicModel.swift       
    │
    ├── ViewModel                           # Contains Reusable General Function
    │   └── AnimatorViewModel.swift
    │
    └── View                                # Contains Reusable Main Apps View
        ├── StretchPreview.swift
        ├── LoadingView.swift
        ├── GetReadyView.swift
        ├── TutorialView.swift
        ├── StretchingView.swift
        ├── HomePageView.swift
        ├── SleepView.swift    
        ├── SplashScreenView.swift    
        └── TotallySleepView.swift          

<!-- List of Features -->
# Features:

* Yoga (Ujayyi Breath Method)
* Yoga Tutorial Movement
* Voice Over Yoga Tutorial
* Interactive Sleeping Music and Background
* Sleep Notifications (Daily Sleep Reminder at 10.00 P.M.)
* Yoga Countdown Timer
* Interactive Progress Bar
* Interactive Character & Object
* Shimmering & Pulse Animation Object
* Close the Apps Automatically after 15 Minutes
* Reusable Components
* All Stacks (HStack, VStack, ZStack)
* Custom Modifier (Extension)
* User Notifications Permission
* Watch Connectivity
* AVKit for Apps Default Music
* Splash Screen
* Animation Sequence (PNG Sequence)

<!-- Used Tools -->
## Build With

* [Swift](https://www.swift.org/documentation/)
* [SwiftUI](https://developer.apple.com/documentation/swiftui/)
* [Xcode](https://developer.apple.com/xcode/)
* [Figma](https://www.figma.com/)

<!-- Contributors -->
## Contributors

| Name | Roles |
| --- | --- |
| [Adriel Bernard Rusli](https://github.com/Adrielrusli) | Fullstack Developer |
| [Abner Edgar](https://github.com/AbnerEdgar) | Fullstack Developer |
| [Bobby Sugiharto](https://github.com/bobbysaa) | Animator & UI / UX Designer |
| [Deka Primatio Deandra](https://www.github.com/dekapd99) | Fullstack Developer |
| [Millennian Ibnu Adriansyah Karinda](https://github.com/Adriankrnd) | Animator & UI / UX Designer |
| [Rachmaniar Larasati](https://github.com/niarlaras10) | Project Manager |

<!-- How to Install -->
# Installation
To use this repository, please follow the usage instructions below and make sure that Git is installed on your computer (execute all commands in cmd.exe or terminal):

1. Download the .zip file or clone the repository using the following command:
```bash
git clone https://github.com/dekapd99/Niks.git
```

2. Once the project is downloaded or cloned, open the project in Xcode by clicking on "Open a Project or File".

3. Make sure to select iPad as the target simulator (Device column at the top of Xcode).

4. Build and Run the project.

<!-- What Kind of License? -->
# License
MIT License: Copyright (c) 2022

DISCLAIMER: ASSETS ARE USED FOR EDUCATION PURPOSE ONLY, NOT FOR COMMERCIAL PURPOSES

Assets Source: [SF Symbols 4 Icon](https://developer.apple.com/sf-symbols/)

Figma Projects: [Niks Figma](https://www.figma.com/file/n8fhBUJc7Y4XWuvc83zUVZ/Mini-Challenge-1?type=design&node-id=0%3A1&t=wG3k42XnGWk3ohSh-1)

<p align="right">(<a href="#about">back to top</a>)</p>
