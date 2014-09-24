# require 'rubygems'
require 'crack'


data='		<display-auto value="ab" actif="yes">
		<![CDATA[
			[section lib="" width="w3"]
			[champ cle="descriptif/metier"]
			[champ cle="descriptif/nb_poste"]
			[champ cle="descriptif/lieu"]
			[champ cle="descriptif/type_contrat"]
			[champ cle="descriptif/salaire-brut"]
			[champ cle="descriptif/date_debut"]
			[champ cle="descriptif/date_fin"]

		]]>

		</display-auto>



'


doc =Crack::XML.parse(data)

puts doc.to_s