require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it 'success to register WHEN name is not blank' do
      expect(@room).to be_valid
    end

    it 'fail to register WHEN name is blank' do
      @room.name = ""
      @room.valid?
      binding.pry
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end
