Rails.application.routes.draw do



  # Routes for the Genre resource:

  # CREATE
  post("/insert_genre", { :controller => "genres", :action => "create" })
          
  # READ
  get("/genres", { :controller => "genres", :action => "index" })
  
  get("/genres/:path_id", { :controller => "genres", :action => "show" })
  
  # UPDATE
  
  post("/modify_genre/:path_id", { :controller => "genres", :action => "update" })
  
  # DELETE
  get("/delete_genre/:path_id", { :controller => "genres", :action => "destroy" })

  #------------------------------

  # Routes for the Videogame resource:

  # CREATE
  post("/insert_videogame", { :controller => "videogames", :action => "create" })
          
  # READ
  get("/videogames", { :controller => "videogames", :action => "index" })
  
  get("/videogames/:path_id", { :controller => "videogames", :action => "show" })
  
  # UPDATE
  
  post("/modify_videogame/:path_id", { :controller => "videogames", :action => "update" })
  
  # DELETE
  get("/delete_videogame/:path_id", { :controller => "videogames", :action => "destroy" })

  #------------------------------

  # Routes for the Recommendation resource:

  # CREATE
  post("/insert_recommendation", { :controller => "recommendations", :action => "create" })
          
  # READ
  get("/recommendations", { :controller => "recommendations", :action => "index" })
  
  get("/recommendations/:path_id", { :controller => "recommendations", :action => "show" })
  
  # UPDATE
  
  post("/modify_recommendation/:path_id", { :controller => "recommendations", :action => "update" })
  
  # DELETE
  get("/delete_recommendation/:path_id", { :controller => "recommendations", :action => "destroy" })

  #------------------------------

  # Routes for the Friend request resource:

  # CREATE
  post("/insert_friend_request", { :controller => "friend_requests", :action => "create" })
          
  # READ
  get("/friend_requests", { :controller => "friend_requests", :action => "index" })
  
  get("/friend_requests/:path_id", { :controller => "friend_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_friend_request/:path_id", { :controller => "friend_requests", :action => "update" })
  
  # DELETE
  get("/delete_friend_request/:path_id", { :controller => "friend_requests", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
