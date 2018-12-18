require_relative 'error'
require_relative 'logging'

class BaseController

    include Error
    include ERB::Util
    include Logging

    def initialize(params)
        @params = params
        @headers = {}
    end

    private

    attr_reader :params

    def render(filename)
        @binding = binding
        status, body = Renderer.new(File.join('views', filename), @binding).render
        [status, @headers, [body]]
    end

    def redirect_to(path)
        [303, {'Location' => path}, ['303 See Other']]
    end

    def partial(filename)
        Renderer.new(File.join('views', filename), binding).render_partial
    end

    def content_for(name, value)
        @binding.local_variable_set(name, value)
    end


    def headers(hash)
        @headers.merge!(hash)
    end

end