require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryBot.build(:team)
  end

  describe '部活登録機能' do
    context '部活登録できるとき' do
      it '自己紹介以外の全ての項目の入力が存在すれば登録できる' do
        expect(@team).to be_valid
      end
    end
    context '部活登録できないとき' do
      it '部活に紐づくuserが存在しないと登録できない' do
        @team.user = nil
        @team.valid?
        expect(@team.errors.full_messages).to include("Userを入力してください")
      end
      it 'areaが「---」では登録できない' do
        @team.area_id = 1
        @team.valid?
        expect(@team.errors.full_messages).to include("都道府県は正しく選択してください")
      end
      it 'memberが「---」では登録できない' do
        @team.member_id = 1
        @team.valid?
        expect(@team.errors.full_messages).to include("部員数は正しく選択してください")
      end
      it 'team_levelが「---」では登録できない' do
        @team.team_level_id = 1
        @team.valid?
        expect(@team.errors.full_messages).to include("チームのレベルは正しく選択してください")
      end
    end
  end
end