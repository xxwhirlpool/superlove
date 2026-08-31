class HomeController < ApplicationController
  # unicorn_test
  def unicorn_test
  end

  def content
    @page_heading = t(".page_title")
    @page_nav = <<-EOF
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    EOF
    @page_content = <<-EOF
    <h3 class="landmark">#{t(".page_content_landmark")}</h3>
    #{view_context.render("content")}
    EOF
    render action: "shared/page", layout: "application"
  end

  def privacy
    @page_heading = t(".page_title")
    @page_nav = <<-EOF
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    EOF
    @page_content = <<-EOF
    <h3 class="landmark">#{t(".page_content_landmark")}</h3>
    #{view_context.render("privacy")}
    EOF
    render action: "shared/page", layout: "application"
  end

  # terms of service
  def tos
    @page_heading = t(".page_title")
    @page_nav = <<-EOF
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    EOF
    @page_content = <<-EOF
    <h3 class="landmark">#{t(".page_content_landmark")}</h3>
    #{view_context.render("tos")}
    EOF
    render action: "shared/page", layout: "application"
  end

  # terms of service faq
  def tos_faq
    @page_subtitle = t(".page_title")
    render "tos_faq", layout: "application"
  end

  # dmca policy
  def dmca
    @page_heading = t(".page_title")
    @page_content = <<-EOF
    #{view_context.render("dmca")}
    EOF
    render "shared/page", layout: "application"
  end

  # lost cookie
  def lost_cookie
    @page_heading = t(".page_title")
    @page_content = t(".page_content", login_path: new_user_session_path,
                                       feedback_path: new_feedback_report_path)
    render 'shared/page', layout: 'application'
  end

  # for updating form tokens on cached pages
  def token_dispenser
    respond_to do |format|
      format.json { render json: { token: form_authenticity_token } }
    end
  end

  # diversity statement
  def diversity
    @page_heading = t(".welcome_header")
    @page_content = <<-EOF
    #{view_context.render("diversity")}
    EOF
    render "shared/page", layout: "application"
  end

  # site map
  def site_map
    render action: "site_map", layout: "application"
  end

  # donate
  def donate
    @page_heading = t(".page_title")
    @page_content = "<h3>#{t(".financial_subtitle")}</h3>
    #{t(".financial_content")}"
    render "shared/page", layout: "application"
  end

  # about
  def about
    @page_heading = t(".page_heading", appname: ArchiveConfig.APP_NAME)
    @page_content = <<-EOF
    <h3 id="introduction">#{t(".introduction_heading")}</h3>
    #{t(".introduction_content", rules_link: view_context.link_to(t(".introduction_rules_link_text"), tos_path))}
    <h3 id="contact">#{t(".contact_heading")}</h3>
    #{t(".contact_content")}
    <h3 id="credits">#{t(".credits_heading")}</h3>
    #{t(".credits_content")}
    <h3 id="badges">#{t(".badges_heading")}</h3>
    #{t(".badges_content")}
    <h3 id="linkback">#{t(".link_back_heading")}</h3>
    #{t(".link_back_content")}
    EOF
    render "shared/page", layout: "application"
  end

  # home page itself
  def index
    @homepage = Homepage.new(@current_user)
    @random_user = User.unscoped.order(Arel.sql("RAND()")).first
    unless @homepage.logged_in?
      @user_count, @work_count, @fandom_count = @homepage.rounded_counts
    end

    @hide_dashboard = true
    render action: 'index', layout: 'application'
  end
end
