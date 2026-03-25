class MenuController < ApplicationController

  # about menu
  def about
    @page_heading = t('.menu_about.page_heading', key: 'header')
    @page_content = view_context.render('menu/menu_about')
    render "shared/page", layout: "application"
  end
  
  # browse menu
  def browse
    render action: "browse", layout: "application"
  end

  # fandoms menu
  def fandoms
    render action: "fandoms", layout: "application"
  end

  # search menu
  def search
    render action: "search", layout: "application"
  end

  def links
    render action: "links", layout: "application"
  end

  def community
    render action: "community", layout: "application"
  end
  
  # links menu
  def links
    render action: "links", layout: "application"
  end
  
  # community menu
  def community
    render action: "community", layout: "application"
  end
  
end
