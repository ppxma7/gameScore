# gameScore

<img src="https://github.com/ppxma7/gameScore/blob/master/gSv3.png" width="250">

### Set of functions to produce data-driven, personalised metrics on video games.

- Initially, we wanted to find an objective way to rank video games, then find a metric based on adding a bit of subjectivity to this.
- We have a set of rankings that should be consistent across people, e.g. we should all agree that The Last Of Us has a Narrative parameter of 1.0 (from 0 to 1). This is called the *Structure* parameter.
- Additionally, there is a *Performance* parameter, that weights the Structure parameter, e.g. while the Last of Us had a very strong narrative structure, its implementation may not have been perfect (plot holes, Ellie being a bit silly, etc.) giving it a Performance of 0.9.
- Then, these are both modulated by a set of personal, global player *weights* based on their experience of the game.
- Sticking these into a formula (very roughly), produces a metric. The most basic formula just takes a weighted mean of all the above.

#### Developed by Jim Smith and Michael Asghar
