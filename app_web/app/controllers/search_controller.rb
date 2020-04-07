require "http"
class SearchController < ApplicationController
  def show
    puts (params[:keyword])
    @lista_resultados=[]

    todos_los_episodios=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/episode/?name=" + params[:keyword]).parse
    if todos_los_episodios["error"]=="There is nothing here"
      @lista_resultados.push(["", "No hay episodios asociados","episode"])
    else
      num_pages=todos_los_episodios["info"]["pages"].to_i
      (1..num_pages).each do |n|
        episode_page=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/episode/?page=%d&name=%s" % [n, params[:keyword]]).parse
        for episode in episode_page["results"] do
          information=[]
          id_episode=episode["id"]
          nombre_episode=episode["name"]
          information.push(id_episode)
          information.push(nombre_episode)
          information.push("episode")
          @lista_resultados.push(information)
        end
      end
      puts @lista_resultados
    end
    todos_los_lugares=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/location/?name=" + params[:keyword]).parse
    if todos_los_lugares["error"]=="There is nothing here"
      @lista_resultados.push(["", "No hay lugares asociados","location"])
    else
      num_pages=todos_los_lugares["info"]["pages"].to_i
      (1..num_pages).each do |n|
        location_page=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/location/?page=%d&name=%s" % [n, params[:keyword]]).parse
        for location in location_page["results"] do
          information=[]
          id_location=location["id"]
          nombre_location=location["name"]
          information.push(id_location)
          information.push(nombre_location)
          information.push("location")
          @lista_resultados.push(information)
        end
      end
    end
    todos_los_personajes=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/?name=" + params[:keyword]).parse
    if todos_los_personajes["error"]=="There is nothing here"
      @lista_resultados.push(["", "No hay personajes asociados","character"])
    else
      num_pages=todos_los_personajes["info"]["pages"].to_i
      (1..num_pages).each do |n|
        character_page=HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/?page=%d&name=%s" % [n, params[:keyword]]).parse
        for character in character_page["results"] do
          information=[]
          id_character=character["id"]
          nombre_character=character["name"]
          information.push(id_character)
          information.push(nombre_character)
          information.push("character")
          @lista_resultados.push(information)
        end
      end
    end
  end
end
