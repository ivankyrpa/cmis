class PagesController < ApplicationController  
  
  before_filter :authenticate, :only => [:about, :contacts]
  before_filter :admin_authenticate, :only => [:dictionaries]
  
  def about
    @title = "About"
  end

  def contacts
    @title = "Contacts"
  end
  
  def welcome
    @title = "Welcome"
  end
  
  def dictionaries
    @title = "Dictionaries"  
  end
  
  private 
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def admin_authenticate
      deny_access unless admin?
    end
end
