class Boring::Dialogue < Struct.new(:message, :logger)
  def render
    #system "clear"

    lines = self.message.scan(/.{1,76}/)
    msg = Paint[lines.first, :yellow]
    Boring.logger.info "\n--- #{msg}"

    lines[1..-1].each do |line|
      msg = Paint[line, :yellow]
      Boring.logger.info "    #{msg}"
    end

    Boring.logger.info ""
  end
end
