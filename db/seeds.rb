# encoding: utf-8

require './db/models.rb'

taro = User.create(
  :real_name => '東工大 太郎',
  :real_name_pron => 'トウコウダイ タロウ',
  :screen_name => 'ぽよ太郎',
  :entrance_year => 1999)

mabo = User.create(
  :real_name => '麻婆 豆腐',
  :real_name_pron => 'マーボウ ドウフ',
  :screen_name => '○ー○○',
  :entrance_year => 2014)

the_bot = User.create(
  :screen_name => 'ザ・ダミー',
  :entrance_year => 2016)

rogiken = Group.create(
  :name => '東工大 ロボット技術研究会',
  :description => '東京工業大学のロボット技術研究会',
  :inauguration_date => Time.local(1981, 5, 1))

poyoken = Group.create(
  :name => 'ぽよ研',
  :description => 'ぽよ〜',
  :inauguration_date => Time.local(1990, 1, 1))

GroupUser.create(
  :group_id => rogiken.id,
  :user_id => mabo.id,
  :entrance_date => Time.local(2016, 4, 2))

GroupUser.create(
  :group_id => poyoken.id,
  :user_id => mabo.id,
  :entrance_date => Time.local(2015, 4, 2))

GroupUser.create(
  :group_id => poyoken.id,
  :user_id => the_bot.id,
  :entrance_date => Time.local(2015, 4, 2),
  :withdrawal_date => Time.local(2015, 4, 3),
  :withdrawal_reason => '音楽性の違い')

Charge.create(
  :name => '部長',
  :user_id => mabo.id,
  :group_id => rogiken.id,
  :year => 2016,
  :description => '部長',
  :inauguration_date => Time.local(2016, 1, 1))

poyo_sns = ContactTool.create(
  :name => 'ぽよSNS',
  :description => 'ぽよぽよしたSNS')

Contact.create(
  :user_id => mabo.id,
  :contact_tool_id => poyo_sns.id,
  :data => '@mabo',
  :description => 'ぽよぽよする用のアカウント')
