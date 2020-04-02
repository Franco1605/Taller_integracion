class LocationController < ApplicationController
  def show
    @response_location=HTTP.get("https://rickandmortyapi.com/api/location/%d" % params[:id]).parse
    @lista_info_characters={}
    for link_character in @response_location["residents"] do
      id_character=HTTP.get(link_character).parse["id"]
      nombre_character=HTTP.get(link_character).parse["name"]
      @lista_info_characters[id_character]=nombre_character
    end
  end
end
