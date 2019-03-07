
#README

Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.

#What it does
Welcome to the Ride Pricer! The worlds best ride-share price comparison program. 
Ride Pricer takes in desired ride locations and compares prices estimates between two of the largest ride-share applications.

Features:

New Estimate Comparisons
A user can create a new ride in order to compare "real-time" price estimates of various ride types and services. The comparison data includes low to high price estimates across the available ride product types at the time Ride Pricer is run.

Estimate analysis
Estimates can be stored and analyzed by specific rides or by the ride product type.

CRUDing Location and Ride favorites
Location addresses can be favorited for a history of common locations and locations can be viewed and deleted. 

#How it works

New Estimate Comparisons
A user enters new addresses as a string and Ride Pricer will map the latitude and longitude through the geocoder gem. Locations are persisted, called, and updated through these coordinates.

Estimate analysis
Ride Pricer runs and stores price estimate data from the service apis. A user can retrieve this data by product type or ride addresses.

CRUDing Location and Ride favorites
New locations are persisted to database when a user enters them in to generate new rides.

#How do I install/use it
Fork and clone this repository. Run bundle install. Add your personal api keys into the appropriate files. Then just follow the menu instructions!

#Contributors guide
We've made adding menu application functionality easy!

#Future Enhancements
Allow for user oauth for more accurate estimates and user history persistence.
Ride estimate data analytics (lowest cost, fastest rides, etc.)


<!-- #Ride Pricer Project Planning

User Stories
- [x] A user should be able to enter an address and retrieve a nicely formatted set of price estimates
- [x] A user should be able to compare prices between lyft and uber for rides
- [x] A user should be able to evaluate historical price comparisons between lyft and uber
- [x] A user should be able to see previous rides
- [x] A user should be able to see a list of locations
- [X] A user should be able to update a list of locations
- [x] A user should be able to exit out of the
    - [x] previous rides
    - [x] locations
    - [x] estimate page
- [x] A user should be able to favorite locations
- [x] A user should be able to remove favorites (waiting on bugs)
- [X] A user should be able to favorite rides

Bonus User Stories:
- [x] A user should be able to compare Lyft and uber prices
  - [ ] format into columns
- [ ] A user should be able to choose “optimized estimates”
- [ ] Use a user oauth to get real estimates
- [ ] A user should be able to enter in the name of a location and get address options
- [ ] Implement unit testing

Steps for each user story:
- [ ] CLI UX Designed
- [ ] CLI Database Interaction Designed
- [ ] Any other methods that are obvious
- [ ] CLI Coded
- [ ] Database Coded
- [ ] Changes Code Reviewed by Partner
- [ ] Changes Merged

Enhancements:
- [x] Add delete favorite
- [ ] Add delete location
- [X] View ride history by type
    - [X] by route
- [ ] Least expensive ride
- [ ] Most expensive ride
- [ ] Longest ride
- [ ] Shortest ride
- [ ] Avg estimate
- [ ] Add number functionality to select ride from previous locations

Bonus Design:
- [X] Tali - Each menu takes up window
- [ ] Tali - Each menu has a title
- [ ] Ryan - Loading ux into other place
- [X] Ryan - Graphics or colors (bgimg)
- [] Format the estimates
Optional optional:
    - [ ] Nice logo
    - [ ] Sounds

Bug List:
- [ ] View route shows route twice
- [ ] Force number entry on new ride if show locations
- [X] Database locations show correct names but ride name has blanks
- - [X] catch menu errors - user cannot enter number above available options
  - [X] Fix on all menus
- [x] If geocoder has slightly different lat/long
- [x] fix view rides - not showing ride name
  - [x] also want to rework this feature in general
- [x] Multiple puts of view locations after trying to remove a favorite
- [x] Tali - Handle errors when geocoded address doesn’t work
- [X] Ryan - Handle errors when we get an abnormal uber api response
    - [X] More than 100 miles
- [X] View locations (make the list one list and the entries unique)
# -->

# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.

4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
