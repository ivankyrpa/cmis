class PagesController < ApplicationController
  def about
    @title = "About"
  end

  def contacts
    @title = "Contacts"
  end
end
