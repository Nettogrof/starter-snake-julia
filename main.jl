using Joseki, HTTP

#=
    This is a simple Battlesnake written in Julia
    For instructions see https://github.com/Nettogrof/starter-snake-julia/blob/main/README.md

=#

#=
    Receive a Get request at  / 
    Return info about Battlesnake Personalize
=#
function index(req::HTTP.Request)
    apiversion = "1"
    author = ""  # TODO: Your Battlesnake Username
    color = "#888888"  # TODO: Personalize
    headType = "default"  # TODO: Personalize
    tailType = "default"  # TODO: Personalize

    dict = Dict("color" => color, "head" => headType, "tail" => tailType, "apiversion" => apiversion, "author" => author)
    simple_json_responder(req,dict)   
end
  
 
 #=
    At start of the game, your snake will receive a /start request, and this function will execute.
    Response will be ignored
 =#
function start(req::HTTP.Request)    
    println("START")
    render(Text, "OK")
end
 
 
#=
    Your snake will receive at /move request at every turn. Use the information provided to determine
    how your Battlesnake will move on that turn, either up, down, left, or right.
=#
function move(req::HTTP.Request)
    #=
        Here some head-up to learn how to parse the request.  (See https://docs.battlesnake.com/references/api#move  for detail about the request)

        Your code could look like:
        
        json = body_as_dict(req)
        boardHeight = json["board"]["height"]
        boardWidth = json["board"]["width"]
        yourSnakeName = json["you"]["name"]
    
   
    =#



    directions = ["up", "down", "left", "right"]    #all directions possibles
    direction = rand(directions)                    #Choose randomly one direction

    shout = ""                                      #your Snake's shout

    response = Dict("move"=>direction , "shout"=>shout) 
    simple_json_responder(req,response)             #Sending the response
end
 
  
 #=
    At end of the game, your snake will receive a /end request, and this function will execute.
    Response will be ignored
 =#
function endGame(req::HTTP.Request)
    println("END")
    render(Text, "OK")
end
  
 
 endpoints = [
     (index, "GET", "/"),
     (start, "POST", "/start"),
     (move, "POST", "/move"),
     (endGame, "POST", "/end")
     
 ]
 r = Joseki.router(endpoints)
 
 # Fire up the server
 println("Server up")
 HTTP.serve(r, "0.0.0.0", 8080; verbose=false, reuseaddr=true) 