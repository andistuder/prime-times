require 'terminal-table'

class ProductTable
  attr_accessor :rows

  def self.generate_table(row=[], column=[])
    n_row = []
    n_row[1..(row.length+1)] = row
    product_table = new
    product_table.rows = [[nil]+row]

    column.each_index do |ii|
      n_row = [column[ii]]
      row.each_index do |i|
        n_row << column[ii]*row[i]
      end
      product_table.rows << n_row
    end

    product_table
  end

  def decorate
    Terminal::Table.new :rows => rows
  end
end