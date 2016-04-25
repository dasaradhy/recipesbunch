require 'rails_helper'

describe 'MediaManager' do

  it "should load images from URL and should remove images successfully" do
    uploaded_url = MediaManager.store_remote('https://robohash.org/recipesbunch.jpg?size=1000x1000')
    expect(uploaded_url).to match(/png\z/)
    expect(File.exist?("#{Rails.root}/public#{uploaded_url}")).to be true
    MediaManager.remove_image(uploaded_url)
    expect(File.exist?("#{Rails.root}/public#{uploaded_url}")).to be false
  end

  it "should load images from a file and should remove images successfully" do
    image_file=File.open("#{Rails.root}/test/rb_test_image.jpg", 'rb' )
    uploaded_url = MediaManager.store_file(image_file)
    expect(uploaded_url).to match(/png\z/)
    expect(File.exist?("#{Rails.root}/public#{uploaded_url}")).to be true
    MediaManager.remove_image(uploaded_url)
    expect(File.exist?("#{Rails.root}/public#{uploaded_url}")).to be false
  end

end