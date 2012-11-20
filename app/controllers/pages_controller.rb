class PagesController < ApplicationController
  def about
    @title = "About"
  end

  def contacts
    @title = "Contacts"
  end
  
  def welcome
    if current_user.nil?
      @title = "Welcome"
    else
      redirect_to current_user
    end
  end
  
  def dictionaries
  end
end
