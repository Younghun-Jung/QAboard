class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      # t.integer :ask_id
      t.belongs_to :ask, index:true
      t.string :author
      t.string :password
      t.text :content

      t.timestamps null: false
    end
  end
end
