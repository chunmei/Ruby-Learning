
require 'nokogiri'


def parse

  puts "~~"

  doc = Nokogiri::XML(open('/Users/cma/Documents/poste.xml'))

  root_node= doc.xpath('/poste')

  # get_keyvalues(root_node)
  # get_field_path(root_node)

  node= doc.xpath('/poste/quickzoom/display-auto')
  puts node.children.length

  node.children.each { |child| puts child.to_s + "****" }

  puts node.to_s

  puts "end"


end


#print leave node

def get_keyvalues (node)
  # if it is leave node
  if ( node.children.length == 0 )
    # filter comments, maybe nokogiri provide such functions, need investigate
    if not ( node.to_s.start_with? '<!--' and node.to_s.end_with?('-->'))
      puts node.to_s
      return
    end
  end

  node.children.each { |child|  get_keyvalues(child) }

end

def get_field_path (node)
  if ( node.children.length == 0 )

    #remove comment, remove '\t'
   #  if(node.node_type != Nokogiri::XML::Reader::TYPE_COMMENT  )
   #    #remove '\t'
   #    if (node.to_s != '\t')
   #      puts node.to_s
   #      puts node.name
   #      puts  "****"
   #      return
   #     end
   # end

    if node.node_type==1
      puts node.to_s
    end
    # puts node.node_type
  end

  node.children.each { |child|  get_field_path(child) }
end



parse


