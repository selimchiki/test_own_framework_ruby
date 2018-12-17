class RoutesBuilder

  def initialize(routes_from_file)
    @routes = {}
    routes_from_file.each {|key, value| @routes[key] = Route.new(value)}
  end

  def find(verb, path)
    key = [verb.downcase, path.downcase]
    @routes[key]
  end
end
