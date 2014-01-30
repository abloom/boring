require 'boring/dialogue'
require 'boring/video'

class Boring::Runner
  attr_reader :videos, :dialogues

  def initialize(videos, dialogues)
    @dialogues = dialogues.map do |dialogue|
      msg = Paint["Loading Dialogue:", :red]
      Boring.logger.info "#{msg} #{dialogue}"
      Boring::Dialogue.new dialogue
    end

    @videos = videos.map do |video|
      msg = Paint["Loading Video:", :red]
      Boring.logger.info "#{msg} #{video}"
      Boring::Video.new video
    end
  end

  def play_random_video
    @videos.sample.play
  end

  def say_random_dialogue
    @dialogues.sample.render
  end
end
