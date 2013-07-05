#!/usr/bin/env ruby
# Script to download Revised Railscasts episodes from RSS Feed
# Your private feed url can be found on https://railscasts.com/subscriptions/current

require 'nokogiri'
require 'open-uri'


RSS_URI = 'Enter private feed url'

SAVE_PATH = 'Enter path where videos need to be downloaded to'
VIDEO_FORMAT = '.mp4' # modify to whatever format you prefer (and is supported)

CURRENT_DOWNLOADS = Dir["#{SAVE_PATH}/*#{VIDEO_FORMAT}"]

def download_new_episodes
  feed = Nokogiri::XML(open(RSS_URI))
  feed.xpath("//enclosure[contains(@url, 'revised')]").each do |episode|
    episode_url = ensure_extension(episode[:url])
    download_episode(episode_url) unless already_downloaded?(episode_url)
  end
end

def already_downloaded?(episode)
  episode = SAVE_PATH + '/' + episode.split('/').last
  CURRENT_DOWNLOADS.include?(episode)
end

def download_episode(video_url)
  filename = video_url.split('/').last
  p "Downloading #{filename}"
  local_file = SAVE_PATH + '/' + filename
  %x(wget #{video_url} -c -O #{local_file}.tmp )
  %x(mv #{local_file}.tmp #{local_file} )
  p "Finished downloading #{filename}"
end

def ensure_extension(file)
  ext = File.extname(file)
  return file unless (ext != VIDEO_FORMAT)
  file = file.gsub(ext, VIDEO_FORMAT)
end

download_new_episodes
p "All episodes downloaded."