# == Schema Information
#
# Table name: junket_filters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  term       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  value_type :string(255)
#

module Junket
  RSpec.describe Filter, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end