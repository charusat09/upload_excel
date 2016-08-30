require 'rubygems'
require 'roo'

class UploadExcel
	
	def self.upload
    path = File.expand_path('../lib/files/example.xlsx1', __FILE__)
    spreadsheet = self.open_spreadsheet(path)
    header = spreadsheet.row(1)
    puts "header : #{header}"
    student_ids = spreadsheet.column(header.find_index("ID") + 1).reject(&:nil?)
    puts "student_ids : #{student_ids}"
  end

  def self.open_spreadsheet(path)
    case File.extname(path)
    when ".xls" then Roo::Spreadsheet.open(path, extension: :xls)
    when ".xlsx" then Roo::Spreadsheet.open(path, extension: :xlsx)
    else raise "Unknown file type: #{File.basename path}"
    end
  end
end

puts UploadExcel.upload