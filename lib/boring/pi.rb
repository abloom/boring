require 'pi_piper'

PiPiper::Platform.driver = PiPiper::StudDriver.new

class Boring::Pi
  def motion_sensor(pin, &block)
    PiPiper.watch pin: pin, &block
  end
end
