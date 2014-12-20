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

#### Technical challenges & needed resources
In creating this app, the challenges that we have faced thus far include figuring out how to reload new pictures as the user scrolls through the purchase photo library, how to reorganize the purchase photo library chronologically or by price, a feature to allow searching of purchases by a keyword, and how the user can interact with the photo library (tapping the photo for more information on the purchase). 

Another challenge is the app’s camera and where to store the photos. Our plan is to add a camera functionality so users can snap photos directly from within the app. The photo will be stored in the phone’s photo library. Right now this seems to be the simplest way to handle the issue of storage while still providing convenience. Furthermore, if at anytime the user deletes the photo from the photo library, the log’s photo will be replaced with a default image. 

### Overall logic and high-level flowchart:
```
User end
Enter purchase > Add photo and details > Purchase shows up in list and photo collection
Back end
User adds purchase > Purchase added to array > Photo added to collection
```

### Partners' responsibilities
We plan on splitting the work evenly. We will both work on the logic behind the app. Carolynn will focus on the scrolling view for the photo library. Christina will focus on the user interaction -  tapping a photo in the library will reveal information about the purchase.

### Projected features: 
Our plan is to have the following features in the app by the end of the semester: adding/removing an expense with a corresponding photo, having expense categories for each type of transaction (food, laundry, travel, etc.), displaying the total amount spent by month or year, including a list of purchases (when user is in portrait orientation), and an interactive photo library (when user is in landscape orientation). Photos in the photo library are highlighted with certain colors to provide a visual representation of cost. The purchase photo library may be organized chronologically by purchase date or, organized by cost.

### Additional features: 
If we pursue this project in the future, we would consider implementing the following additional features: a picture collage with each picture’s size proportional to the purchase’s price. This will give a visual comparison of different purchases and provides the user another way to see his/her spending patterns. We’d also like credit card integration where purchases made with credit cards are automatically logged for the user. Furthermore, we’d like to allow filters so that users can choose which type of purchases made with cards are actually logged. We’d also like to include more visual presentations like pie graphs as secondary displays as well as alert messages. 

