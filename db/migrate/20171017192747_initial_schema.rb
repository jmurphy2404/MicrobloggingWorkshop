class InitialSchema < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname
  		t.integer :age
  		t.string :password
  	end
  	create_table :posts do |t|
  		t.references :user, foreign_key: {to_table: :users}, index: true
  		t.text :body
  		t.integer :calories
  		t.string :category
  		t.string :title
  		t.datetime :created_at
  	end
  end
end
