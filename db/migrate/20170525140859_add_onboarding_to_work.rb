class AddOnboardingToWork < ActiveRecord::Migration
  def change
    add_column :works, :onboarding, :boolean, :default => false
  end
end
