class HomeController < ApplicationController
  # unicorn_test
  def unicorn_test
  end

  def content
    @page_heading = t(".page_title")
    @page_content = <<-EOF
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    <h3 class="landmark">#{t(".page_content_landmark")}</h3>
    <div id="content">
      #{view_context.render("content")}
    </div>
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    EOF
    render action: "page", layout: "application"
  end

  def privacy
    @page_heading = t(".page_title")
    @page_content = <<-EOF
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    <h3 class="landmark">#{t(".page_content_landmark")}</h3>
    <div id="content">
      #{view_context.render("privacy")}
    </div>
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    EOF
    render action: "page", layout: "application"
  end

  # terms of service
  def tos
    @page_heading = t(".page_title")
    @page_content = <<-EOF
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    <h3 class="landmark">#{t(".page_content_landmark")}</h3>
    <div id="content">
      #{view_context.render("tos")}
    </div>
    <h3 class="landmark">#{t("a11y.navigation")}</h3>
    #{view_context.render("tos_navigation")}
    EOF
    render action: "page", layout: "application"
  end

  # terms of service faq
  def tos_faq
    @page_subtitle = t(".page_title")
    render action: "tos_faq", layout: "application"
  end

  # dmca policy
  def dmca
    @page_heading = t(".page_title")
    @page_content = <<-EOF
    <div id="content">
      #{view_context.render("dmca")}
    </div>
    EOF
    render action: "page", layout: "application"
  end

  # lost cookie
  def lost_cookie
    render action: 'lost_cookie', layout: 'application'
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
    <p>#{t(".archive_for_you")}</p>

    <p>#{t(".archive_description_html", your_feedback_link: view_context.link_to(t(".your_feedback"), new_feedback_report_path))}</p>

    <p>#{t(".what_we_do_html",
            archive_team_link: view_context.link_to(t(".archive_team"), admin_posts_path))}</p>

    <p>#{t(".you_can_html",
            few_restrictions_link: view_context.link_to(t(".few_restrictions"), content_path),
            terms_of_service_link: view_context.link_to(t(".terms_of_service"), tos_path))}</p>

    <p>#{t(".still_missing_html",some_essential_parts_link: view_context.link_to(t(".some_essential_parts"), admin_post_path(295)))}</p>

    <p>#{t(".why_we_build")}</p>

    <p>#{t(".we_build_for")}</p>

    <br />
    
    <p>
      #{t(".dreamwidth_remix_html",
            dreamwidth_link: view_context.link_to(t(".dreamwidth"), "http://www.dreamwidth.org"),
            diversity_statement_link: view_context.link_to(t(".diversity_statement"), "http://www.dreamwidth.org/legal/diversity"))}
    </p>

    <p>
      <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">
        <img alt="#{t(".license.image_alt")}" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
      </a>
      <br />
      #{t(".license.html", creative_commons_by_sa_link: view_context.link_to(t(".license.creative_commons_by_sa"), "http://creativecommons.org/licenses/by-sa/3.0/"))}
    </p>
    EOF
    render action: "page", layout: "application"
  end

  # site map
  def site_map
    render action: "site_map", layout: "application"
  end

  # donate
  def donate
    @page_subtitle = t(".page_title")
    render action: "donate", layout: "application"
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
    render action: "page", layout: "application"
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
