class Application
  def call(env)
    [200, {}, ["Bonjour le monde !"]]
  end
end

run Application.new
