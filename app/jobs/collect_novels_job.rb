class CollectNovelsJob < ApplicationJob
  queue_as :default

  def perform
    loop do
      current_page.search('table/tbody/tr').each do |row|
        title, author, start_date, end_date = row.search('td')

        new_title   = cell_text_to_text(title)
        new_author  = cell_text_to_text(author)

        novel             = Novel.find_or_create_by(title: new_title)
        novel.title       = new_title
        novel.start_date  = text_to_date(start_date)
        novel.end_date    = text_to_date(end_date)
        novel.url         = fix_url(title.search('a').first)
        novel.author      = Author.find_or_create_by(name: new_author)
        novel.save
        CollectNovelDataJob.perform_later(novel)
      end

      next_page
      break unless next_link?
    end
  end

  private

  def initial_page
    raw = open('https://isatlas.teamspam.net/novel.php').read
    Nokogiri::HTML.parse(raw)
  end

  def current_page
    @current_page ||= initial_page
  end

  def set_current_page(page)
    @current_page = page
  end

  def next_link
    ul = current_page.search('ul.pagination').first
    li = ul.search('li').last
    return nil if (li['class'] == 'disabled')
    fix_url(li.search('a').first)
  end

  def next_link?
    next_link.present?
  end

  def next_page
    return unless next_link?
    raw = open(next_link).read
    set_current_page(Nokogiri::HTML.parse(raw))
  end
end
