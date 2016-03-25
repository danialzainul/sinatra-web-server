class AddClickCount < ActiveRecord::Migration
	def change
		add_column :urls, :click_count, :integer, default: 0
	end
end

# urls = table of our table
# click_count = column we want to add
# integer = type of data, t.string / t.integer etc
# default: 0