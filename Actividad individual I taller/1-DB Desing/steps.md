# Database Design Process: Library Management System

## 1. Requirement Analysis
* **User Management:** Maintain records of members for accountability.
* **Inventory Tracking:** Catalog books with unique IDs, authors, and stock availability.
* **Transaction Logging:** Track the lifecycle of a book loan (Check-out/Check-in).
* **Reservation System:** Manage queueing for high-demand assets.

## 2. Logical Data Modeling (ERD)
The schema is designed using an **Entity-Relationship Diagram (ERD)** with the following core entities:
* `Users`: Identity management.
* `Books`: Asset management.
* `Loans`: Transactional logs.
* `BookCategories`: Metadata classification.
* `Staff`: Internal access/administrative roles.

## 3. Business Rules & Cardinality
* **1:N (One-to-Many):** A single `User` can initiate multiple `Loans`.
* **1:N (One-to-Many):** A `Category` can be assigned to multiple `Books`.
* **M:N (Many-to-Many) Resolved:** The `Loans` and `Reservations` tables act as associative entities between `Users` and `Books`.

## 4. Normalization Strategy
* **1NF:** Ensured all attributes are atomic (e.g., separating First and Last names).
* **2NF:** Removed partial dependencies; all non-key attributes are fully functional on the Primary Key.
* **3NF:** Eliminated transitive dependencies. For example, `CategoryName` is moved to `BookCategories` so it doesn't depend on `BookID`.

## 5. Security & Integrity Considerations
* **Referential Integrity:** Enforced via Foreign Keys (FK) to prevent orphaned loan records.
* **Data Constraints:** * `NN` (Not Null) applied to critical fields like `LoanDate` and `Email`.
    * `AvailableCopies` must be tracked to prevent over-lo