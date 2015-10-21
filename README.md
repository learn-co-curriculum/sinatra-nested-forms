

# Pirates!

## Description

In this lab, you'll practice using nested forms in Sinatra.

## Instructions

- Note: YOU DO NOT NEED A DATABASE, we just need to keep track of the forms input long enough to display it, not persist it.  I don't expect the pirate to be there the next time I come to his URL, but it'd be cool if he was.

- Make a nested form (this should probably have html `<label>`s so it makes sense to a user).

- After a user clicks submit they should be taken to a page that displays all the information we just posted from the form.  You should have a page that shows the pirate you create along with his ships and all the details about the pirate and his ships.

- Do what you think makes the most sense.  Follow REST conventions.  Use the internet to figure it out if need be.

- This is an excercise in REST conventions, HTML forms and params.  Please use the debugger and/or puts to see how changing the type of HTML you use changes the params. Spend some time thinking about your routes.

- Keep in mind this lab is using Capybara. So the last test will look for a button on your `new.erb` file with a value of `"Submit"`.

## Example

Often in web application development you'd like to have a form that will update multiple related objects at once.

When we create a typical form we can do something like this where student is the class of the object we are working with.

```html
<form action='/students' method="POST">
  <input ... name="student[name]" />
  <input ... name="student[age]" />
  <input ... name="student[level]" />
  <input type="submit" value="Submit">
</form>
```

What if students also had classes! Could we create a student and a class at the same time?

Let's say classes have names, grade, and topics:

```html
<form action='/students' method="POST">
  <input ... name="student[name]" />
  <input ... name="student[age]" />
  <input ... name="student[level]" />
  <input ... name="student[class][0][name]" />
  <input ... name="student[class][0][grade]" />
  <input ... name="student[class][0][topic]" />
  <input ... name="student[class][1][name]" />
  <input ... name="student[class][1][grade]" />
  <input ... name="student[class][1][topic]" />
  <input type="submit" value="Submit" />
</form>
```

```ruby
post '/students' do

  <!-- try dropping the debugger in here and seeing what the params hash is -->

end
```

```
As you can see we constructured a nice data structure for ourselves
student
    name
    age
    level
    classes
        0
            name
                english
            grade
                A
            topic
                shakespeare
        1
            name
                math
            grade
                B
            topic
                geometry
```

## **BONUS**

1. Back the whole thing with a database using ActiveRecord
2. Convert it into a modular-style Sinatra application (e.g., with an ApplicationController and a PiratesController)

## Resources
* [Surreal Detective](http://surrealdetective.github.io/) - [The Nested Ruby Params Hash for Complex HTML Forms and Sinatra](http://surrealdetective.github.io/blog/2013/07/01/the-nested-ruby-params-hash-for-complex-html-forms-and-sinatra/)
