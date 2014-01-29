class Boring::Video < Struct.new(:path)
  def play
    output = `omxplayer #{@path}`
    $?.to_i == 0
  end
end
