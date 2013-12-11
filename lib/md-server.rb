# encoding: utf-8

require "sinatra"
require "sinatra/reloader" if development?
require "github/markdown"

DOC_PATH = Dir.pwd

def get_html(path)
  content = File.read path
  GitHub::Markdown.render(content)
end

def get_path(path)
  path = path + "README.md" if path[-1] == "/"
  path = File.join DOC_PATH, path
  path
end

def get_ext(path)
  path.split(".")[-1]
end

################
# Routes.

get "*" do |path|
  ext = get_ext path
  if ext && ext.match(/ico|jpg|gif|jpg|jpeg/)
    return ""
  end

  path = get_path path

  if File.exist?(path)
    content = get_html path
    erb :markdown, :locals => {
      :content => content
    }
  else
    error "sorry, file can't be found."
  end

end

post "/hook" do
  `echo 1`
  `git pull origin master`
end

###############
# [todo] - 添加文件快速检索功能，类似 sublime 的 command+p panel
