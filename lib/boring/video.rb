class Boring::Video < Struct.new(:path)
  def play
    puts "Playing Video: #{self.path}"
    cmd = "/usr/bin/omxplayer #{self.path}"
    output = `#{cmd}`

    $?.to_i == 0
  end
end
