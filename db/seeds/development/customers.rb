city_names = %w(大阪市 神戸市 京都市)

family_names = %w{
  佐藤:サトウ:sato
  鈴木:スズキ:suzuki
  高橋:タカハシ:takahashi
  田中:タナカ:tanaka
  渡辺:ワタナベ:watanabe
  伊藤:イトウ:ito
  山本:ヤマモト:yamamoto
  中村:ナカムラ:nakamura
  小林:コバヤシ:kobayashi
  加藤:カトウ:kato
}

given_names = %w{
  雄太:ユウタ:yuta
  和也:カズヤ:kazuya
  太一:タイチ:taichi
  浩貴:ヒロキ:hiroki
  遼:リョウ:ryo
  芽衣:メイ:mei
  彩花:アヤカ:ayaka
  美咲:ミサキ:misaki
  玲奈:レナ:rena
  萌:モエ:moe
}

company_names = %w(OIAX ABC XYZ)

10.times do |n|
  10.times do |m|
    fn = family_names[n].split(":")
    gn = given_names[m].split(":")

    c = Customer.create!(
      email: "#{fn[2]}.#{gn[2]}@example.jp",
      family_name: fn[0],
      given_name: gn[0],
      family_name_kana: fn[1],
      given_name_kana: gn[1],
      password: "password",
      birthday: 60.years.ago.advance(seconds: rand(40.years)).to_date,
      gender: m < 5 ? "male" : "female"
    )
    if m % 2 == 0
      c.personal_phones.create!(number: sprintf("090-0000-%04d", n * 10 + m))
    end
    c.create_home_address!(
      postal_code: sprintf("%07d", rand(10000000)),
      prefecture: Address::PREFECTURE_NAMES.sample,
      city: city_names.sample,
      address1: "熊内町1-2-3",
      address2: "レイルズマンション301号室"
    )
    if m % 10 == 0
      c.home_address.phones.create!(number: sprintf("03-0000-%04d", n))
    end
    if m % 3 == 0
      c.create_work_address!(
        postal_code: sprintf("%07d", rand(10000000)),
        prefecture: Address::PREFECTURE_NAMES.sample,
        city: city_names.sample,
        address1: "先斗町4-5-6",
        address2: "ルビーマンション2F",
        company_name: company_names.sample
      )
    end
  end
end