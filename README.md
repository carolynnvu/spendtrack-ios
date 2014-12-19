spendtrack-ios
==============

![alt text](https://github.com/carolynnvu/spendtrack-ios/blob/master/Spendtrack/Images.xcassets/AppIcon.appiconset/spendtrack_logo58.png "Logo Title Text 1")
A visual iOS expense tracker for your eyes' pleasure and wallet's adiposity.

iOS Programming Final Project

Author(s): Carolynn Vu, Christina Chan
Project Title: Spendtrack

* Implemented Features: The implemented features of our app include the ability to add and edit a purchase. The purchase will show up in a list format and a photo collection format. Tapping on a purchase in the list will provide information on the photo, and also the option to edit the purchase. We have implemented a login, and use of a database to store info. However, this has not been combined together with the rest of the UI yet.

### Overview
This iOS app is a visual tracker that allows users to keep track of their purchases. The user logs each purchase's cost as well as a photo of it. The app provides a collage, similar to a photo album/library. Also provided is a table view of all logged purchases along with the purchase photo. More expensive purchases will have their photos highlighted in “hotter” colors compared to those of less expensive purchases in the collage, which would be highlighted in “cooler” colors. The correlation between a purchase's cost and its highlight color will give a visual track of a user's spending pattern.

### Intended audience
Anyone who wants to record their spendings can use this app! Specifically, users that want a visual representation of their spendings that is more than just a text list or a standard pie graph. Spendtrack also provides a way for users to log daily activities with photos (thus having a detailed record of their life). 

### Technical challenges & needed resources
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

