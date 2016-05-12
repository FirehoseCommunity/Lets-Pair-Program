class Post < ActiveRecord::Base
  belongs_to :section
  belongs_to :user
  belongs_to :parent_post, :class_name => "Post", :foreign_key => "parent_post_id"
  has_many :replies, :class_name => "Post", :foreign_key => "parent_post_id", :dependent => :destroy

end
