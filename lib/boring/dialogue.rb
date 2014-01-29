class Boring::Dialogue < Struct.new(:message)
  def render
    system "clear"
    lines = self.message.scan(/.{1,76}/)
    puts "\n--- #{lines.first}"

    lines[1..-1].each do |line|
      puts "    #{line}"
    end
    puts
  end
end
