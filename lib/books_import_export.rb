require 'csv'
class BooksImportExport

  def self.import(file)
    Book.auto_migrate!
    root = User.first
    first = true
    max = []
    CSV.open(file, 'r') do |row|
      if first
        first = false
        p row
      else
        book = Book.new
        book.current_user = root
        date = row[0]
        book.old_id = row[1]
        book.author = row[2]
        book.title = row[3]
        book.edition = row[4]
        book.place_publisher = row[5]
        book.status = row[6]
        book.clas_no = row[7]
        book.year = row[8] == "NA" ? 0 : row[8].to_i
        book.pages = row[9]
        book.volume = row[10]
        book.source = row[11]
        book.cost = row[12]
        book.bill_no = row[13]
        book.isbn = row[14]
        book.keywords = row[15]
        book.remarks = row[16]
        row.each_with_index do |r,i|
          max[i] = r.to_s.size if r.to_s.size > max[i].to_i
        end
        #p book
        if date == "NA" || date.nil? || date.size == 1 || date == "Hindi  play" || date == "Search Dover"
          book.created_on = Date.new(0)
        elsif date =~ /\d+\/\d+\/\d\d\d\d/
          book.created_on = Date.strptime(date, "%d/%m/%Y")
          #puts date + " #{book.created_on}"
        elsif date =~ /\d+\/\d+\/\d\d/
          date.sub!(/\/009\//, '/09/')
          book.created_on = begin
                              Date.strptime(date, "%m/%d/%y")
                            rescue
                              Date.strptime(date, "%d/%m/%y")
                            end
          #puts date + " #{book.created_on}"
        elsif date == "July 1996"
          book.created_on = Date.strptime("1.07.1996", "%d.%m.%Y") 
        elsif date == "28/06"
          book.created_on = Date.strptime("28.06.1997", "%d.%m.%Y")          
        elsif date =~ /\d+.\d+.\d\d\d\d/
          book.created_on = Date.strptime(date, "%d.%m.%Y")          
        elsif date =~ /\d+ \w+[.]? \d\d/ || date =~ /o7$/
          date.sub!(/o7/, '07')
          date.sub!(/Sept/,'Sep')
          date.sub!(/Sept[.]/,'Sep')
          date.sub!(/Sep[.]/,'Sep')
          date.sub!(/sept/,'Sep')
          book.created_on = Date.strptime(date, "%d %b %y")
        elsif date =~ /\d+\w+[.]? \d\d/ 
          book.created_on = Date.strptime(date, "%d%b %y")
        else
          p row
          p date
        end
        unless book.save
          p book.errors
        else
          p book.total
        end
      end
    end
    p max
  end

  def self.export(file)
    CSV.open(file, 'w') do |writer|
      writer << ['Date', 'Accession_no', 'Author', 'Title', 'Edition', 'Place_Publisher', 'Status', 'Clas_No', 'Year', 'Pages', 'Volume', 'Source', 'Cost', 'Bill_No', 'ISBN_No', 'Keywords', 'Remarks']

      Book.all.each do |book|
        row = []
        row << '' + book.created_on.to_s + ''
        row << '' + book.old_id.to_s + ''
        row << '' + book.author.to_s + ''
        row << '' + book.title.to_s + ''
        row << '' + book.edition.to_s + ''
        row << '' + book.place_publisher.to_s + ''
        row << '' + book.status.to_s + ''
        row << '' + book.clas_no.to_s + ''
        row << '' + book.year.to_s + ''
        row << '' + book.pages.to_s + ''
        row << '' + book.volume.to_s + ''
        row << '' + book.source.to_s + ''
        row << '' + book.cost.to_s + ''
        row << '' + book.bill_no.to_s + ''
        row << '' + book.isbn.to_s + ''
        row << '' + book.keywords.to_s + ''
        row << '' + book.remarks.to_s + ''
        writer << row
      end
    end
  end
end
