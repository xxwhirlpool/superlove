# Sanitize: http://github.com/rgrove/sanitize.git
class Sanitize
  # This defines the configuration we use for HTML tags and attributes allowed in the archive.
  module Config
    ARCHIVE = freeze_config(
      elements: %w[
        a abbr acronym address b big blockquote br caption center cite code col
        colgroup details figcaption figure dd del dfn div dl dt em h1 h2 h3 h4 h5 h6 hr
        i img ins kbd li object ol p pre q rp rt ruby s samp script small span strike strong
        style sub summary sup table tbody td textarea tfoot th thead tr tt u ul var
      ],
      attributes: {
        all: %w[align title dir],
        "a" => %w[href name data-bibi data-bibi-style class],
        "blockquote" => %w[cite],
        "col" => %w[span width],
        "colgroup" => %w[span width],
        "details" => %w[open],
        "div" => %w[align id style],
        "h1" => %w[id],
        "h2" => %w[id],
        "h3" => %w[id],
        "h4" => %w[id],
        "h5" => %w[id],
        "h6" => %w[id],
        "hr" => %w[align width],
        "i" => %w[class],
        "img" => %w[align alt border height src style width],
        "object" => %w[type data class width height],
        "ol" => %w[start type],
        "p" => %w[style],
        "q" => %w[cite],
        "script" => %w[script src],
        "table" => %w[border summary width],
        "td" => %w[abbr axis colspan height rowspan width],
        "th" => %w[abbr axis colspan height rowspan scope width],
        "ul" => %w[type]
      },

      add_attributes: {
        "a" => { "rel" => "nofollow" }
      },

      protocols: {
        "a" => { "href" => ["ftp", "http", "https", "mailto", :relative] },
        "blockquote" => { "cite" => ["http", "https", :relative] },
        "img" => { "src" => ["http", "https"] },
        "q" => { "cite" => ["http", "https", :relative] },
        "script" => { "src" => ["http", "https"] }
      },
      
      css: {
        properties: %w[text-align width]
      },
      
      # TODO: This can be removed once we upgrade sanitizer gem, AO3-5801
      # I would leave the tests we added in AO3-5974 though.
      remove_contents: %w[iframe math noembed noframes noscript plaintext svg xmp]
    )

    CLASS_ATTRIBUTE = freeze_config(
      # see in the Transformers section for what classes we strip
      attributes: {
        all: ARCHIVE[:attributes][:all] + ["class"]
      }
    )

    CSS_ALLOWED = freeze_config(merge(ARCHIVE, CLASS_ATTRIBUTE))

    # On details elements, force boolean attribute "open" to have
    # value "open", if it exists
    OPEN_ATTRIBUTE_TRANSFORMER = lambda do |env|
      return unless env[:node_name] == "details"

      env[:node]["open"] = "open" if env[:node].has_attribute?("open")
    end

    # On img elements, convert relative paths to absolute:
    RELATIVE_IMAGE_PATH_TRANSFORMER = lambda do |env|
      return unless env[:node_name] == "img" && env[:node]["src"]

      env[:node]["src"] = URI.join(ArchiveConfig.APP_URL, env[:node]["src"])
    rescue URI::InvalidURIError
      # do nothing, the sanitizer will handle it
    end
  end
end
