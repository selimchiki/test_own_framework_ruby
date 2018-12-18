class TestController < BaseController
  def show
    render_json({message: "Et voici le rechargement automatique"})
  end
end