require 'rubygems'
require 'roo'

class UploadExcel
	
	def self.upload
    path = File.expand_path('../lib/files/example.xlsx', __FILE__)
    spreadsheet = self.open_spreadsheet(path)
    header = spreadsheet.row(1)
    puts "header : #{header}"
    student_ids = spreadsheet.column(header.find_index("ID") + 1).reject(&:nil?)
    puts "student_ids : #{student_ids}"
  end

  def self.open_spreadsheet(path)
    file = Roo::Spreadsheet.open(path, extension: :xlsx)
    if file
    	file
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end

puts UploadExcel.upload