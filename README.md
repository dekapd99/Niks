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
  <a href="#" target="_blank"><img src="1.png" width="200"></a>
  <a href="#" target="_blank"><img src="2.png" width="200"></a>
</p>

<!-- ABOUT THE FILE & FOLDER STRUCTURE -->
## Folder & File Structure
Here is the file and folder structure for Niks:

    .
    ├── Assets                              # Contains Colors, Logo & Images
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
    ├── Component                   
    │   ├── FruitCardComponent.swift        # Berisikan Komponen Fruit Onboarding Card (OnBoardingView)
    │   ├── StartButtonComponent.swift      # Berisikan Komponen Start Button (OnBoardingView)
    │   ├── FruitRowComponent.swift         # Berisikan Komponen Fruit Row (ContentView)
    │   ├── FruitHeaderComponent.swift      # Berisikan Komponen Fruit Header (FruitDetailView)
    │   ├── SourceLinkComponent.swift       # Berisikan Komponen Source Link (FruitDetailView)
    │   ├── FruitNutrientsComponent.swift   # Berisikan Komponen Fruit Nutrient Value (FruitDetailView)
    │   ├── SettingLabelComponent.swift     # Berisikan Komponen Settings Label (SettingsView)
    │   └── SettingRowComponent.swift       # Berisikan Komponen Settings Row (SettingsView)
    │
    └── View                     
        ├── OnBoardingView.swift            # Tampilan OnBoarding Page
        ├── Tutti_Fruity.swift              # Root Project: Konfigurasi ContentView
        ├── ContentView.swift               # Tampilan Home Page
        ├── FruitDetailView.swift           # Tampilan Detail Page for Each Fruit
        └── SettingsView.swift              # Tampilan Halaman Setting

<!-- List of Features -->
# Features:

* Yoga (Ujayyi Breath Method)
* Countdown Timer
* Interactive Progress Bar
* Reusable Components
* All Stacks (HStack, VStack, ZStack)
* Custom Modifier (Extension)
* User Notifications (Daily Notification at 10.00 P.M.)
* User Notifications Permission
* Shimmering & Pulse Animation Object
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

<p align="right">(<a href="#top">back to top</a>)</p>
