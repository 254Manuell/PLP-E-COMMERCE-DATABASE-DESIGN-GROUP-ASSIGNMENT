# 📦 E-commerce Database Design - Peer Group Assignment

## 🎯 Objective
Design an Entity-Relationship Diagram (ERD) and collaboratively build a scalable e-commerce database. Master database architecture by defining entities, relationships, and constraints while ensuring efficient data flow.

---

## 🛠️ Instructions

### 1️⃣ Create an ERD ✍️
- **Entities & Attributes**:  
  - Map tables based on the provided structure ([image.png](image.png)) and the listed tables below.  
  - Example: `product_attribute` (from the task) aligns with **Product Attribute** (from the image), which includes `Site Category`, `Product Image`, and `Site Option`.  
- **Relationships**:  
  - Define connections (e.g., `product` ↔ `product_variation` ↔ `product_item`).  
  - Use **primary keys** (e.g., `product_id`) and **foreign keys** for relationships.  
- **Tools**: Use [dbdiagram.io](https://dbdiagram.io), [draw.io](https://draw.io), or similar.  

### 2️⃣ Plan the Data Flow 🔄
- Example Flow:  
  1. A `product` (e.g., "Running Shoes") belongs to a `brand` and `product_category` ("Footwear").  
  2. Its `product_variation` (size, color) links to `size_option` (42, 43) and `color` (Red, Blue).  
  3. Each `product_item` represents a unique combination (e.g., Size 42, Red) with its own SKU and price.  
  4. Custom attributes (e.g., "Material: Leather") are stored in `product_attribute`, categorized by `attribute_category` and `attribute_type`.  

### 3️⃣ Group Collaboration 🤝
- Split tasks: One member designs the `product`-`brand` relationship, another drafts `attribute_type` logic, etc.  
- Use **GitHub Projects** for task tracking and **Discord/Zoom** for daily syncs.  

### 4️⃣ Submission 🚀
- **Repository Structure**:  
