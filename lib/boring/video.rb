class Boring::Video < Struct.new(:path)
  def play
    cmd = "/usr/bin/omxplayer #{self.path}"
    output = `#{cmd}`

    $?.to_i == 0
  end
end
