require 'boring/actions/dialogue'
require 'boring/actions/video'

class Boring::Runner
  attr_reader :videos, :dialogues

  def initialize(videos, dialogues)
    @dialogues = dialogues.map do |dialogue|
      msg = Paint["Loading Dialogue:", :red]
      Boring.logger.info "#{msg} #{dialogue}"
      Boring::Actions::Dialogue.new dialogue
    end
    raise "dialogues not found" if @dialogues.empty?

    @videos = videos.map do |video|
      msg = Paint["Loading Video:", :red]
      Boring.logger.info "#{msg} #{video}"
      Boring::Actions::Video.new video
    end
    raise "videos not found" if @videos.empty?

    @pi = Boring::Pi.new
  end

  def play_random_video
    @videos.sample.play
  end

  def say_random_dialogue
    @dialogues.sample.render
  end
end
