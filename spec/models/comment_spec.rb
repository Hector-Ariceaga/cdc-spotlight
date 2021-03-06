require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:content) }
  end

  context 'relationships' do
    it { should belong_to(:article)}
  end
end
