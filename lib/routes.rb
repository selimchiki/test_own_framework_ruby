class Routes

  def initialize(filename)
    @routes = {}
    eval File.read(filename)
  end

  def get(path, route_to:)
    @routes[["get", path]] = Route.new(route_to)
  end

  def post(path, route_to:)
    @routes[["post", path]] = Route.new(route_to)
  end

  def find(verb, path)
    key = [verb.downcase, path.downcase.sub(%r{/$}, '')]
    @routes[key] or raise E404
  end
end
