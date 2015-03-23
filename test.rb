require './environment'

class Pirate
  attr_reader :name, :weight, :height

  PIRATES = []

  def initialize(args)
    @name = args[:name]
    @weight = args[:weight]
    @height = args[:height]
    PIRATES << self
  end

  def self.all
    PIRATES
  end
end

class Ship
  attr_reader :name, :type, :booty

  SHIPS = []

  def initialize(args)
    @name = args[:name]
    @type = args[:type]
    @booty = args[:booty]
    SHIPS << self
  end

  def self.all
    SHIPS
  end
end

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:ship].each do |ship, details|
        Ship.new(details)
      end

      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end


<form action='/pirates' method="POST">
  <h2>Pirate</h2>
  <label for="pirate_name">Name</label><br>
  <input id="pirate_name" type="text" name="pirate[name]" /><br>
  <label for="pirate_weight">Weight</label><br>
  <input id="pirate_weight" type="text" name="pirate[weight]" /><br>
  <label for="pirate_height">Height</label><br>
  <input id="pirate_height" type="text" name="pirate[height]" /><br><br>

  <h2>Ship(s)</h2>
  <label for="ship_name_1">Name</label><br>
  <input id="ship_name_1" type="text" name="ship[0][name]" /><br>
  <label for="ship_type_1">Type</label><br>
  <input id="ship_type_1" type="text" name="ship[0][type]" /><br>
  <label for="ship_booty_1">Booty</label><br>
  <input id="ship_booty_1" type="text" name="ship[0][booty]" /><br><br>

  <label for="ship_name_2">Name</label><br>
  <input id="ship_name_2" type="text" name="ship[1][name]" /><br>
  <label for="ship_booty_2">Type</label><br>
  <input id="ship_type_2" type="text" name="ship[1][type]" /><br>
  <label for="ship_booty_2">Booty</label><br>
  <input id="ship_booty_2" type="text" name="ship[1][booty]" /><br>
  <input type="submit" value="Submit">
</form>



<h1>Pirates</h1>

<div class="pirate">
  <h3>Name: <%= @pirate.name %></h3><br>
  <h4>Weight: <%= @pirate.weight %> pounds</h4><br>
  <h4>Height: <%= @pirate.height %> inches</h4>
</div><br>

<h1>Ships</h1>

<% @ships.each do |ship| %>
  <div class="ship">
    <p>Name: <%= ship.name %></p><br>
    <p>Type: <%= ship.type %></p><br>
    <p>Booty: <%= ship.booty %></p>
  </div><br>
<% end %>
