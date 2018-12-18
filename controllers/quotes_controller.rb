class QuotesController < BaseController
  def index
    @quotes = Quote.all
    p @quotes
    [200, {}, ["OK"]]
  end

  def show
    @quote = Quote.where(Sequel.ilike(:character, params["character"])).first
    render_json @quote
  end
end