module Blorgh
  class CreateReportsJob < ApplicationJob
    require "csv"
    queue_as :default

    def perform(*args)
      user = args[0]
      file = "#{Rails.root}/public/#{Time.now}_data.csv"
      articles = Article.where(author_id: user.id)
      articles_created = articles.count
      headers = ["Name", "Articles_Created", "Date_Created"]

      CSV.open(file, "w", write_headers: true, headers: headers) do |writer|
        writer << [user.email, articles_created, articles.take.created_at]
      end
      @report = Report.new(
        user_id: user.id, 
        file_url: file
      )
      @report.save
    end
  end
end
