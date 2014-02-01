require 'pi_piper'

#PiPiper::Platform.driver = PiPiper::StudDriver.new

class Boring::Pi
  def motion_sensor(pin, &block)
    PiPiper.watch pin: pin, direction: :in, pull: :up, &block
  end
end
