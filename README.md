---
  tags: forms, nested forms
  languages: ruby, html
  resources: 2
---

# Pirates!

## Description

In this lab, you'll practice using nested forms in Sinatra.

## Instructions

- Note: YOU DO NOT NEED A DATABASE, we just need to keep track of the forms input long enough to display it, not persist it.  I don't expect the pirate to be there the next time I come to his URL, but it'd be cool if he was.

- Decide what objects/models you want to use, I used pirates and ships, you can use this or anything else.

- Other examples: Artists and Songs, Programmers and Languages they know, Schools and Students

- Make a nested form (this should probably have html `<label>`s so it makes sense to a user).

- After a user clicks submit they should be taken to a page that displays all the information we just posted from the form.  In my example I'd have a page that showed the pirate I created along with his ships and all the details about the pirate and his ships.

- I'm intentionally being vague about exactly what routes you need or how to set this all up.  We can all review together how you structured your routes and talk about the postives and negatives.  Do what you think makes the most sense.  Follow REST conventions.  Use the internet to figure it out if need be.

- This is an excercise in REST conventions, HTML forms and params.  Please use the debugger and/or puts to see how changing the type of HTML you use changes the params. Spend some time thinking about your routes.

## Example

Often in web application development you'd like to have a form that will update multiple related objects at once.

Let's say we're building a web application that had pirates and ships.

When we create a typical form we can do something like this where pirate is the class of the object we are working with.

```html
<form action='/pirates' method="POST">
  <input ... name="pirate[name]" />
  <input ... name="pirate[weight]" />
  <input ... name="pirate[height]" />
  <input type="submit" value="submit">
</form>
```

On the sinatra side we'd have some routes like

```ruby
post '/pirates' do
  @pirate = Pirate.new
  @pirate.name = params[:pirate][:name]
  @pirate.weight = params[:pirate][:weight]
  @pirate.height = params[:pirate][:height]
  @pirate.save
end
```

This would create a new pirate in our database (assuming we're using the student ORM we built)

What if pirates also had ships! Could we create a pirate and a ship at the same time?

Let's say ships have names, types, and booty

```html
<form action='/pirates' method="POST">
  <input ... name="pirate[name]" />
  <input ... name="pirate[weight]" />
  <input ... name="pirate[height]" />
  <input ... name="pirate[ships][0][name]" />
  <input ... name="pirate[ships][0][type]" />
  <input ... name="pirate[ships][0][booty]" />
  <input ... name="pirate[ships][1][name]" />
  <input ... name="pirate[ships][1][type]" />
  <input ... name="pirate[ships][1][booty]" />
  <input type="submit" value="submit" />
</form>
```

```ruby
post '/pirates' do

  <!-- try dropping the debugger in here and seeing what the params hash is -->

end
```

```
As you can see we constructured a nice data structure for ourselves
pirate
    name
    weight
    height
    ships
        0
            name
                dawn treader
            type
                wood
            booty
                so much
        1
            name
                mayflower
            type
                wood
            booty
                not very much
```

## **BONUS**

1. Spec this out.
2. Back the whole thing with a database using ActiveRecord
3. Convert it into a modular-style Sinatra application (e.g., with an ApplicationController and a PiratesController)
## Resources
* [Surreal Detective](http://surrealdetective.github.io/) - [The Nested Ruby Params Hash for Complex HTML Forms and Sinatra](http://surrealdetective.github.io/blog/2013/07/01/the-nested-ruby-params-hash-for-complex-html-forms-and-sinatra/)
* [Sinatra: The Book](http://sinatra.restafari.org/book.html) - [Handling of Rails like nested params](http://sinatra.restafari.org/book.html#handling_of_rails_like_nested_params)
