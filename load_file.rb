require 'pry'



def load_file(path)
  content = {}
  File.foreach(path) do |line|
    name, url = line.split(':')
    content[name] = url.strip
  end

  puts content
end

test=load_file('/Users/cma/Documents/poste.xml')