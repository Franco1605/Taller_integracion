class LocationController < ApplicationController
  def show
    @response_location=HTTP.get("https://rickandmortyapi.com/api/location/%d" % params[:id]).parse
    @lista_info_characters=[]
    for link_character in @response_location["residents"] do
      par_id_character=[]
      id_character=HTTP.get(link_character).parse["id"]
      nombre_character=HTTP.get(link_character).parse["name"]
      par_id_character.push(id_character)
      par_id_character.push(nombre_character)
      @lista_info_characters.push(par_id_character)
    end
  end
end
