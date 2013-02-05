require 'bundler'

Bundler.setup

require 'pry'
require 'virtus'
require 'dm-mapper'
require 'data_mapper/engine'
require 'data_mapper/engine/in_memory'

class Tweet
  include DataMapper::Model

  attribute :id, Integer
  attribute :author, String
  attribute :content, String
end

env = DataMapper::Environment.new

env.engines[:memory] = DataMapper::Engine::InMemory::Engine.new

env.build(Tweet, :memory) do
  key :id
end

env.finalize

tweet = Tweet.new author: 'josh', content: 'some stuff'
env[Tweet].insert tweet

binding.pry
