# 🛍️ ShopNest



**ShopNest** is a full-stack E-commerce application built using the **Flutter** framework for the frontend and **Node.js + Express.js** for the backend. It uses **MongoDB** as the database and **Provider** for state management.

This app supports both **Admin** and **User** functionalities, aiming to replicate the core features of an online retail platform.

---

## ⚙️ Tech Stack

- **Frontend:** Flutter
- **State Management:** Provider
- **Backend:** Node.js, Express.js
- **Database:** MongoDB
- **Authentication:** JSON Web Tokens (JWT)
- **Payment:** Mock Payment via Flutter Pay

---

## 🎯 Key Features

### 🔐 Authentication
[▶️ Authentication ](https://drive.google.com/file/d/12mWNUXpCsMPzbD04OZnVmiUoavL-HhU2/view?usp=drive_link)
- JWT-based authentication system.
- Persistent login state using tokens.

### 🛠️ Admin Features
![Untitled (590 x 300 px) (1)](https://github.com/user-attachments/assets/2a6b54c3-5088-4eef-8525-2ba04ecd2c25)



[▶️ Adding a Product ](https://drive.google.com/file/d/1VjKGDN0zfrrlxPrJ1H_GO-yk-WRystux/view?usp=sharing)
[▶️ Update Order Status-By Admin ](https://drive.google.com/file/d/119XifHBKy5g7S3RxxKf8rPaOKYt4O2oc/view?usp=sharing)


- Add new products with image and category.
- View category-wise sales in pie chart format.
- Manage all customer orders and update their status in real-time.

### 🧑 User Features
![Untitled (900 x 300 px)](https://github.com/user-attachments/assets/bbbee1a0-55fe-485e-82a3-516cdbc203c5)



[▶️ Search Feature ](https://drive.google.com/file/d/18xBeUHuicni2wbKL2EiGyODQX0lEbk4T/view?usp=sharing)
[▶️ Adding to Cart ](https://drive.google.com/file/d/1wPEuq4iedfnuU_013MSLjz0fbNcUbyJD/view?usp=sharing)
[▶️ Order ](https://drive.google.com/file/d/1ZjhUFsLyc9-z980ZDHUamaSelSzGrUmb/view?usp=sharing)


- View personalized "Deal of the Day".
- Browse products by category.
- Search for products and view detailed info.
- Rate products with real-time updates.
- Add items to cart and manage quantity in real-time.
- Save delivery address and place orders.
- Rate products with real-time updates.
- View past orders and their statuses.

### 💳 Payment System
- Mock payment integrated using **Flutter Pay**.
- Secure order placement after address validation.

### ⭐ Product Rating
[▶️ Rate the Product ](https://drive.google.com/file/d/1e2RAUvCA9gxHm6DyG4b0GCD9Z-tH3q4o/view?usp=sharing)
- Users can rate products.
- Real-time average rating displayed for each product.

### 🛒 Cart Management
[▶️ Adding to Cart ](https://drive.google.com/file/d/1wPEuq4iedfnuU_013MSLjz0fbNcUbyJD/view?usp=sharing)

- Live cart updates with quantity changes.
- Cart state synced across screens via Provider.

### 📦 Order & Order Status
[▶️ Update Order Status-By Admin ](https://drive.google.com/file/d/119XifHBKy5g7S3RxxKf8rPaOKYt4O2oc/view?usp=sharing)
[▶️ Get Updated Order Status ](https://drive.google.com/file/d/1QlgEpOleXWqGKKgEeCREnBabiQRNu2ol/view?usp=sharing)

- Users can place multiple orders.
- Admin can update order statuses in real-time.

---
## Getting Started

Follow the steps below to run the project locally:

### 1. Clone the Repository

```bash
git clone <[Shopnest](https://github.com/RageRaghav/ShopNest/)>
cd your-repo-folder
```

### 1. Add Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```
---

## 🔁 User Panel Navigation Flow

```mermaid
flowchart LR
    %% Define styles with vibrant and random colors
    classDef terminal fill:#FFD3B6,stroke:#FF8B94,stroke-width:2px,color:#6A0572,font-weight:bold;
    classDef main fill:#D5AAFF,stroke:#9B5DE5,stroke-width:2px,color:#3A0CA3,font-weight:bold;
    classDef screen fill:#CAFFBF,stroke:#70D6FF,stroke-width:2px,color:#007F5F,font-weight:bold;
    classDef action fill:#FDFFB6,stroke:#FFADAD,stroke-width:2px,color:#9D0208,font-style:italic;

    %% Nodes
    A[BottomBar]:::terminal

    A --> B[Home Screen]:::main
    B --> B1[Search Screen]:::screen
    B1 --> B2[Searched Product Screen]:::screen
    B --> C[Category Products Screen]:::screen
    C --> C1[Product Details Screen]:::screen

    A --> D[Account Screen]:::main
    D --> D1[Logout Button]:::action
    D1 --> D2[Authentication Screen]:::screen
    D --> D3[My Orders]:::screen
    D3 --> D4[Order Details Screen]:::screen

    A --> E[Cart Screen]:::main
    E --> F[Address Screen / Payment Screen]:::screen

```
## 🛠️ Admin Panel Navigation Flow

```mermaid
flowchart LR
    %% Random vibrant style definitions
    classDef terminal fill:#A0C4FF,stroke:#3A86FF,stroke-width:2px,color:#1A1A40,font-weight:bold;
    classDef main fill:#FFC6FF,stroke:#C77DFF,stroke-width:2px,color:#5C007A,font-weight:bold;
    classDef screen fill:#FDFFB6,stroke:#FFADAD,stroke-width:2px,color:#9D0208,font-weight:bold;
    classDef action fill:#B9FBC0,stroke:#2EC4B6,stroke-width:2px,color:#004E64,font-style:italic;

    %% Nodes
    A[BottomBar]:::terminal

    A --> B[Products Posts Screen]:::main
    B --> B1[Add Products Button]:::action
    B1 --> B2[Product's Description Screen]:::screen
    B2 --> B3[Add Images]:::action
    B2 --> B4[Sell Button]:::action
    B4 --> B[Products Posts Screen]:::main

    A --> C[Analytics Screen]:::main

    A --> D[Orders Screen]:::main
    D --> D1[Order Details / Status Screen]:::screen
```

## 📡 API Overview

### 🔐 Auth APIs

| Route                     | Method | Request                            | Response                    | Description                     |
|---------------------------|--------|------------------------------------|-----------------------------|---------------------------------|
| `/api/signup`            | POST   | `{ name, email, password }`        | `{ user object }`           | Create new user                |
| `/api/signin`            | POST   | `{ email, password }`              | `{ token, user object }`    | Login and receive JWT token    |
| `/tokenIsValid`          | POST   | `x-auth-token` in headers          | `true / false`              | Validate token                 |
| `/`                      | GET    | `x-auth-token` in headers          | `{ user object + token }`   | Get current logged-in user     |

---

### 🧑‍💼 Admin APIs

| Route                             | Method | Request                             | Response                     | Description                         |
|----------------------------------|--------|-------------------------------------|------------------------------|-------------------------------------|
| `/admin/add-product`            | POST   | `{ name, description, images, quantity, price, category }` | `{ saved product }`  | Add a new product                   |
| `/admin/get-products`           | GET    | void                                | `[ all products ]`           | Get all products                    |
| `/admin/delete-products`        | POST   | `{ id }`                            | `{ deleted product }`        | Delete product by ID               |
| `/admin/get-orders`             | GET    | void                                | `[ all orders ]`             | Get all orders                     |
| `/admin/change-order-status`    | POST   | `{ id, status }`                    | `{ updated order }`          | Update order status                |
| `/admin/analytics`              | GET    | void                                | `{ earnings by category }`   | Get earnings breakdown             |

---

### 👤 User APIs

| Route                          | Method  | Request                                | Response               | Description                        |
|--------------------------------|---------|----------------------------------------|------------------------|------------------------------------|
| `/api/add-to-cart`           | POST    | `{ id (productId) }`                   | `{ updated user }`     | Add product to cart               |
| `/api/remove-from-cart/:id`  | DELETE  | `:id` param                            | `{ updated user }`     | Remove product from cart          |
| `/api/save-user-address`     | POST    | `{ address }`                          | `{ updated user }`     | Save delivery address             |
| `/api/order`                 | POST    | `{ cart, address, totalPrice }`        | `{ placed order }`     | Place a new order                 |
| `/api/orders/me`             | GET     | void                                   | `[ user's orders ]`     | Get current user's orders         |

---

### 📦 Product APIs

| Route                                 | Method | Request                          | Response                   | Description                         |
|--------------------------------------|--------|----------------------------------|----------------------------|-------------------------------------|
| `/api/products?category=xyz`        | GET    | Query param: `category`          | `[ filtered products ]`    | Get products by category            |
| `/api/products/search/:name`        | GET    | Param: `:name`                   | `[ search results ]`       | Search products by name             |
| `/api/rate-product`                 | POST   | `{ id, rating }`                 | `{ updated product }`      | Rate a product                      |
| `/api/deal-of-day`                  | GET    | void                             | `{ top-rated product }`    | Get deal of the day                 |

---

## 📌 Note

This project demonstrates a scalable, production-level full-stack E-commerce architecture. Both user and admin functionalities are clearly separated and well-integrated.

### 🧩 RESTful API Integration

- The backend exposes clean and modular **RESTful APIs** using **Express.js**.
- Each route follows a structured and secure approach with **JWT-based authentication**.
- API responses are handled gracefully in the Flutter frontend using **async service layers**.
- Real-time updates (e.g., cart, ratings, order status) are managed efficiently with **Provider**.
- The admin dashboard interacts with APIs for product management, order updates, and analytics via dynamic HTTP requests.

> All major actions in the app — from authentication to placing orders and updating order statuses — are performed through well-structured and reusable API endpoints.

---

> Built by Raghav Jindal
