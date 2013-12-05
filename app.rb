# encoding: utf-8

require "sinatra"
require "sinatra/reloader" if development?
require "markdown"

set :public_folder, File.dirname(__FILE__) + '/public'
set :port, 8000

DOC_PATH = "/Users/chencheng/Documents/Work/alipay/cashierx/docs/"

def get_html(path)
  path = path + "README.md" if path[-1] == "/"
  path = File.join DOC_PATH, path
  content = File.read(path)
  Markdown.new(content).to_html
end

get "*" do |path|
  ext = path.split(".")[-1]
  if ext && ext.match(/ico|jpg|gif|jpg|jpeg/)
    return ""
  end

  get_html(path)
end
