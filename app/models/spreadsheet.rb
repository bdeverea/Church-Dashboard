class Spreadsheet < ActiveRecord::Base
  attr_accessor :file 
  has_attached_file :workbook

  serialize :headers, Array
  serialize :content, Array

  validates_attachment :workbook, :presence => true,
  :size => { :in => 0..10.megabytes }

  validates_attachment_content_type :workbook, :content_type => %w(application/xml application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet),
                                                :message => ', Only XML, EXCEL files are allowed. '


  def self.import(file)
    workbook = open_spreadsheet(file)

    new(name: "Test 1", description: "Test description")

  end

private

  def self.open_spreadsheet(file)
    f = File.open(file)
    case File.extname(f)
      when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(f.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
