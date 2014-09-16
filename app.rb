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
