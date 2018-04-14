# frozen_string_literal: true

class CreateSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :social_profiles do |t|
      t.belongs_to :user, index: true
      t.string :provider, null: false
      t.string :uid,      null: false
      t.string :name
      t.string :nickname
      t.string :email
      t.string :image_url
      t.string :description
      t.text :raw_json

      t.timestamps
    end

    add_index :social_profiles, %i[provider uid], unique: true
  end
end
