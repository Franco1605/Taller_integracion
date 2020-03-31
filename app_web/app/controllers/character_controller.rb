# encoding: utf-8
class CharacterController < ApplicationController
  def show
    @response_character = HTTP.get("https://rickandmortyapi.com/api/character/%d" % params[:id]).parse
    @lista_info_episodes=[]
    for link_episode in @response_character["episode"] do
      par_id_episode=[]
      id_episode=HTTP.get(link_episode).parse["id"]
      nombre_episode=HTTP.get(link_episode).parse["name"]
      par_id_episode.push(id_episode)
      par_id_episode.push(nombre_episode)
      @lista_info_episodes.push(par_id_episode)
    end
    if @response_character["origin"]["name"]=="unknown"
      @id_lugar_origen="No tiene lugar de origen asociado"
    else
      @id_lugar_origen=HTTP.get(@response_character["origin"]["url"]).parse["id"]
    end
    if @response_character["location"]["name"]=="unknown"
      @id_lugar_ubicacion="No tiene ubicación actual"
    else
      @id_lugar_ubicacion=HTTP.get(@response_character["location"]["url"]).parse["id"]
    end
  end
end
