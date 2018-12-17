class CreateBarbers < ActiveRecord::Migration[5.2]
  def change

  	  create_table :barbers do |t|   #will create table if it doesn't exist
          t.text :name       
 
          t.timestamps  #automatically created 2 more datetime fields created_at, updated_at

	  end #do


 	 Barber.create :name => 'Jessie Pinkman'
 	 Barber.create :name => 'Walter White'
 	 Barber.create :name => 'Gus Fring'

	end #function

end #class