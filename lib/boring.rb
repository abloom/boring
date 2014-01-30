require 'rubygems'
require 'bundler/setup'

require "boring/version"
require "logger"
require "paint"

module Boring
  extend self

  attr_reader :logger
  @logger = Logger.new STDOUT
  @logger.formatter = proc do |severity, datetime, progname, msg|
    "#{msg}\n"
  end

  def find_dialogues(dialogue_path)
    [
      %q{Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...},
      %q{Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.},
      %q{Bacon ipsum dolor sit amet shoulder turkey pork belly ham hock. Porchetta spare ribs meatball salami pork chop, bacon tenderloin rump shankle jowl pork.}
    ]
  end

  def find_videos(video_path)
    video_path = File.join video_path, "*"

    Dir.glob(video_path).map do |path|
      output = if RUBY_PLATFORM =~ /linux/
        `file -b -i #{path}`
      else RUBY_PLATFORM =~ /darwin/
        `file -b -I #{path}`
      end

      next unless output =~ /^video/
      path
    end.compact
  end
end
