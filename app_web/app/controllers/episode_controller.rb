require "http"
class EpisodeController < ApplicationController
  def index
    @response1 = HTTP.get('https://integracion-rick-morty-api.herokuapp.com/api/episode').parse
    @response2 = HTTP.get('https://integracion-rick-morty-api.herokuapp.com/api/episode?page=2').parse
  end
  def show
    @response_episode = HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/episode/%d" % params[:id]).parse
    lista_ids_personajes=[]
    for link_character in @response_episode["characters"] do
      lista_ids_personajes.push(link_character.scan(/\d+/))
    end
    @personajes=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/%s" % lista_ids_personajes.join(",")).parse
  end
end
