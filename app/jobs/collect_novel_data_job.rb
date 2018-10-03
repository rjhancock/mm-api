class CollectNovelDataJob < ApplicationJob
  queue_as :default

  def perform(novel)
    @novel = novel
    current_novel.description = get_description
    update_novel_info
    update_publication_info
    update_chapter_info
    current_novel.save
  end

  private

  def current_novel
    @novel
  end

  def novel_page
    @raw_page ||= open(current_novel.url).read
    @page     ||= Nokogiri::HTML.parse(@raw_page)
  end

  def get_description
    panel = novel_page.at('div.panel:contains("Description:")/div.panel-body')
    panel.text.strip if panel.present?
  end

  def novel_info
    info = {}
    items = novel_page.search('div.panel:contains("Novel Info:")/ul/li')

    items.each do |item|
      key, value = cell_text_to_text(item).split(':', 2).collect(&:strip)
      info[key] = value
    end

    info
  end

  def update_novel_info
    current_novel.series        = novel_info['Series']
    current_novel.prologue_date = text_to_date(novel_info['Prologue Date'])
    current_novel.epilogue_date = text_to_date(novel_info['Epilogue Date'])
  end

  def publication_rows
    novel_page.search('div.panel:contains("Publication Information:")/div/table/tbody/tr')
  end

  def update_publication_info
    publication_rows.each do |row|
      publisher, stock_number, isbn, year, price, cover_image = row.search('td')
      current_publisher = Publisher.find_or_create_by(name: cell_text_to_text(publisher))
      publication       = Publication.find_or_create_by(
        publisher:    current_publisher,
        stock_number: cell_text_to_text(stock_number),
        isbn:         cell_text_to_text(isbn),
        year:         cell_text_to_text(year).to_i,
        price:        cell_text_to_text(price).gsub('$', ''),
        novel:        current_novel
      )

      publication.cover_image.attach(
        io: cover_image_data(cover_image),
        filename: cover_image_url(cover_image).split('/').last
      ) if cover_image?(cover_image) && cover_image_data(cover_image).present?
    end
  end

  def cover_image?(image)
    image.search('a').present?
  end

  def cover_image_url(image)
    fix_url(image.search('a').first)
  end

  def cover_image_data(image)
    @data ||= open(cover_image_url(image)) rescue nil
  end

  def chapter_rows
    novel_page.search('div.panel:contains("Chapter Information:")/div/table/tbody/tr')
  end

  def update_chapter_info
    chapter_rows.each do |row|
      chapter, date, planet_system = row.search('td')

      chapter_name = cell_text_to_text(chapter)
      chapter_date = text_to_date(date)
      chapter_system = System.find_by(name: cell_text_to_text(planet_system))

      Chapter.find_or_create_by(chapter: chapter_name, chapter_date: chapter_date, novel: current_novel, system: chapter_system)
    end
  end
end
