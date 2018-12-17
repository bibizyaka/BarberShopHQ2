class CreateContacts < ActiveRecord::Migration[5.2]
  def change
     
  	  create_table :contacts do |t|   #will create table if it doesn't exist
          t.text :email
          t.text :comments
      
          t.timestamps  #automatically created 2 more datetime fields created_at, updated_at
  	  
  	  end

  end
end
