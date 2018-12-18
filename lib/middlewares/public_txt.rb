class PublicTxt
  def initialize(app)
    @app = app
  end

  def call(env)
    @file = env["PATH_INFO"]

    if public_txt_file?
      [200, headers, [content]]
    else
      @app.call(env)
    end
  end

  private

  def public_txt_file?
    @file.start_with?("/") && @file.count("/") == 1 && @file.end_with?(".txt") && File.exist?(real_file)
  end

  def real_file
    "public" + @file
  end

  def content
    @content ||= File.read(real_file)
  end

  def length
    content.size.to_s
  end

  def headers
    {"Content-Type" => "text/plain", "Content-Length" => length}
  end
end