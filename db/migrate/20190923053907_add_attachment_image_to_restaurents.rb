class AddAttachmentImageToRestaurents < ActiveRecord::Migration
  def self.up
    change_table :restaurents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :restaurents, :image
  end
end
