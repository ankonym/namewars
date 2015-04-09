#NAME WARS!

This is mainly an app to test out the things I've learned studying Ruby on Rails so far, and it also tries to help solve a problem I discovered when talking to friends: With all the things to consider when expecting a child, how in the world is one to pick the best possible name for the future baby? 
Well, with an app, of course. :) It's sort of inspired by kittenwar.com, in that you are presented with two randomly picked names from list of the most popular first names from the past years, and have to choose one. 
May the best name win!

#What it does so far

- Lets you choose between either girls' or boys' names
- Displays a randomly chosen pair of names that compete against each other
- Lets you take names out of the voting that you will never choose (e.g. because they are already taken in your family)
- Will eliminate names that have lost a certain number of rounds, will reward others that have won a certain number of rounds without losing
- Displays the ranking as well as lists of all eliminated names
- Has a counter of all votes cast so far, and the total number of names
- Pretty (?) CSS styling

#What's left to do

- Ideally, user management so several people can start their own voting
- Compare lists with other users or compile a master list from several voters
- Add a last name of the user's choice to get an even better idea of the name
- The logic can be improved, it's a bit clumsy
- A "winner" logic (how many rounds until there's a final ranking?)
- I don't think my code is very elegant :) For now I'm proud it works at all but I think there may be too much logic in my view 