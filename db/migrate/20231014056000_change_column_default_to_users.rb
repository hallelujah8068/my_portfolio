class ChangeColumnDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :introduction, from: nil, to: "プロフィールが未登録です。編集ページから自己紹介文とアバター画像を登録してプロフィールを表示させましょう。"
  end
end
