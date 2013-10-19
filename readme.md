## 現状
基本仕様はほぼ完成

## 今後の予定
日：RoRで遊びつつ文面のブラッシュアップ

## 簡易インターフェース仕様
	http://{mydomain}/words/getmorning
に対して、
	
	{
		"time":"2013-08-20T18:00:00",
		"emotion":7,
		"character_id":10	//指定なしの場合、 1:default文面となる。他に(10:とりあえず英国うまれの こん○う) が初期データとしてある
	}

の形式のJSONをPOSTすると

	{
		"word":"18時00分 モーニングコールをかけるのは、私デース！"
	}

の形式のJSONデータを返却する

とりあえず3大キャリアで見れればいいかなということで、50文字程度の文面にする予定
（確認メールで笑わせたい！）

## 初期投入データについて
+ db/seeds/default.tsv をエクセルにドラッグして、好きなように編集
+ 保存時に unicode テキスト で保存すればOK

## 詳細仕様
	形式: tsv
	encode: UTF-16LE with BOM
	header:
		character_id : キャラID
		emotion_lower_limit : 感情下限
		emotion_upper_limit : 感情上限
		since : この時間から
		until : この時間まで
		word : 文言
です。

## 確認方法
自分でAPIの確認をするときは、下記Curl及びREST Console を利用しています。

	curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"time":"2013-08-20T18:00:00", "emotion":1, "character_id":10}' http://pppvm1.cloudapp.net/words/getmorning

	curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"time":"2013-08-20T18:00:00", "emotion":1, "character_id":10}' http://pppvm2.cloudapp.net/words/getmorning
