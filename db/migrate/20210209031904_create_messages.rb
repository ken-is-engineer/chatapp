class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, foreign_key: true #userモデルのidと紐づかなければならない、という意味なので、必然的に空はNG　＝　presenceの設定は不要。
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
