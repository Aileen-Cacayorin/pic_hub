require 'rails_helper'

describe Image do

  it { should belong_to :album }
  it { should have_many :comments }
  it { should belong_to :user }
  it { should have_many :tags }
  it { should validate_attachment_presence(:picture) }
end
