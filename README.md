spendtrack-ios
==============

![alt text](https://github.com/carolynnvu/spendtrack-ios/blob/master/Spendtrack/Images.xcassets/AppIcon.appiconset/spendtrack_logo58.png "Logo Title Text 1")
Spendtrack: A visual iOS expense tracker for your eyes' pleasure and wallet's happiness.

#### Running the app on iOS Simulator 
- Clone the repo 
- Open the project in XCode
- Press Run > iOS Simulator

For server instructions, please see: [spendtrack-node](https://github.com/carolynnvu/spendtrack-node)

#### Overview
Spendtrack is an effective way to keep a visual track of all your purchases! Not only can you write down what you’ve purchased, but you can also add a photo of the purchase. This app will help you keep better tabs on how much you are really buying by letting you see everything you’ve bought. With just a few clicks, you’ll be on your way to wiser spending decisions and greater savings.
The app doesn’t just stop at letting you add photos. You can look back at the past week, month or year’s purchases chronologically or by cost. Expense categories are provided for your convenience. No longer do you have to read your expense logging like a collection of grocery lists; pictures do the job of a thousand words!

#### Intended audience
This app is for anyone who wants to record their spendings. Specifically, it's for users that want a visual representation of their spendings that is more than just a text-based list or a standard pie graph.

#### Implemented Features
* Add, edit, or delete logs
* Table view display
* Collection view display (photo gallery)
* Signing up and logging in

#### Overall logic and high-level flowchart:
```
##Frontend
Enter purchase > Add photo and details > Purchase is displayed in list and photo gallery
Backend
User adds purchase > Purchase added to user's purchase array  > Photo added to collection
```

#### Technical Challenges Faced 
* Building the photo gallery and table view
* Adding interactivity to both display options
* Connecting the user's photo library to the app 
* Adding database support 

#### Partners' responsibilities
Carolynn | Christina
------------ | -------------
Controller logic and Storyboard | Collection view interactivity
Collection view setup and display | Table view interactivity
Table view setup and display | Add purchase function
Photo library connection | Edit purchase function
Database support | Delete purchase function

#### Additional Features: 
Features we'd like to implement in the future:
* Display purchases by week, month, or year
* Activate table view on portrait orientation
* Activate photo gallery on landscape orientation 
* Sort photo gallery based on cost and chronologically
* Highlight photos with encoded colors 
* Secondary visual displays such as pie graphs 
* Credit card integration for automatic logging
* Functionalitly to filter displays 
