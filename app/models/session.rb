# == Schema Information
#
# Table name: sessions
#
#  id              :bigint           not null, primary key
#  expiration_date :datetime
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Session < ApplicationRecord
  belongs_to :user

  def expired?
    expiration_date.past?
  end



end
