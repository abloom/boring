require "boring/version"

module Boring
  attr_accessor :videos
  self.videos = []

  def init(video_path)
    video_path = File.expand_path video_path

    Dir.glob(video_path).each do |path|
      output = `file -b -i #{path}`
      next unless output =~ /$video/

      @videos << Boring::Video.new(path)
    end
  end
end
