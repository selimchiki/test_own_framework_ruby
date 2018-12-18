module Generators
  class Controller
    def self.generate(name:)
      puts new(name).generate
    end

    def initialize(name)
      @filename = "#{name}_controller.rb"
      @classname = name.split('_').map(&:capitalize).join
      @name = name.capitalize
    end

    def generate
      File.write("#{path}/#{filename}", code)
    end

    private

    attr_reader :filename

    def path
      "controllers"
    end

    def code
      <<~CODE
        Class #{@classname}Controller < BaseController
          def index
          end

          def show
          end
  
          def delete
          end

          def new
          end

          def create
          end

          def edit
          end

          def update
          end
        end
      CODE
    end
  end
end