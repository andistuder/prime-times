require 'product_table'
require 'terminal-table'

describe ProductTable do
  describe "#generate_table" do
    it "should return an instance of ProductTable" do
      ProductTable.generate_table.should be_an_instance_of(ProductTable)
    end
    it "should return the row parameter in the first row" do
      row = [1,2,3]
      table = ProductTable.generate_table(row,[])
      table.rows[0].drop(1).should == row
    end
    it "should return the column parameter as first values in each row" do
      column = [1,2,3]
      table = ProductTable.generate_table([],column)
      column.each_with_index do |n, i|
        table.rows[i+1][0].should == n
      end
    end
    it "should return the products of column and row parameters as table body" do
      column = [2,3,5]
      row = [7,11,13]
      rows = ProductTable.generate_table(row,column).rows
      column.each_with_index do |nc,ii|
        test_row = rows[ii+1]
        row.each_with_index do |nr, i|
          test_row[i+1].should == nr*nc
        end
      end
    end
    it "should return a nested array if called without parameters" do
      ProductTable.generate_table.rows.should == [[nil]]
    end
  end
  describe "#decorate" do
    it "should add ascii decoration for terminal output" do
      product_table = ProductTable.generate_table
      Terminal::Table.should_receive(:new).with(:rows => product_table.rows)
      product_table.decorate
    end
  end
end