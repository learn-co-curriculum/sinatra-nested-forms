# Pirates!

## Description

In this lab, you'll practice using nested forms in Sinatra.

## Instructions

Note: YOU DO NOT NEED A DATABASE, we just need to keep track of the forms input long enough to display it, not persist it.  I don't expect the pirate to be there the next time I come to his URL, but it'd be cool if he was.

- Create a two classes, a `Pirate` class and a `Ship` class. Pirates should have a name, weight, and height. You will also need a class method that returns all the pirates. The ship class should have name, type, and booty attributes, as well as a class method that returns all the ships.

- Make a nested form (this should probably have html `<label>`s so it makes sense to a user). This form will be creating three objects (one instance of the Pirate class, and two instances of the Ship class). Remember, you'll need to build a corresponding controller action to load this page. Your form should POST to the route '/pirates'.

- After a user clicks submit they should be taken to a page that displays all the information we just posted from the form.  You should have a page that shows the pirate you created along with his ships and all the details about the pirate and his ships.

## Resources
* [Surreal Detective](http://surrealdetective.github.io/) - [The Nested Ruby Params Hash for Complex HTML Forms and Sinatra](http://surrealdetective.github.io/blog/2013/07/01/the-nested-ruby-params-hash-for-complex-html-forms-and-sinatra/)
* [Sinatra: The Book](http://sinatra.restafari.org/book.html) - [Handling of Rails like nested params](http://sinatra.restafari.org/book.html#handling_of_rails_like_nested_params)