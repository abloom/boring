class Boring::Dialogue < Struct.new(:path)
  def message
    @_message ||= File.read(self.path)
  end

  def render
    #system "clear"

    lines = self.message.scan(/.{1,76}/)
    msg = Paint[lines.first, :yellow]
    Boring.logger.info "\n--- #{msg}"

    lines[1..-1].each do |line|
      msg = Paint[line.strip, :yellow]
      Boring.logger.info "    #{msg}"
    end

    Boring.logger.info ""
  end
end
