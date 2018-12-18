class QuotesController < BaseController
  def index
    @quotes = Quote.all
    p @quotes
    [200, {}, ["OK"]]
  end
end