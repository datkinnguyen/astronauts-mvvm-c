# Astronauts

This is a demo project for a Technical Assessment. Details are listed below:

**Requirements/Implementation details**

-   On app launch, consume **_GET http://spacelaunchnow.me/api/3.5.0/astronaut/_**
-   When the data is retrieved, display the results in a list.
-   Display at a minimum: **_name, nationality and profile_image_thumbnail_**
-   Implement a button at the top of the screen which will allow the user to sort the results based on the **_name_** property.
-   On tap of an individual list item, consume **_GET http://spacelaunchnow.me/api/3.5.0/astronaut/<astronautId>_**  to retrieve more details about the item and navigate to a new screen which displays the results appropriately.
-   Display all previous information + at a minimum: **_bio and date_of_birth_**

**Support/Notes**
-   No need to paginate the astronaut list
-   iOS – Min iOS (13), Xcode (12.X) and UIKit
 
 ----
This application is written in Swift, following a mix of MVVM and Coordinator pattern. MVVM makes make the source code easier to read and most importantly easier to unit test. Coordinator pattern is used to help with navigation. 

## Implementation details
- Deployment Target: iOS 13+
- Xcode 13.2.1
- Swift 5.5.2
 
 ## Instalaltion
 - There's no libraries/pods, just download the source code or check out using git, you should be able to open Xcode project and Run right away.

## About the app
![Home page](https://i.ibb.co/wzwVy8F/Simulator-Screen-Shot-i-Phone-13-Pro-Max-2022-01-14-at-07-15-59.png)
![Detail page](https://i.ibb.co/CVRtYnB/Simulator-Screen-Shot-i-Phone-13-Pro-Max-2022-01-14-at-07-16-05.png) 


- First screen is List Astronauts with tableView and pull-to-refresh
- Able to sort astronauts by name A->Z and Z->A
- Tapping one astronaut cell will open Astronaut Detail screen
- There are network requests in both screens to load list and load detail. If network requests fail, error message shows up on screen
- Images are loaded asynchronously in the background, and are rounded on the UI
- Detail screen supports scrolling to support long content
- App is localisation-ready
- Comes with App Icon (credit icon to https://dribbble.com/shots/12071145-Astronaut-Icon)

## Highlights
- Source code is organised as per MVVM/Coordinator patterns which group by layer: Coordinator, Network, View, Model, ViewModel
- Protocol-oriented is followed wherever possible
- Binding between ViewModel and ViewController using a simple Observable pattern
- Each ViewController has its own Storyboard to better manage and avoid merging conflict in the future
- ViewModels and Repository are unit-tested, coverage of project: 52.5%
- Custom-built Network Layer handling requests, response and error parsing.
 
 ## Limitations / Future improvements
 Due to time constraints, a few areas could be improved:
 - Potentially use SDWebImage or build custom Image Cache to download and cache image
 - UI could be polished further
 - Data source http://spacelaunchnow.me could potentially cause security issue, should use a https host
 
## Contact
Any feedback or questions, feel free to drop me an email to datkin.nguyen@gmail.com.

Cheers!
