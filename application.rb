require 'yaml'

class Application
  def initialize
    @routes = YAML.load_file("routes.yml")
  end

  def call(env)
    if @routes[env["REQUEST_PATH"]]
      [200, {}, ["Ce chemin existe"]]
    else
      [200, {}, ["Ce chemin n'existe pas"]]
    end
  end
end
