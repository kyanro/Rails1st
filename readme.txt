現状
	jsonのpostに対して、jsonのデータを返すところまで完成
	最悪の場合でも固定文面を返すことができるようにはなりました！

今後の予定
	火：(localhostではなく)外部からAPIを叩けるようにする
	水：時間に応じた文面を返す
	木：RoRで遊びつつ文面のブラッシュアップ
	金：RoRで遊びつつ文面のブラッシュアップ
	土：RoRで遊びつつ文面のブラッシュアップ


簡易インターフェース仕様（予定）
	http://{mydomain}/words/getmorning
	に対して、
	
	{
		"time":"2013-08-20T18:00:00",
		"emotion":0,
		"character":1	//1:男性向け文面　2:女性向け文面 3以降は未定（拡張容易）
	}

	の形式のJSONをPOSTすると

	{
		"word":"18時00分ね。わかったわ。でも、一体いつまで寝ているつもりなのこのダメ人間！"
	}

	の形式のJSONデータを返却する

	とりあえず3台キャリアで見れればいいかなということで、50文字程度の文面にする予定
		（確認メールで笑わせたい！）


自分でAPIの確認をするときは、下記Curl及びREST Console を利用しています。

curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"time":"2013-08-20T18:00:00", "emotion":0}' http://localhost:3000/words/getmorning

