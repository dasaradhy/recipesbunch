namespace :rb do
  desc "recipesbunch tasks"
  task prune_images: :environment do
    exit unless ['development','test'].include?(Rails.env)
    images=Recipe.all.collect{|recipe|recipe.images||[]}.reduce(:+).uniq
    Dir.glob("#{Rails.root}/public/uploads/media/*").count
  end

end
