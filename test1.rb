

# require 'active_support/all'
#
# require 'json'
#
#
#
# s='		<display-auto value="ab">
# 		<![CDATA[
# 			[section lib="" width="w3"]
# 			[champ cle="descriptif/metier"]
# 			[champ cle="descriptif/nb_poste"]
# 			[champ cle="descriptif/lieu"]
# 			[champ cle="descriptif/type_contrat"]
# 			[champ cle="descriptif/salaire-brut"]
# 			[champ cle="descriptif/date_debut"]
# 			[champ cle="descriptif/date_fin"]
#
# 		]]>
#         <ab>ddd</ab>
# 		</display-auto>
# '

#
# token = "xxx"
# user = "xxx"
# survey_id = "xxx"
# responses = Hash.from_xml(s).to_json
#
# puts responses


# puts JSON.pretty_generate(Hash.from_xml('<variable type="product_code">5</variable>'))


require 'xml/libxml'

def jasonized
  jsonDoc = xml_to_hash(open('/Users/cma/Documents/poste.xml'))
  render :json => jsonDoc

end

def xml_to_hash(xml)
  hashed = Hash.new
  nodes = Array.new

  hashed[xml.name+"_attributes"] = xml.attributes.to_h if xml.attributes?
  xml.each_element { |n|
    h = xml_to_hash(n)
    if h.length > 0 then
      nodes << h
    else
      hashed[n.name] = n.content
    end
  }
  hashed[xml.name] = nodes if nodes.length > 0
  return hashed
end


jasonized