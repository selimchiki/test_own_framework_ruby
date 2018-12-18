class FrameworkLogger
  include Singleton

  attr_accessor :logger

  %i( info debug warn error fatal ).each do |name|
    define_singleton_method(name) do |message|
      instance.logger.send(name, message)
    end
  end


=begin

  def self.info(message)
    instance.logger.info(message)
  end

  def self.debug(message)
    instance.logger.debug(message)
  end

  def self.warn(message)
    instance.logger.warn(message)
  end

  def self.error(message)
    instance.logger.error(message)
  end

  def self.fatal(message)
    instance.logger.fatal(message)
  end

=end
end