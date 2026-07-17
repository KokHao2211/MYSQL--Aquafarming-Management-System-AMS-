# Aquaculture Management & Operations Data Analysis (SQL)

## 📌 Project Overview
This project features a fully operational relational database schema designed for an aquaculture enterprise (fish farm and hatchery management). The system tracks day-to-day farm activities, environmental conditions, inventory management, supplier interactions, and sales transactions. It includes analytical queries to drive operational performance and inventory decisions.

## 🛠️ Skills Demonstrated
- **Relational Database Design:** Table creation with proper data types, Primary Keys, and complex Foreign Key constraints.
- **Data Engineering:** Designing schemas across operational verticals (Staff, Inventory, Ponds, Batches, Purchases, Sales).
- **Advanced SQL Querying:** Multi-table `INNER/LEFT JOIN` operations, Aggregate Functions (`SUM`, `COUNT`, `AVG`), conditional logic (`CASE WHEN`), sorting (`ORDER BY`), and filtering (`GROUP BY`, `HAVING`).

## 📊 Database Architecture Highlights
The schema handles 20+ interconnected tables mapped to critical business domains:
- **Operations:** `Staff`, `Pond`, `Species`, `Batch`, `Record` (growth tracking), `Farm_Activity`.
- **Supply Chain:** `Inventory`, `Supplier`, `Supplier_Item`, `Purchase`, `Purchase_detail`, `Payment`.
- **Revenue Management:** `Customer`, `Sale`, `Transaction_detail`.

## 🔍 Key Analytical Queries & Business Insights Included
The project solves major real-world business tracking requirements using SQL:
1. **Pond Environmental Status:** Monitors pond size, location, pH, temperature, and dissolved oxygen alongside assigned operational staff.
2. **Growth Status Monitoring:** Calculates average growth parameters (size, weight) for active batches using aggregate methods.
3. **Supplier Fulfillment Tracking:** Measures total orders fulfilled versus pending to optimize vendor logistics.
4. **Low Stock Alert System:** Generates real-time inventory triggers for items where stock drops below reorder thresholds, matching them immediately to primary suppliers.
5. **Staff Revenue & Commission Audit:** Aggregates fish volume sales, total revenue, and dynamically calculates performance commissions.
6. **Customer Lifetime Value (CLV):** Highlights historical transaction counts, product volumes, and cumulative spending per client.

## 🚀 How to Run the Scripts
1. Initialize your local RDBMS environment (e.g., MySQL Workbench).
2. Create your target schema: `CREATE DATABASE Aquaculture_Management;`
3. Open and run the `aquaculture_analysis.sql` file to build tables, populate records, and execute analytical reports.
