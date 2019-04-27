class Vote < ApplicationRecord
  belongs_to :entry
  belongs_to :member

  validate do
    unless member && member.votable_for?(entry)
      errors.add(:base, :invalid)
    end
  end



  has_many :images, class_name: "EntryImage"
  has_many :votes, dependent: :destroy
  has_many :votes, through: :votes, source: :member


  STATUS_VALUE = %w(draft member_only public)
end
