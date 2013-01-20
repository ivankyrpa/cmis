class ChangeFloatTypeInFRecommendation < ActiveRecord::Migration
  def self.up
   change_column :f_recommendations, :low_c, :integer
   change_column :f_recommendations, :low_dc, :integer
   change_column :f_recommendations, :high_c, :integer
   change_column :f_recommendations, :high_dc, :integer
  end

  def self.down
   change_column :f_recommendations, :low_c, :decimal
   change_column :f_recommendations, :low_dc, :decimal
   change_column :f_recommendations, :high_c, :decimal
   change_column :f_recommendations, :high_dc, :decimal
  end
end
