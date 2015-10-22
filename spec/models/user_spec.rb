require 'rails_helper'

describe User do
  it { should have_many :albums}
  it { should have_many :images}
  it { should have_many :tags}
  # it { should validate_attachment_presence(:avatar) }
end
