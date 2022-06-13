module Blorgh
  class ReportsController < ApplicationController

    def index
      @reports = Report.all
    end

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

  end
end
