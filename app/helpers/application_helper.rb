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
    css_class = column == sort_column ? (sort_direction == "asc" ? "icon-chevron-up ablack" : "icon-chevron-down ablack") : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title}       <i class='#{css_class} icon-black'></i>".html_safe, params.merge(:sort => column, :direction => direction, :page => nil), :class => 'ablack'
  end

  def link_to_submit(text)
    link_to_function "<i class='icon-trash'></i> #{text}".html_safe, "$(this).closest('form').submit()", :class => 'btn btn-danger'
  end

end
