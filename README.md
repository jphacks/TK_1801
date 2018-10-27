# LeadMe

[![Product Name](image.png)](https://www.youtube.com/watch?v=G5rULR53uMk)

## 製品概要
### Guide Tech

### 背景（製品開発のきっかけ、課題等）
- 今回のプロダクトの開発に至った背景

　日本に来たものの「言語の壁」や「慣れない土地」で現地でガイドを雇おうとする「外国人観光客」は大勢いらっしゃいます．また，2020年に開催される東京オリンピックに伴い，訪日外国人の人数はますます増えると考えられ，同時に彼らの観光をサポートする人材はますます不足していくとも考えられます．このような状況において，観光案内を民間で代行するサービスは必要です．そこで私たちは現在欧米を中心に広く普及しているUberに着目し，提供するものを「白タク」ではなく「白現地ガイド」に置き換えることで，増えていく外国人観光客をサポートしうるサービス「LeadMe」を開発しようと考えました．

　このような，慣れない状況における「不安」や「心配」は訪日外国人だけでなく，私たち日本人にも当てはまることです．異国の地を訪れた際には，少なからずこれらの感情をを抱くと思います．そのようなときに日本語をしゃべることができる現地人にガイドを依頼できたらどんなに頼もしいことか，想像に難くはありません．自分たちも経験しうる問題だからこそ，解決することに意義があり，その先の発展も望めるものだと考えています．
 
### 着目した顧客・顧客の課題・現状
- 顧客
  - 訪日外国人観光客 - この人数は東京オリンピック2020に伴い増加傾向にあるといえる
- 顧客の課題
  - 日本語に不慣れ
  - 通訳ガイドを安く雇いたい - 料金は1日4時間で2万円後半，8時間で3万円後半(『[派遣料金　通訳案内士](http://www.tour-com.jp/guide/cost/index.html)』より)
  - 気軽にガイドを雇いたい
- 現状
  - 通訳ガイド不足
    - 国の施策
      - 観光先進国への新たな国造りに向けて，平成28年3月30日に『明日の日本を支える観光ビジョン構想会議』（議長：内閣総理大臣）において，新たな観光ビジョン『明日の日本を支える観光ビジョン』を策定しました．また，2020年には訪日外国人旅行者4000万人に向けて，「訪日外国人旅行者受入環境整備緊急対策事業」という補助金を導入した．　(2018年6月11日観光庁『[訪日外国人旅行者の受入環境整備](http://www.mlit.go.jp/kankocho/shisaku/kokusai/ukeire.html)』より)
      - 改正通訳案内士法が2018年1月4日に施工された．通訳ガイド（全国通訳案内士）には国家資格が必要であったが，資格を有さなくても有償で通訳案内業務を行えるようになるなど，通訳案内士制度が大きく変わった．（2018年8月6日観光庁『[通訳ガイド制度](http://www.mlit.go.jp/kankocho/shisaku/kokusai/tsuyaku.html)』より）
        - 上記の資料から，日本政府は東京オリンピックに際した外国人観光客数の上昇を見込んでおり，その増加分に耐えうるだけの観光案内人を用意する準備をしていることが分かります．このことからも，今回私たちが進めているプロジェクトの優位性が確認できます．
  - 「ガイドの確保」と「安全の確保」の困難さ
    - 事前に通訳ガイドを予約しなければならない
    - 急に通訳ガイドが欲しくなった時にすぐ雇えない
    - どのガイドが良いのか（安全なのか）を知るすべがなく，安心してガイドを依頼できない
      - 上記に示した資料からも，資格を持たない観光案内人が増加することが予想できます．これは一見すると良いように思えますが，その技術などの不透明性が原因でトラブルになりかねません．このような問題を解決するために，事前にガイド担当者の人となりを知ることができる機能が必要であると考えられます．

### 製品説明（具体的な製品の説明）
- こちらに製品の概要・特徴について説明を記載してください

### 機能
#### 1. 柔軟なガイド依頼
　観光中，急に観光案内してくれる人が欲しい，そんなシチュエーションは誰にでもあります．

#### 2. ガイド提供者の透明性
　案内を依頼するにあたって，ガイドの信頼性や人となりは特に重要な要因になってきます．特に2018年の法改正後，資格がなくとも通訳案内が可能になった影響で，

#### 3. ポイント制
サービス内通貨として「ポイント制」を導入．これにより現金でのやり取りによるトラブルを回避する．そのほか，レビューやランキングなどによってもポイントを稼げるため，地元で稼いだポイントを不慣れな観光地でのガイド料として使うことができる．

#### 4. ランキング制
利用者からのレビューや満足度などにより，ガイドのランキングをつける．

#### 5. ガイド提供者検索
- 端末のGPS座標を1m移動するごとに更新し取得（バックグラウンドでも座標は取得可能）
  - SkyWayを用いることでユーザどうしのGPS座標を共有
- Google Maps APIを用いて地図上に表示
  - 自分の位置を可視化
  - ガイド利用者は付近にいるガイド提供者の情報を取得
  - ガイド提供者は付近にいるガイド利用者の情報を取得
    - 各ユーザの位置情報は非開示
    - 情報：「アイコン」「ユーザネーム」「ポイント」「レビュー」「☆の平均値」など，ユーザ評価に関連
- ガイド利用者は希望するガイド提供者にチャット依頼を送信
  - 承認が得られた段階でチャットルームに移動
- ガイド提供者への依頼が承認
  - チャット相手の位置を取得
 
### 特長・新規性
#### 1. SkyWayを用いた大規模情報共有手段
- Socket通信での情報共有
  - サーバ側のセキュリティの問題で弾かれてしまう
  - scket.io 使用時，IPアドレスを直打ちしないと弾かれてしまう
  - IPアドレス指定方式ではstl通信が不可能
    - 技術的にSocket通信を用いることが不可能
- SkyWay通信での情報共有
  - サーバを介さないため，セキュリティの問題が発生しない
  - アプリケーション起動時共通鍵を接続端末全体で共有し，同チャットルームに所属
    - バックエンドで情報をグローバルに共有
      - 情報：

#### 2. 即日でのガイド雇用
- 既存サービス
  - 事前にガイド利用者と提供者の間で綿密な計画を練る
    - 会ったときの喜びや，満足感に寄与
  - 問題点：急にガイドが必要になるときなど緊急自体への対応が不可能
- LeadMe
  - 自分の好きなタイミングでガイド提供者を探すことが可能
    - 柔軟性の高いサービスが可能
    - あらかじめ決められたものではない，自由度の高い観光が可能
    
#### 3. ポイントの使い道について

### 解決出来ること
- 通訳ガイド不足解消
- 外国人観光客の満足度向上
- 再訪日の可能性向上

### 今後の展望
今回は実現できなかったが、今後改善すること、どのように展開していくことが可能かについて記載をしてください。


## 開発内容・開発技術
### 活用した技術
#### API・データ
今回スポンサーから提供されたAPI、製品などの外部技術があれば記述をして下さい。

* 
* 
* 

#### フレームワーク・ライブラリ・モジュール
* 
* 

#### デバイス
* iPhone
* 

### 研究内容・事前開発プロダクト（任意）
ご自身やチームの研究内容や、事前に持ち込みをしたプロダクトがある場合は、こちらに実績なども含め記載をして下さい。

* 
* 


### 独自開発技術（Hack Dayで開発したもの）
#### 2日間に開発した独自の機能・技術
* 独自で開発したものの内容をこちらに記載してください
* 特に力を入れた部分をファイルリンク、またはcommit_idを記載してください（任意）
