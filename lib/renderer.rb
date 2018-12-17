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

  def render_partial
    if File.exist?(@filename)
      ERB.new(template).result(@binding)
    else
      no_template
    end
  end

  def include_partial(filename)
    Renderer.new(File.join('views', filename), binding).render_partial
  end

  def include_content(name)
    @binding.local_variable_get(name)
  rescue
    nil
  end

  private

  def result
    content = ERB.new(template).result(@binding)
    insert_in_main_template { content }
  end

  def insert_in_main_template
    ERB.new(main_template).result(binding)
  end

  def main_template
    File.read('views/layouts/application.html.erb')
  end

  def template
    File.read(@filename)
  end

  def no_template
    puts "Erreur 500 Template inconnu: #{@filename}"
    fail
  end

  def include_css
    IncludeCSS.call
  end

  def include_js
    IncludeJS.call
  end
end
