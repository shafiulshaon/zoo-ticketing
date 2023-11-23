
## CLIチケット販売計算システム図

### 1. 高レベルアーキテクチャ図

この図は、CLIプログラムのMVCアーキテクチャの概要を提供します。

**コンポーネント**:
- モデル: `Ticket`, `Calculator`, `Discount`
- ビュー: `OutputView`
- コントローラー: `InputController`, `MainController`
- ヘルパー: `Validation`, `Helper` 関数

```mermaid
graph TD
    User -->|対話| MainController
    MainController -->|入力を集める| InputController
    InputController -->|検証| Helper[ヘルパー関数]
    InputController -->|使用| Validation
    MainController -->|データを処理| Calculator
    Calculator -->|使用| Models[Ticket/Discount モデル]
    MainController -->|データを送る| OutputView
    OutputView -->|表示| Console[コンソール出力]
```

### 2. シーケンス図

この図は、CLIプログラムの操作の流れを示し、特にユーザーの入力がどのように処理され、出力が生成されるかに焦点を当てています。

**フロー**:
1. ユーザーがプログラムを開始し、`MainController`と対話します。
2. `MainController`はユーザーの入力を集めるために`InputController`を呼び出します。
3. ユーザー入力が検証され、処理されます。
4. `MainController`はデータを処理するために`Calculator`（モデル）を使用します。
5. 結果は`OutputView`（ビュー）に送られ、最終出力をユーザーに表示します。

```mermaid
sequenceDiagram
    actor User
    participant MainController
    participant InputController
    participant Validation
    participant Calculator
    participant OutputView
    User->>MainController: プログラム開始
    MainController->>InputController: get_input()
    InputController->>Validation: validate_input()
    Validation-->>InputController: 検証結果
    InputController-->>MainController: input_data
    MainController->>Calculator: calculate(input_data)
    Calculator-->>MainController: 結果
    MainController->>OutputView: show_output(results)
    OutputView-->>User: 結果表示
```

### 3. クラス図

この図は、CLIプログラム内の異なるクラス間の関係を示しています。

**コンポーネント**:
- `Ticket`
- `Calculator`
- `Discount`
- `InputController`
- `MainController`
- `OutputView`

```mermaid
classDiagram
    class MainController {
      -run()
    }
    class InputController {
      -get_input()
    }
    class OutputView {
      -show_output()
    }
    class Calculator {
      -calculate()
    }
    class Ticket {
      +price()
    }
    class Discount {
      +group_discount()
      +evening_discount()
      +holiday_surcharge()
      +weekday_discount()
    }
    MainController --|> InputController : 使用
    MainController --|> Calculator : 使用
    MainController --|> OutputView : データ送信
    Calculator ..> Ticket : アクセス
    Calculator ..> Discount : アクセス
```

### 備考

- 高レベルアーキテクチャ図は、システムの概要を提供します。
- シーケンス図は、プログラム内の相互作用の流れを詳細に説明します。
- クラス図は、クラス間の関係と依存関係を示します。
