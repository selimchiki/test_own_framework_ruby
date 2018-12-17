require 'yaml'
require 'erb'
require_relative 'renderer'
require_relative 'routes'
require_relative 'base_controller'
require_relative 'route'
require_relative 'include_css'
require_relative 'include_js'
require_relative 'error'

Dir.glob('controllers/*.rb') { |filename| require_relative("../#{filename}")} 

DB = Sequel.connect('sqlite://db/database.sqlite')
Dir.glob('models/*.rb') { |filename| require_relative("../#{filename}") }

class Application

  include Error

  def initialize
    @routes = Routes.new(YAML.load_file("routes.yml"))
  end

  def call(env)
    req = Rack::Request.new(env)
    route = @routes.find(env["REQUEST_METHOD"], env["PATH_INFO"])
    route.exec_with(req.params)
  rescue E404 => ex
    error_404
  #rescue
  #  error_500
  end

end
