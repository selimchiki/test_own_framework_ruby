require 'yaml'
require 'erb'
require 'logger'
require 'singleton'
require_relative 'renderer'
require_relative 'routes'
require_relative 'base_controller'
require_relative 'route'
require_relative 'include_css'
require_relative 'include_js'
require_relative 'error'
require_relative 'framework_logger'
require_relative 'api_renderer'
require_relative 'database'

Dir.glob('controllers/*.rb') { |filename| require_relative("../#{filename}")}
Dir.glob('models/*.rb') { |filename| require_relative("../#{filename}") }

DB = Database.setup

class Application

  include Error

  def self.routes
    @@routes
  end

  def initialize(logger:)
    @@routes = Routes.new
    require "./routes"
    FrameworkLogger.instance.logger = logger
  end

  def call(env)
    if env["framework.api"]
      execute_api_request(env)
    else
      execute_browser_request(env)
    end
  end

  private

  def execute_api_request(env)
    route = @@routes.find(env["REQUEST_METHOD"], env["PATH_INFO"])
    req = Rack::Request.new(env)
    route.exec_with(req.params)
  rescue E404 => ex
    api_error_404
  rescue => ex
    api_error_500(ex.message)
  end

  def execute_browser_request(env)
    req = Rack::Request.new(env)
    route = @@routes.find(env["REQUEST_METHOD"], env["PATH_INFO"])
    route.exec_with(req.params)
  rescue E404 => ex
    error_404
  rescue
    error_500
  end

end
