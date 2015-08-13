require 'open-uri'
require 'nokogiri'
require 'highline/import'
# Highline.colorize_strings

BASE_URL='http://tapastic.com/swallowsofdoom/subscribers?series_id=1237'
BASE_SUBSCRIBER_URL = 'http://tapastic.com'

class Subscriber
  attr_accessor :name, :url

  def initialize(opts={})
    @name = opts[:name]
    @url = opts[:url]
  end
end

# class Comic
#   attr_accessor :name, :url
#
#   def initialize(opts={})
#     @name = opts[:name]
#     @url = opts[:url]
#   end
# end

class Bot
  subscribers = []
  doc = Nokogiri::HTML(open("http://tapastic.com/swallowsofdoom/subscribers?pageNumber=1&series_id=1237"))

  end_page_node = doc.css('div.g-pagination-wrap/a.mln')
  end_page = end_page_node.text
  subscriber_nodes = doc.css('li.ib/a.thumb-wrap')

  i = 1
  while i <= end_page
    # doc = Nokogiri::HTML(open("http://tapastic.com/swallowsofdoom/subscribers?pageNumber=10&series_id=1237"))
    subscriber_nodes.each do |subscriber_node|
      subscriber_name = subscriber_node['href']
      subscriber_url = BASE_SUBSCRIBER_URL + subscriber_name
      subscribers << Subscriber.new(name: subscriber_name, url: subscriber_url)
    end

    sleep 0.5
    i +=1
  end

  a = page.at('a[title="Next page"]')
  page = Nokogiri::HTML(open(a[:href]))

  end_page = end_page_node.text

  subscribers.each do |subscriber|
    puts subscriber.name
  end
end

  # categories.each do |c|
  #   puts "Retrieving category info for #{c.name}"
  #   doc = Nokogiri::HTML(open(c.url))
  #   comic_nodes = doc.css('li.page-item-wrap.singular-item/a.title')
  #
  #   comic_nodes.each do |comic_node|
  #       title = comic_node.text
  #       comic_path = comic_node['href']
  #       url = BASE_COMIC_URL + comic_path
  #       comics << Comic.new(genre: c.name, name: title, url: url)
  #   end
  #
  #   sleep 0.5
  # end
  #
  # comics.each do |c|
  #   puts "Retrieving comic info for #{c.name}"
  #   doc = Nokogiri::HTML(open(c.url))
  #   view_count_node = doc.css('span.cnt-txt')[0]
  #   view_count = view_count_node.text.strip
  #
  #   follower_count_node = doc.css('span.cnt-txt')[1]
  #   follower_count = follower_count_node.text.strip
  #
  #   description_node = doc.css('span#series-desc-body')[0]
  #   description = description_node.text.strip.gsub(/\s{2,}/,'')
  #
  #   author_node = doc.css('span[@itemprop="name"]')[0]
  #   author = author_node.text.strip
  #
  #   c.view_count = view_count
  #   c.follower_count = follower_count
  #   c.description = description
  #   c.author = author
  #
  #   sleep 0.5
  # end

# end
