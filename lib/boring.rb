require 'rubygems'
require 'bundler/setup'

require "boring/version"
require "logger"
require "paint"

module Boring
  module Actions; end
  module Triggers; end

  extend self

  attr_reader :logger
  @logger = Logger.new STDOUT
  @logger.formatter = proc do |severity, datetime, progname, msg|
    "#{msg}\n"
  end

  def find_dialogues(dialogue_path)
    dialogue_path = File.join dialogue_path, "*.txt"

    Dir.glob(dialogue_path)
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
