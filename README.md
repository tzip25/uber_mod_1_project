
# README

Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.

## What it does
Welcome to the Ride Pricer! The worlds best ride-share price comparison program.
Ride Pricer takes in desired ride locations and compares prices estimates between two of the largest ride-share applications.

## Features:

### New Estimate Comparisons
A user can create a new ride in order to compare "real-time" price estimates of various ride types and services. The comparison data includes low to high price estimates across the available ride product types at the time Ride Pricer is run.

### Estimate analysis
Estimates can be stored and analyzed by specific rides or by the ride product type.

### CRUDing Location and Ride favorites
Location addresses can be favorited for a history of common locations and locations can be viewed and deleted.

## How it works

### New Estimate Comparisons
A user enters new addresses as a string and Ride Pricer will map the latitude and longitude through the geocoder gem. Locations are persisted, called, and updated through these coordinates.

### Estimate analysis
Ride Pricer runs and stores price estimate data from the service apis. A user can retrieve this data by product type or ride addresses.

### CRUDing Location and Ride favorites
New locations are persisted to database when a user enters them in to generate new rides.

## How do I install/use it
Fork and clone this repository. Run bundle install. Add your personal api keys into the appropriate files. Then just follow the menu instructions!

## Contributors guide
We've made adding menu application functionality easy!

## Future Enhancements
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
- [x] Add number functionality to select ride from previous locations

Bonus Design:
- [X] Tali - Each menu takes up window
- [x] Tali - Each menu has a title
- [ ] Ryan - Loading ux into other place
- [X] Ryan - Graphics or colors (bgimg)
- [] Format the estimates
Optional optional:
    - [ ] Nice logo
    - [ ] Sounds

Bug List:
- [x] View route shows route twice
- [x] Force number entry on new ride if show locations
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
