# A Simple [Battlesnake](http://play.battlesnake.com) Written in Julia

This is a basic implementation of the [Battlesnake API](https://docs.battlesnake.com/references/api). It's a great starting point for anyone wanting to program their first Battlesnake using Julia. It can also be deployed to [Heroku](https://heroku.com), or any other cloud provider you'd like.

### Technologies Used

* [Julia](https://julialang.org/)


## Prerequisites

* [Battlesnake Account](https://play.battlesnake.com)
* [GitHub Account](https://github.com) (Optional)

## Using a Cloud Provider

As your Battlesnake may gets complex and you may want to run it 24h/7, it might make sense to move it to a dedicated hosting provider such as Heroku or AWS. We suggest choosing a platform you're familiar with, or one you'd be interested in learning more about. You can do this by installing [julia](https://julialang.org/downloads/) and installing those two package requirement (Joseki, HTTP). Install package via julia package management. Example : import Pkg; Pkg.add("HTTP")

If you have questions or ideas, our developer community on [Slack](https://play.battlesnake.com/slack) and [Discord](https://play.battlesnake.com/discord) will be able to help out.

## (Optional) Running Your Battlesnake Locally

Eventually you might want to run your Battlesnake server locally for faster testing and debugging. You can do this by installing [julia](https://julialang.org/downloads/) and installing those two package requirement (Joseki, HTTP). Install package via julia package management. Example : import Pkg; Pkg.add("HTTP")

Then you can lauch your Battlesnake:
```shell
julia main.jl
```

**Note:** You cannot create games on [play.battlesnake.com](https://play.battlesnake.com) using a locally running Battlesnake unless you install and use a port forwarding tool like [ngrok](https://ngrok.com/).


**At this point your Battlesnake is live and ready to enter games!**



## Registering Your Battlesnake and Creating Your First Game

1. Sign in to [play.battlesnake.com](https://play.battlesnake.com/login/).

2. Go [here to create a new Battlesnake](https://play.battlesnake.com/account/snakes/create/). Give it a meaningful name and complete the form using the URL for your server info from above.

3. Once your Battlesnake has been saved you can [create a new game](https://play.battlesnake.com/account/games/create/) and add your Battlesnake to it. Type your Battlesnake's name into the search field and click "Add" to add it to the game. Then click "Create Game" to start the game.

4. You should see a brand new Battlesnake game with your Battlesnake in it! Yay! Press "Play" to start the game and watch how your Battlesnake behaves. By default your Battlesnake should move randomly around the board.

5. Optionally, watch your logs while the game is running to see your Battlesnake receiving API calls and responding with its moves.

Repeat steps 3 and 4 every time you want to see how your Battlesnake behaves. It's common for Battlesnake developers to repeat these steps often as they make their Battlesnake smarter. You can also use the "Create Rematch" button to quickly start a new game using the same Battlesnakes and configuration.

**At this point you should have a registered Battlesnake and be able to create games!**



## Customizing Your Battlesnake

Now you're ready to start customizing your Battlesnake's appearance and behavior.

### Changing Appearance

Locate the `index` function inside [main.jl](main.jl#L13). In that function you should see lines that looks like this:

```Julia
    apiversion = "1"
    author = ""  # TODO: Your Battlesnake Username
    color = "#888888"  # TODO: Personalize
    headType = "default"  # TODO: Personalize
    tailType = "default"  # TODO: Personalize
```

This function is called by the game engine periodically to make sure your Battlesnake is healthy, responding correctly, and to determine how your Battlesnake will appear on the game board. See [Battlesnake Personalization](https://docs.battlesnake.com/references/personalization) for how to customize your Battlesnake's appearance using these values.

Whenever you update these values, go to the page for your Battlesnake and select 'Refresh Metadata' from the option menu. This will update your Battlesnake to use your latest configuration and those changes should be reflected in the UI as well as any new games created.

### Changing Behavior

On every turn of each game your Battlesnake receives information about the game board and must decide its next move.

Locate the `move` function inside [main.jl](main.jl#L39). Possible moves are "up", "down", "left", or "right". To start your Battlesnake will choose a move randomly. Your goal as a developer is to read information sent to you about the board (available in the `req` variable) and decide where your Battlesnake should move next.

See the [Battlesnake Game Rules](https://docs.battlesnake.com/references/rules) for more information on playing the game, moving around the board, and improving your algorithm.

### Updating Your Battlesnake

After making changes to your Battlesnake, you can restart your snake to have the change take effect (or in many cases your snake will restart automatically).

Once the snake has restarted you can [create a new game](https://play.battlesnake.com/account/games/create/) with your Battlesnake to watch your latest changes in action.

**At this point you should feel comfortable making changes to your code and starting new Battlesnake games to test those changes!**



## Developing Your Battlesnake Further

Now you have everything you need to start making your Battlesnake super smart!

### Early Development Goals

Here are some simple goals to help you develop your Battlesnake early on. Completing these will make your Battlesnake competitive against other Battlesnakes in multi-player games.

- [ ] Avoid colliding with walls
- [ ] Avoid colliding with yourself
- [ ] Try to move towards food
- [ ] Avoid colliding with other snakes

Once you have completed these steps you'll be ready to compete live against other Battlesnakes and start exploring and implementing more complex strategies.


### Helpful Tips

* Keeping your server log/heroku open in a second window while games are running is helpful for watching server activity and debugging any problems with your Battlesnake.

* You can use the Julia [println function](https://docs.julialang.org/en/v1/base/io-network/#Base.println) to output information to your server logs. This is very useful for debugging logic in your code during Battlesnake games.

* Review the [Battlesnake API Docs](https://docs.battlesnake.com/references/api) to learn what information is provided with each command.

* When viewing a Battlesnake game you can pause playback and step forward/backward one frame at a time. If you review your logs at the same time, you can see what decision your Battlesnake made on each turn.



## Joining a Battlesnake Arena

Once you've made your Battlesnake behave and survive on its own, you can enter it into the [Global Battlesnake Arena](https://play.battlesnake.com/arena/global) to see how it performs against other Battlesnakes worldwide.

Arenas will regularly create new games and rank Battlesnakes based on their results. They're a good way to get regular feedback on how well your Battlesnake is performing, and a fun way to track your progress as you develop your algorithm.

---


### Questions?

All documentation is available at [docs.battlesnake.com](https://docs.battlesnake.com), including detailed Guides, API References, and Tips.

You can also join the Battlesnake Developer Community on [Discord](https://play.battlesnake.com/discord). We have a growing community of Battlesnake developers of all skill levels wanting to help everyone succeed and have fun with Battlesnake :)
