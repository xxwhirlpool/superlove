module CssCleaner

  # AO3's default CSS cleaner is useless and hacky.
  # The only important things to do are:
  # 1. Make sure the CSS doesn't escape its <style> element.
  # 2. Apply a scope when supplied via the "scope" option.
  def clean_css_code(css_code, options = {})
    return "" if !css_code.match(/\w/) # only spaces of various kinds
    clean_css = css_code
    scope = options[:scope]

    # If scope is specified, wrap the whole stylesheet in a @scope block.
    # The CSS *can* escape this scope by including a top-level unmatched },
    # but absent a real CSS parser, this seems low-importance to care about.
    if scope
      clean_css = "@scope (#{scope}) {\n#{clean_css}\n}"
    end

    # The only way to escape a <style> block is for the substring `</style`,
    # literally and exactly (including no ws, but including all case permutations),
    # to show up anywhere in the stylesheet.
    # (Including, say, inside of a CSS string, so we can't rely on CSS parsing here.)
    # There's no real reason for that to show up by accident,
    # so we'll just blank out any line that has the substring.
    clean_css.gsub!(/^.*<\/style.*$\n?/i, '')

    return clean_css
  end
end
