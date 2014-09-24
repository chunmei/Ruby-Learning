
file='/Users/cma/Documents/poste.xml'

Xml::Parser.new(Nokogiri::XML::Reader(open(file))) do
  # inside_element 'poste' do
  #   for_element 'Name' do puts "Username: #{inner_xml}" end
  #   for_element 'Email' do puts "Email: #{inner_xml}" end
  #
  #   for_element 'Address' do
  #     puts 'Start of address:'
  #     inside_element do
  #       for_element 'Street' do puts "Street: #{inner_xml}" end
  #       for_element 'Zipcode' do puts "Zipcode: #{inner_xml}" end
  #       for_element 'City' do puts "City: #{inner_xml}" end
  #     end
  #     puts 'End of address'
  #   end
  # end

end