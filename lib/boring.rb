require "boring/version"
require "boring/video"

module Boring
  extend self

  attr_accessor :videos
  self.videos = []

  def init(video_path)
    video_path = File.join video_path, "*"

    Dir.glob(video_path).each do |path|
      output = if RUBY_PLATFORM =~ /linux/
        `file -b -i #{path}`
      else RUBY_PLATFORM =~ /darwin/
        `file -b -I #{path}`
      end

      next unless output =~ /^video/

      @videos << Boring::Video.new(path)
    end
  end
end
