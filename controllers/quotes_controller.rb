class QuotesController < BaseController
  def index
    @quotes = Quote.all
    p @quotes
    [200, {}, ["OK"]]
  end

  def show
    @quote = Quote.where(Sequel.ilike(:character, params["character"])).first
    p @quote
    [200, {"Content-Type" => "application/json"}, [@quote.to_json]]
  end
end