# Assignment

You can find the deployed application [here](https://sample-gmm.herokuapp.com/)

In this sample app I am developing a simple Gym Membership Management system allowing the following use cases:

It should allow users to create accounts. A user should be able to sign up either as a **member** or as a **club owner**; they should provide a valid email in order to be able to sign up.

Owners should be able to:
* Create only one _Club_
* Fill in their Club profile: Name (mandatory), Address.
* View list of affiliated members to their club.
* Remove members for their club.
* Create _Workouts_ for their Club.

Workouts are entities that have a title (mandatory), ex. “Back Shoulder workout”

Members should be able to:
* Fill in their profiles with last name, first name, birth date
* Select their affiliation club from list of existing clubs (mandatory)
* Update their profile
* Create and join their own workout OR join an existing workout from the club they are affiliated with.

# Comments

I have used this assignment as a markdown to develop the app. I have added some additional features just to test some functionality and when it made sense to be present.

The single pages design is not very consistent, but my idea was to play around with the Bootstrap options. On some places I could have used different Bootstrap options but I wanted to test how can I implement a specific feature rather than to create a state of the art front end design.

# TODO

1. Develop a bulletproof test suit!!! I really would have liked to use the whole red, green, refactor paradigm but it turned out to be kind of impossible to do it in the first app I develop by myself given the time I had to work on it.

2. I found out that my design of the workouts model is not very practical. It will be much more sensible solution to implement a workout_subscriptions model to handle well the workouts subscriptions. I believe this will be the best chance to use the snappy test suit I will develop. Also it only makes sense to do this kind of changes once I have adequate tests.

3. Implement some jquery magic regarding clubs following badge, and workouts buttons
