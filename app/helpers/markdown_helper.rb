module MarkdownHelper
  RENDER = Redcarpet::Render::HTML

  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(RENDER, options).render(text)
    syntax_highlighter(markdown).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.css('code').each { |code| colorize(code) }
    doc.to_s
  end

  def colorize(code)
    return unless code[:class]
    div = CodeRay.scan(code.text.rstrip, code[:class].to_sym).div
    code = code.replace(div)
    code.first.parent.swap(code.first)
  end

  def options
    @options = {
      hard_wrap: true,
      filter_html: true,
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      gh_blockcode: true
    }
  end
end
