class Renderer
  def initialize(filename, binding)
    @filename = filename
    @binding = binding
  end

  def render
    if File.exists?(@filename)
      [200, result]
    else
      [500, no_template]
    end
  end

  private

  def result
    ERB.new(template).result(@binding)
  end

  def template
    File.read(@filename)
  end

  def no_template
    "<h1>500</h1><p>No such template: #{@filename}</p>"
  end
end
