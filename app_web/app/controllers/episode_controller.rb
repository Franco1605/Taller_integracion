require "http"
class EpisodeController < ApplicationController
  def index
    @response1 = HTTP.get('https://rickandmortyapi.com/api/episode').parse
    @response2 = HTTP.get('https://rickandmortyapi.com/api/episode?page=2').parse
  end
  def show
    @response_episode = HTTP.get("https://rickandmortyapi.com/api/episode/%d" % params[:id]).parse
    @lista_nombres_personajes=[]
    for link_character in @response_episode["characters"] do
      nombre_personaje=HTTP.get(link_character).parse["name"]
      puts nombre_personaje
      @lista_nombres_personajes.push(nombre_personaje)
    end
  end
end
