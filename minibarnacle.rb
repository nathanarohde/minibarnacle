require 'open-uri'
require 'nokogiri'
require 'sinatra'
require 'highline/import'
# Highline.colorize_strings

BASE_URL='http://tapastic.com/swallowsofdoom/subscribers?series_id=1237'
BASE_SUBSCRIBER_URL = 'http://tapastic.com'

get '/' do
  "Hello, world"
end

# class Subscriber
#   attr_accessor :name, :url

#   def initialize(opts={})
#     @name = opts[:name]
#     @url = opts[:url]
#   end
# end

# class Comic
#   attr_accessor :name, :url
#
#   def initialize(opts={})
#     @name = opts[:name]
#     @url = opts[:url]
#   end
# end

# class Bot
#   subscribers = []
#   doc = Nokogiri::HTML(open("http://tapastic.com/swallowsofdoom/subscribers?pageNumber=1&series_id=1237"))

#   end_page_node = doc.css('div.g-pagination-wrap/a.mln')
#   end_page = end_page_node.text

#   i=1
#   while i <= end_page.to_i
#     doc = Nokogiri::HTML(open("http://tapastic.com/swallowsofdoom/subscribers?pageNumber=" + i.to_s + "&series_id=1237"))
#     subscriber_nodes = doc.css('li.ib/a.thumb-wrap')
#     subscriber_nodes.each do |subscriber_node|
#        subscriber_name = subscriber_node['href']
#        subscriber_url = BASE_SUBSCRIBER_URL + subscriber_name
#        subscribers << Subscriber.new(name: subscriber_name, url: subscriber_url)
#      end
#      puts i
#      sleep 0.5
#      i +=1
#    end

#    subscribers.each do |subscriber|
#      puts subscriber.name
#    end
#    puts subscribers.length
# end
