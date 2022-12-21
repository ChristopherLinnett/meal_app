# meal_app

Meals App. Completed as part of a Flutter tutorial with Academind on Udemy

## Getting Started

This project shows the outcome of the Meals App within the tutorial which reads dummy data about different meals and categories they exist within. 
It then sorts them based on categories generated from this information file, and gives options such as favouriting etc.

The main purpose of this project was to highlight navigation options, including pushing routes. Pushing Named routes. Popping. Sending data back when popping.
Tab bars, and using these for navigating. Then finally the app drawer.

The state of this app was passed screen to screen instead of using another state management option, this will cause extra screen rebuilds costing performance, but due to the small scale of this app. It will not be noticable. Especially when passing the filters back to the main page, then to the main data structure.

I also added the cached_network_image library to make the loading of images appearance both more appealing and only happen once on each run of the app.
