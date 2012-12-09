# coding: utf-8
class PagesController < ApplicationController  
  
  before_filter :authenticate, :only => [:about, :contacts]
  before_filter :admin_authenticate, :only => [:dictionaries]
  
  def about
    @title = "О системе"
  end

  def contacts
    @title = "Контакты"
  end
  
  def welcome
    @title = "Добро пожаловать"
  end
  
  def dictionaries
    @title = "Справочники"
  end
  
  private 
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def admin_authenticate
      deny_access unless admin?
    end
end
