# frozen_string_literal: true

class AddNameToUser < ActiveRecord::Migration[5.1] # :nodoc:
  def change
    add_column :users, :name, :string
  end
end
