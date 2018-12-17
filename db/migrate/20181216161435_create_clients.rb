class CreateClients < ActiveRecord::Migration[5.2]
  def change

  	  create_table :clients do |t|   #will create table if it doesn't exist
          t.text :name
          t.text :phone
          t.text :datestamp
          t.text :barber
          t.text :color

          t.timestamps  #automatically created 2 more datetime fields created_at, updated_at
  	  
  	  end
  end #def change
end
