
## System Diagrams for CLI Ticket Sales Calculator

### 1. High-Level Architecture Diagram

This diagram provides an overview of the MVC architecture of the CLI program.

**Components**:
- Models: `Ticket`, `Calculator`, `Discount`
- Views: `OutputView`
- Controllers: `InputController`, `MainController`
- Helpers: `Validation`, `Helper` functions

```mermaid
graph TD
    User -->|interacts| MainController
    MainController -->|gathers input| InputController
    InputController -->|validation| Helper[Helper Functions]
    InputController -->|uses| Validation
    MainController -->|processes data| Calculator
    Calculator -->|uses| Models[Ticket/Discount Models]
    MainController -->|sends data to| OutputView
    OutputView -->|displays| Console[Console Output]
```

### 2. Sequence Diagram

This diagram illustrates the flow of operations in the CLI program, particularly focusing on how a user's input is processed and how output is generated.

**Flow**:
1. User starts the program, interacting with `MainController`.
2. `MainController` calls `InputController` to gather user input.
3. User input is validated and processed.
4. `MainController` uses `Calculator` (Model) to process the data.
5. Results are sent to `OutputView` (View) to display the final output to the user.

```mermaid
sequenceDiagram
    actor User
    participant MainController
    participant InputController
    participant Validation
    participant Calculator
    participant OutputView
    User->>MainController: Starts Program
    MainController->>InputController: get_input()
    InputController->>Validation: validate_input()
    Validation-->>InputController: validation results
    InputController-->>MainController: input_data
    MainController->>Calculator: calculate(input_data)
    Calculator-->>MainController: results
    MainController->>OutputView: show_output(results)
    OutputView-->>User: Display Results
```

### 3. Class Diagram

This diagram shows the relationships between different classes in the CLI program.

**Components**:
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
    MainController --|> InputController : uses
    MainController --|> Calculator : uses
    MainController --|> OutputView : sends data to
    Calculator ..> Ticket : accesses
    Calculator ..> Discount : accesses
```

### Notes

- The High-Level Architecture Diagram provides an overview of the system.
- The Sequence Diagram details the interaction flow in the program.
- The Class Diagram illustrates the relationships and dependencies between classes.
