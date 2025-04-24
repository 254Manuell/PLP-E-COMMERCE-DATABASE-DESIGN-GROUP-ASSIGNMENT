# 📦 E-commerce Database Design - Peer Group Assignment

## 🎯 Objective
The ERD for this e-commerce platform defines a normalized relational database structure centered around core entities like **Product** (stores product details), **Product Category** (hierarchical classification), and **Brand** (manufacturer data). It integrates dynamic relationships such as **Product Variation** (size/color options) → **Product Item** (unique SKUs for purchase), supported by attribute flexibility via **Product Attribute** (custom metadata) and **Attribute Category/Type** (grouping and data typing). Critical linkages include foreign keys between `product` ↔ `product_variation` (one-to-many), `product_item` ↔ `size_option/color` (many-to-one), and `product_attribute` ↔ `attribute_category` (categorization). The design ensures scalability for diverse e-commerce use cases while maintaining data integrity through constraints and indexes.  

---

## 🛠️ Instructions

### 1️⃣ Create an ERD ✍️
![image alt](https://github.com/254Manuell/PLP-E-COMMERCE-DATABASE-DESIGN-GROUP-ASSIGNMENT/blob/5e7f5f177089f38f40fabf5a8e90c822b6b419e2/ERDDD.drawio.png)


### 2️⃣ Plan the Data Flow 🔄
- Example Flow:  
  1. A `product` (e.g., "Running Shoes") belongs to a `brand` and `product_category` ("Footwear").  
  2. Its `product_variation` (size, color) links to `size_option` (42, 43) and `color` (Red, Blue).  
  3. Each `product_item` represents a unique combination (e.g., Size 42, Red) with its own SKU and price.  
  4. Custom attributes (e.g., "Material: Leather") are stored in `product_attribute`, categorized by `attribute_category` and `attribute_type`.  

### 3️⃣ Group Collaboration 🤝
- Split tasks amongst all group members and worked collaboratively via Google Meet.  
- Use **GitHub** for *Version Control* and Our *WhatsApp group* for .  
Memebers included;
1. Emmanuel Ngunnzi(Group Leader) @254Manuell
2. Brilliant Mwendwa @BrillyWam
3. Eugene Ambagwa @ambagwa 
