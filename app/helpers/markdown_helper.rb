module MarkdownHelper

  def to_markdown(text)
    options = { hard_wrap: true,
                filter_html: true,
                autolink: true,
                no_intra_emphasis: true,
                fenced_code_blocks: true,
                gh_blockcode: true
              }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(text)
    syntax_highlighter(markdown).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//code[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
