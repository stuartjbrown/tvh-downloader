#!/usr/bin/env ruby
# Main file for tvh-downloader

require 'optparse'

hash_options = {}
help_text = ""

OptionParser.new do |opts|
  opts.banner = "Usage: tvh-downloader [options]"
  opts.on('-r [ARG]', '--remote-url-port [ARG]', "Specify the remote url and port e.g. tvhserver.dvb.com:9981") do |v|
    hash_options[:remote_url_port] = v
  end
  opts.on('-u [ARG]', '--remote-username [ARG]', "Specify the TvHeadend remote username") do |v|
    hash_options[:remote_username] = v
  end
  opts.on('-p [ARG]', '--remote-password [ARG]', "Specify the TvHeadend remote password") do |v|
    hash_options[:remote_password] = v
  end
  opts.on('-l [ARG]', '--local-path [ARG]', "Specify the local path to store the downloaded files") do |v|
    hash_options[:local_path] = v
  end
  opts.on('-v', '--version', 'Display the version') do
    puts "0.1.0"
    exit
  end
  opts.on('-h', '--help', 'Display this help') do
    puts opts
    exit
  end

  help_text = opts.to_s
end.parse!

if hash_options.length < 4
  puts help_text
  exit
end
