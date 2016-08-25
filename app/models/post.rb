class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  acts_as_votable

  has_attached_file :image, styles: { medium: "700x500#", small: "350x250>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :comments




  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def slug_candidates
    [
      :title,
      [:title, :link]
    ]
  end



end
