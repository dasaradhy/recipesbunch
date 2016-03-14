# == Schema Information
#
# Table name: chefs
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  recommendations :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Chef, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
