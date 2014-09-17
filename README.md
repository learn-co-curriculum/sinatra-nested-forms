---
  tags: forms, nested forms, sinatra, advanced
  languages: ruby, html
  resources: 2
---

# Pirates!

## Description

In this lab, you'll practice using nested forms in Sinatra.

## Instructions

- Note: YOU DO NOT NEED A DATABASE, we just need to keep track of the forms input long enough to display it, not persist it.  I don't expect the pirate to be there the next student I come to his URL, but it'd be cool if he student

- In this lab, you'll be using pirates and ships as your models.

- Other examples of models we've used thus far: Artists and Songs, Programmers and Languages they know, Schools and Students

- Make a nested form (this should probably have html `<label>`s so it makes sense to a user).

- After a user clicks submit they should be taken to a page that displays all the information we just posted from the form.  In my example I'd have a page that showed the pirate I created along with his ships and all the details about the pirate and his ships.

- I'm intentionally being vague about exactly what routes you need or how to set this all up.  We can all review together how you structured your routes and talk about the postives and negatives.  Do what you think makes the most sense.  Follow REST conventions.  Use the internet to figure it out if need be.

- This is an excercise in REST conventions, HTML forms and params.  Please use the debugger and/or puts to see how changing the type of HTML you use changes the params. Spend some time thinking about your routes.

## Example

Often in web application development you'd like to have a form that will update multiple related objects at once.

Let's say we're building a web application that had students and schools.

When we create a typical form we can do something like this where pirate is the class of the object we are working with.

```html
<form action='/students' method="POST">
  <input ... name="student[name]" />
  <input ... name="student[weight]" />
  <input ... name="student[height]" />
  <input type="submit" value="submit">
</form>
```

On the sinatra side we'd have some routes like

```ruby
post '/students' do
  @student = Student.new
  @student.name = params[:student][:name]
  @student.weight = params[:student][:weight]
  @student.height = params[:student][:height]
  @student.save
end
```

This would create a new student in our database (assuming we're using the student ORM we built)

What if students also had schools! Could we assign a student to several schools? Certainly!

Let's say schools have names, locations, and classifications.

```html
<form action='/pirates' method="POST">
  <input ... name="student[name]" />
  <input ... name="student[weight]" />
  <input ... name="student[height]" />
  <input ... name="student[schools][0][name]" />
  <input ... name="student[schools][0][location]" />
  <input ... name="student[schools][0][classification]" />
  <input ... name="student[schools][1][name]" />
  <input ... name="student[schools][1][location]" />
  <input ... name="student[schools][1][classification]" />
  <input type="submit" value="submit" />
</form>
```

```ruby
post '/students' do

  <!-- try dropping the debugger in here and seeing what the params hash is -->

end
```

```
As you can see we constructed a nice data structure for ourselves
student
    name
    weight
    height
    schools
        0
            name
                dawn treader
            location
                peter pan's world
            classification
                adventure
        1
            name
                mayflower
            location
                atlantic ocean circa 1492
            classification
                colonialization
```

## **BONUS**

1. Spec this out.
2. Back the whole thing with a database using ActiveRecord
3. Convert it into a modular-style Sinatra application (e.g., with an ApplicationController and a PiratesController)

## Resources
* [Surreal Detective](http://surrealdetective.github.io/) - [The Nested Ruby Params Hash for Complex HTML Forms and Sinatra](http://surrealdetective.github.io/blog/2013/07/01/the-nested-ruby-params-hash-for-complex-html-forms-and-sinatra/)
* [Sinatra: The Book](http://sinatra.restafari.org/book.html) - [Handling of Rails like nested params](http://sinatra.restafari.org/book.html#handling_of_rails_like_nested_params)
