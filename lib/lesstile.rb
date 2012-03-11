require 'cgi'
require 'uri'

class Lesstile
  VERSION = '1.0'

  CodeDetectionRegex = /---\s*?([\w\s\._+()-]*?)\s*?\n(.*?)---\n/m

  class << self
    # Returns lesstile formatted text as valid XHTML
    #
    # options (all optional):
    # * <tt>text_formatter</tt>: A callback function used to format text.
    # * <tt>code_formatter</tt>: A callback function used to format code. Typically used for syntax highlighting.
    def format_as_xhtml(text, options = {})
      options = default_options.merge(options)

      text += "\n" unless ends_with?(text, "\n")
      text.gsub!(/\r\n/, "\n")
      text = CGI::escapeHTML(text)

      output = ""

      while match = text.match(CodeDetectionRegex)
        captures = match.captures
        code = captures[1]
        lang = blank?(captures[0]) ? nil : captures[0].downcase.strip.intern

        output += 
          options[:text_formatter][match.pre_match] +
          options[:code_formatter][code, lang]

        text = match.post_match
      end
      
      output += options[:text_formatter][text.chomp]
      output
    end

    # Returns lesstile formatted text as valid HTML5
    #
    # options (all optional):
    # * <tt>text_formatter</tt>: A callback function used to format text.
    # * <tt>code_formatter</tt>: A callback function used to format code. Typically used for syntax highlighting.
    def format_as_html(text, options = {})
      format_as_xhtml(text, options)
    end
  
    def default_options
      {
        :code_formatter => lambda {|code, lang| "<pre><code>#{code}</code></pre>" },
        :text_formatter => lambda {|text| 
          text = text.dup
          text.gsub!(/\n/, "<br />\n")
          text.gsub!('&quot;', '"')
          text.gsub!(Regexp.new('"([^"]+)":(' + URI.regexp.to_s + ')'), '<a href="\2">\1</a>')
          text
        }
      }
    end

    private

    # From http://facets.rubyforge.org/
    # Don't add to String since we don't need them that much so why reopen the class

    def ends_with?(string, suffix)
      string.rindex(suffix) == string.size - suffix.size
    end

    def blank?(string)
      string !~ /\S/
    end
  end

  # A formatter that syntax highlights code using CodeRay
  CodeRayFormatter = lambda {|code, lang| 
    CodeRay.scan(CGI::unescapeHTML(code), lang).div(:line_numbers => :table)
  }
end
