# SQL Analysis: Uncovering Revenue Loss, Customer Friction & Performance Risks

## 📊 Project Overview  
This SQL project dives deep into a multi-table dataset involving **orders**, **customers**, and **support tickets** to uncover hidden revenue loss, customer friction points, and operational risks. By analyzing real-world business scenarios, the project demonstrates advanced querying skills, data-driven insights, and stakeholder-focused recommendations.

---

## 🛠️ Technical Skills Showcased  
- Writing complex **JOINs** and conditional queries  
- Aggregations with `SUM()`, `COUNT()`, and filtering using `WHERE` and `HAVING` clauses  
- Grouping and ordering data to identify key trends  
- Risk scoring with conditional logic (`CASE` statements)  
- Cross-table analysis for business insights  
- Translating data queries into actionable business recommendations

---

## 🔍 Business Questions & Insights

### 1. How much revenue has been lost due to returned orders and delivery issues?  
**Query:** Calculated total lost revenue from returns and delivery problems.  
**Insight:** $750 lost — highlights direct financial impact of operational inefficiencies.  
**Impact:** Operations teams should prioritize reducing errors, while customer experience can address root causes of returns.

---

### 2. Which customer segments experience the most revenue-impacting issues?  
**Query:** Joined orders and customers, segmented by customer type to identify segments with the highest losses.  
**Insight:** Mid-Market and Small Business segments face the highest losses, suggesting tailored support is needed.  
**Impact:** Sales and account managers should engage these segments; product and logistics can target improvements accordingly.

---

### 3. Which customers are at risk of churn due to multiple negative interactions?  
**Query:** Combined returns and support tickets data to categorize customers into churn risk levels.  
**Insight:** Quantum Corp flagged as Moderate Risk — most others are Low Risk.  
**Impact:** Customer success teams can proactively address issues for at-risk customers to improve retention.

---

### 4. What is the average ticket resolution time by issue type and region?  
**Query:** Analyzed ticket resolution times across issue types and customer regions.  
**Insight:** East region shows longest resolution times for key issues, indicating localized service delays.  
**Impact:** Customer support leadership can optimize resources and training to reduce delays and improve service quality.

---

### 5. What’s the net revenue impact of customers requiring post-order support?  
**Query:** Summed revenue from orders where support was required after purchase.  
**Insight:** This segment accounts for $5,350 in revenue but incurs higher support costs.  
**Impact:** Balancing support investment and revenue growth is critical; targeted workflows can enhance margins and customer satisfaction.

---

## 📁 Dataset Structure  
- **orders** — Contains transaction data including order amounts, return status, and delivery issues  
- **customers** — Customer details such as ID, name, segment, and region  
- **support_tickets** — Customer support interactions including issue types, resolution times, and dates  

---

## 🚀 Why This Project Matters  
This project goes beyond simple data retrieval by integrating multiple data sources to reveal financial risks, customer satisfaction challenges, and operational inefficiencies. It demonstrates my ability to extract actionable insights that inform strategic business decisions and improve cross-functional collaboration.

---

## 📬 Let’s Connect  
I’m passionate about using data to solve real-world problems. If you’re interested in discussing this project or how I can bring data-driven impact to your team, feel free to reach out!

---

*Thank you for reviewing my work!*

