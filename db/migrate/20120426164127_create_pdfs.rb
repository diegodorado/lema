class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :title
      t.references :pdfable, :polymorphic => true
      t.timestamps
    end
  end
end
