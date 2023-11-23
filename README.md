# 動物園チケット販売 (チケット販売計算機)

## 説明

チケット販売計算機は、様々な種類の割引や追加料金を考慮して動物園のチケット価格を計算するコマンドラインインターフェース (CLI) プログラムです。Rubyで構築されており、MVC設計パターンに従っています。

## Features

- チケットタイプ（通常または特別）、カテゴリー（大人、子供、シニア）、および数量に基づいてチケット価格を計算します。
- グループ割引、夕方割引、休日追加料金、平日割引などの割引や追加料金を適用します。
- その日が日本の祝日かどうかを判定します（後日、GoogleカレンダーAPIを実装予定）。
- 詳細な計算結果を出力し、総売上額、価格変更前の金額、価格変更の内訳を表示します。

## インストール

ローカルマシンにリポジトリをクローンしてください：

```bash
git clone https://github.com/your-username/ticket_sales_calculator.git
cd ticket_sales_calculator
```
システムにRubyがインストールされていることを確認してください。Rubyのバージョンは次のコマンドでチェックできます：
```bash
ruby -v
````

## 使用方法

プロジェクトディレクトリに移動し、次のコマンドを実行します：

```bash
ruby main.rb
```

## 構造

アプリケーションは以下のように構成されています：

- `models/`: アプリケーションのビジネスロジックを含む（チケット、割引きおよび計算機クラス）。
- `views/`: ユーザーへのデータ提示を管理する（出力クラス）。
- `controllers`/: ユーザー入力とアプリケーションフローを処理する（入力およびメインコントローラークラス）。
- `helpers`/: ユーティリティ機能とバリデーション。
- `test/`: アプリケーションコンポーネントのユニットテスト。
- `main.rb`: アプリケーションのエントリーポイント。

## Testing
ユニットテストを実行するには、`test/` ディレクトリに移動してテストファイルを実行してください：

```bash
ruby test/test_ticket.rb
ruby test/test_discount.rb
ruby test/test_calculator.rb
```

## 連絡先情報

- 名前: [Shafiul Alam](shafiulshaon@gmail.com)
- プロジェクトリンク: [GitHub Repository](https://github.com/shafiulshaon/zoo-ticketing)
