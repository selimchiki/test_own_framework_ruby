require 'yaml'
require_relative 'hello_controller'

class Application

  def initialize
    @routes = YAML.load_file("routes.yml")
  end

  def call(env)
    if route_exists?(env["REQUEST_PATH"])
      HelloController.new.index
    else
      fail "Pas de route correspondante"
    end
  end

  private

  def route_exists?(path)
    @routes[path]
  end
end
