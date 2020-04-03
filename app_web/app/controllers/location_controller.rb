class LocationController < ApplicationController
  def show
    @response_location=HTTP.get("https://rickandmortyapi.com/api/location/%d" % params[:id]).parse
    lista_ids_personajes=[]
    for link_character in @response_location["residents"] do
      lista_ids_personajes.push(link_character.scan(/\d+/))
    end
    @personajes=HTTP.get("https://rickandmortyapi.com/api/character/%s" % lista_ids_personajes.join(",")).parse
  end
end
