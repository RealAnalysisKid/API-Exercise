class AddTrainLogoToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :train_logo, :string
  end
end
