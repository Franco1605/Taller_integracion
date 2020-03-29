require "http"
class SearchController < ApplicationController
  def show
    puts (params[:keyword])
    @lista_resultados=[]

    todos_los_episodios=HTTP.get("https://rickandmortyapi.com/api/episode").parse
    num_pages=todos_los_episodios["info"]["pages"].to_i
    (1..num_pages).each do |n|
      episode_page=HTTP.get("https://rickandmortyapi.com/api/episode?page=%d" % n).parse
      for episode in episode_page["results"] do
        information=[]
        id_episode=HTTP.get(episode['url']).parse["id"]
        nombre_episode=HTTP.get(episode['url']).parse["name"]
        if nombre_episode.include? params[:keyword]
          information.push(id_episode)
          information.push(nombre_episode)
          information.push("episode")
          @lista_resultados.push(information)
        end
      end
    end
    todos_los_lugares=HTTP.get("https://rickandmortyapi.com/api/location").parse
    num_pages=todos_los_lugares["info"]["pages"].to_i
    (1..num_pages).each do |n|
      location_page=HTTP.get("https://rickandmortyapi.com/api/location?page=%d" % n).parse
      for location in location_page["results"] do
        information=[]
        id_location=HTTP.get(location['url']).parse["id"]
        nombre_location=HTTP.get(location['url']).parse["name"]
        if nombre_location.include? params[:keyword]
          information.push(id_location)
          information.push(nombre_location)
          information.push("location")
          @lista_resultados.push(information)
        end
      end
    end
    todos_los_personajes=HTTP.get("https://rickandmortyapi.com/api/character/").parse
    num_pages=todos_los_personajes["info"]["pages"].to_i
    (1..num_pages).each do |n|
      character_page=HTTP.get("https://rickandmortyapi.com/api/character/?page=%d" % n).parse
      for character in character_page["results"] do
        information=[]
        id_character=HTTP.get(character['url']).parse["id"]
        nombre_character=HTTP.get(character['url']).parse["name"]
        if nombre_character.include? params[:keyword]
          information.push(id_character)
          information.push(nombre_character)
          information.push("character")
          @lista_resultados.push(information)
        end
      end
    end
  end
end
