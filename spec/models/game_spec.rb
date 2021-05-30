require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = FactoryBot.build(:game)
  end
  describe '試合登録機能' do
    context '試合登録できるとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@game).to be_valid
      end
    end
    context '試合登録できないとき' do
      it '試合に紐づくuserが存在しないと登録できない' do
        @game.user = nil
        @game.valid?
        expect(@game.errors.full_messages).to include("Userを入力してください")
      end
      it 'practice_dateが空では登録できない' do
        @game.practice_date = " "
        @game.valid?
        expect(@game.errors.full_messages).to include("日時を正しく入力してください")
      end
      it 'recruitが「---」では登録できない' do
        @game.recruit_id = 1
        @game.valid?
        expect(@game.errors.full_messages).to include("募集は正しく選択してください")
      end
      it 'placeが「---」では登録できない' do
        @game.place_id = 1
        @game.valid?
        expect(@game.errors.full_messages).to include("試合の場所は正しく選択してください")
      end
      it 'battle_levelが空では登録できない' do
        @game.battle_level_id = " "
        @game.valid?
        expect(@game.errors.full_messages).to include("求める対戦相手のレベルを正しく入力してください")
      end
      it 'commentが空では登録できない' do
        @game.comment = " "
        @game.valid?
        expect(@game.errors.full_messages).to include("コメントを正しく入力してください")
      end
    end
  end
end
