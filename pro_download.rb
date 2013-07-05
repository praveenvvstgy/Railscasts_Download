#!/usr/bin/ruby
# Script to download Free Railscasts episodes from RSS Feed
# Your private feed url can be found on https://railscasts.com/subscriptions/current

require "multi_xml"
require "open-uri"

PRIVATE_RSS_URL = "Enter private feed url"
PUBLIC_RSS_URL  = "http://feeds.feedburner.com/railscasts"

private_feed = MultiXml.parse open(PRIVATE_RSS_URL)
public_feed  = MultiXml.parse open(PUBLIC_RSS_URL)

["title", "description", "pubDate", "enclosure", "link", "guid", "author", "subtitle", "summary", "explicit", "duration"]

public_episodes_ids = public_feed["rss"]["channel"]["item"].map do |item|
  item["enclosure"]["url"].split('/').last.split('-').first.to_i
end

private_episodes_ids = private_feed["rss"]["channel"]["item"].map do |item|
  item["enclosure"]["url"].split('/').last.split('-').first.to_i
end

downloaded_episodes_ids = Dir.new(".").entries.select{ |f| f =~ /^(\d){3}.*.mp4/ }.collect { |f| f.split("_").first.to_i}

episodes_ids = private_episodes_ids - public_episodes_ids - downloaded_episodes_ids

unwatched_episodes = private_feed["rss"]["channel"]["item"].select do |item|
  episodes_ids.include? item["enclosure"]["url"].split('/').last.split('-').first.to_i
end

unwatched_episodes.each do |episode|
  system("wget -c #{episode["enclosure"]["url"].strip}")
  system("echo #{episode["enclosure"]["url"].strip}")
end
