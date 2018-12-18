require 'bundler/setup'
Bundler.require(:default)
require_relative "lib/application"
require_relative 'lib/middlewares/trailing_slash_remover'
require_relative 'lib/middlewares/public_txt'

use TrailingSlashRemover
use PublicTxt

use Rack::Static, :urls => ["/css", "/js", "/images"], :root => "assets"

run Application.new
