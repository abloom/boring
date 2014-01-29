require "boring/version"
require "boring/dialogue"
require "boring/video"

module Boring
  extend self

  attr_accessor :videos
  self.videos = []

  attr_accessor :dialogues
  self.dialogues = []

  def init(video_path)
    self.init_videos(video_path)
    self.init_dialogues()
  end

  def init_dialogues
    messages = [
      %q{Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...},
      %q{Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.},
      %q{Bacon ipsum dolor sit amet shoulder turkey pork belly ham hock. Porchetta spare ribs meatball salami pork chop, bacon tenderloin rump shankle jowl pork.}
    ]

    messages.each do |message|
      puts "Loading Dialog: #{message}"
      self.dialogues << Boring::Dialogue.new(message)
    end
  end

  def init_videos(video_path)
    video_path = File.join video_path, "*"

    Dir.glob(video_path).each do |path|
      output = if RUBY_PLATFORM =~ /linux/
        `file -b -i #{path}`
      else RUBY_PLATFORM =~ /darwin/
        `file -b -I #{path}`
      end

      next unless output =~ /^video/

      puts "Loading Video: #{path}"
      self.videos << Boring::Video.new(path)
    end
  end
end
