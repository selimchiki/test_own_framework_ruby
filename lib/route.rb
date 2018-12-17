class Route

  def initialize(value)
    @controller, @method = value.split('#')
    @controller = @controller.capitalize + 'Controller'
  end

  attr_reader :controller, :method

  def exec_with(params)
    controller = Object.const_get(@controller).new(params)
    controller.send(@method)
  end
end