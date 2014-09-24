
require 'nokogiri'

def parse

doc = Nokogiri::XML(open('/Users/cma/Documents/poste1.xml'))

#root element name, which is always the file name of the xml.
root_name = doc.root.name

root = doc

parse_nodeset (root)
end

def parse_nodeset nodeset

  if nodeset.children.length==0
    parse_node(nodeset)
    return
  end

  nodeset.children.each { |child|  parse_node(child) }

end


def parse_node (node)
  if node.node_type  == Nokogiri::XML::Reader::TYPE_END_ELEMENT
    return
  end

  if node.comment?()
    return
  end

  if node.blank?()
    return
  end

  if node.cdata?()
    puts '  #text:' + node.to_s
    return
  end

  # remove empty tabs, need to find out a better way to do this
  if node.node_type  == Nokogiri::XML::Reader::TYPE_TEXT
      if node.to_s.gsub(/\t+/,'') ==''
        return
      end
  end

  # node name
  puts node.name + ':{'

  # attributes
  if node.attributes().length >0
    node.attributes().each { |attr| puts '  @'+attr[0] +':'+ attr[1] }
  end

  node.children.each { |child|  parse_node(child) }

  puts '},'

end

parse

