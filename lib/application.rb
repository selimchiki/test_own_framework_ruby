require 'yaml'
require 'erb'
require_relative 'renderer'
require_relative 'routes_builder'
require_relative 'base_controller'
require_relative 'route'

Dir.glob('controllers/*.rb') { |filename| require_relative("../#{filename}")} 

DB = Sequel.connect('sqlite://db/database.sqlite')
Dir.glob('models/*.rb') { |filename| require_relative("../#{filename}") }

class Application

  def initialize
    @routes = RoutesBuilder.new(YAML.load_file("routes.yml"))
  end

  def call(env)
    req = Rack::Request.new(env)
    route = @routes.find(env["REQUEST_METHOD"], env["PATH_INFO"])

    exec(route, req.params)
  rescue
    fail "No matching routes"
  end

  private

  def exec(route, params)
    controller = Object.const_get(route.controller).new(params)
    controller.send(route.method)
  end

end
