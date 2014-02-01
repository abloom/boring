class Boring::Actions::Video < Struct.new(:path)
  def play
    msg = Paint["Playing Video:", :green]
    Boring.logger.info "#{msg} #{self.path}"

    output = `/usr/bin/omxplayer #{self.path}`
    $?.to_i == 0
  end
end
