require "http"
class EpisodeController < ApplicationController
  def index
    @response1 = HTTP.get('https://rickandmortyapi.com/api/episode').parse
    @response2 = HTTP.get('https://rickandmortyapi.com/api/episode?page=2').parse
  end
  def show
    @response_episode = HTTP.get("https://rickandmortyapi.com/api/episode/%d" % params[:id]).parse
    @lista_info_personajes=[]
    for link_character in @response_episode["characters"] do
      par_id_nombre=[]
      id_personaje=HTTP.get(link_character).parse["id"]
      nombre_personaje=HTTP.get(link_character).parse["name"]
      par_id_nombre.push(id_personaje)
      par_id_nombre.push(nombre_personaje)
      @lista_info_personajes.push(par_id_nombre)
    end
  end
end
