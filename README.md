# E-Commerce Store (Kenya Edition) 🇰🇪

A modern, responsive e-commerce web application built with **Ruby on Rails 8**. This application simulates a complete online shopping experience, tailored for the Kenyan market with KSh currency formatting.

## 🚀 Features

*   **🛒 Product Management**: Browse products in a responsive grid layout. View detailed descriptions, prices, and live stock status.
*   **🛍️ Shopping Cart**: 
    *   Add items and update quantities.
    *   Real-time calculation of subtotals and total price.
    *   Persistent cart session.
*   **💳 Checkout System**: 
    *   Secure checkout form with validations.
    *   **Inventory Tracking**: Automatically reduces product stock upon successful order placement.
    *   **Order Confirmation**: Generates a detailed receipt with Order ID.
*   **🎨 Modern UI**: Styled with **Bootstrap 5** and **Bootstrap Icons** for a premium look and feel.
*   **🇰🇪 Localization**: All prices and totals are formatted in **Kenyan Shillings (KSh)**.

## 🛠️ Prerequisites

Ensure you have the following installed:
*   Ruby 3.x
*   Rails 8.x
*   SQLite3

## 📦 Getting Started

Follow these steps to get a local copy up and running.

### 1. Clone the repository
```bash
git clone https://github.com/Larrykj/ecommerce_store-KE.git
cd ecommerce_store-KE
```

### 2. Install Dependencies
Install the required Ruby gems:
```bash
bundle install
```

### 3. Database Setup
Create the database, run migrations, and seed it with sample data:
```bash
rails db:setup
```
*Note: The `db:seed` command will populate the store with 5 sample products (Headphones, Cables, Phone Cases, etc.) so you can start testing immediately.*

### 4. Run the Server
Start the Rails development server:
```bash
rails server
```

### 5. Access the App
Open your web browser and navigate to:
[http://localhost:3000](http://localhost:3000)

## 📂 Key Project Structure

*   **`app/models`**: Contains the core business logic (`Product`, `Cart`, `CartItem`, `Order`, `OrderItem`).
*   **`app/controllers`**: Orchestrates the flow between models and views (`ProductsController`, `CartsController`, `OrdersController`).
*   **`app/views`**: Frontend templates built with ERB and Bootstrap.
*   **`config/routes.rb`**: Defines the application's URL structure.

## 📝 License

This project is open-source and available under the standard MIT license.
