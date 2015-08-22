class Todolist < ActiveRecord::Migration
    def change
        create_table :donnees do |t|
            t.string :content
            t.timestamps
        end
    end
end
