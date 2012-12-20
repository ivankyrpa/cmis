# coding: utf-8

module ApplicationHelper
  def title
    base_title = "Комплексная МИС"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title} "
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? (sort_direction == "asc" ? "icon-chevron-up" : "icon-chevron-down") : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title}       <i class='#{css_class} icon-black'></i>".html_safe, params.merge(:sort => column, :direction => direction, :page => nil)
  end
end
