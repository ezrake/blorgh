module Blorgh
  class ReportsController < ApplicationController
    require "csv"

    def show
    end

    def download
      file = generate_csv
      send_file(
        file,
        filename: "csv_report",
        type: "text/csv",
      )
    end

    private

    def generate_csv
      user = main_app.scope.env['warden'].user
      file = "#{Rails.root}/public/#{user.name}_data.csv"
      articles = Article.where(author_id: user.id)
      articles_created = articles.count
      headers = ["Name", "Articles_Created", "Date_Created"]

      CSV.open(file, "w", write_headers: true, headers: headers) do |writer|
        writer << [user.name, articles_created, articles.take.created_at]
      end
      file
    end
  end
end
