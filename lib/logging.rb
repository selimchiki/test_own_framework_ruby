module Logging
  def info(message)
    FrameworkLogger.info(message)
  end

  def debug(message)
    FrameworkLogger.debug(message)
  end

  def warn(message)
    FrameworkLogger.warn(message)
  end

  def error(message)
    FrameworkLogger.error(message)
  end

  def fatal(message)
    FrameworkLogger.fatal(message)
  end

end