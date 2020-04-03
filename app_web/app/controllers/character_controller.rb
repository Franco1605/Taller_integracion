# encoding: utf-8
class CharacterController < ApplicationController
  def show
    @response_character = HTTP.get("https://rickandmortyapi.com/api/character/%d" % params[:id]).parse
    lista_ids_episodes=[]
    for link_episode in @response_character["episode"] do
      lista_ids_episodes.push(link_episode.scan(/\d+/))
    end
    @episodios=HTTP.get("https://rickandmortyapi.com/api/episode/%s" % lista_ids_episodes.join(",")).parse

    if @response_character["origin"]["name"]=="unknown"
      @respuesta="No tiene un lugar de origen asociado"
    else
      @respuesta=[]
      lugar=HTTP.get(@response_character["origin"]["url"]).parse
      id_lugar=lugar["id"]
      nombre_lugar=lugar["name"]
      @respuesta.push(id_lugar, nombre_lugar)
    end

    if @response_character["location"]["name"]=="unknown"
      @respuesta_2="No tiene una ubicación asociada"
    else
      @respuesta_2=[]
      lugar=HTTP.get(@response_character["location"]["url"]).parse
      id_lugar=lugar["id"]
      nombre_lugar=lugar["name"]
      @respuesta_2.push(id_lugar, nombre_lugar)
    end
  end
end
