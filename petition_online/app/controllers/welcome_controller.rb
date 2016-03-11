class WelcomeController < ApplicationController
  def index
    @petitions = Petition.first(10)
    
  end
end
