# Emergency Care Performance Patient Insights Analysis

A comprehensive data-driven project designed to analyze Emergency Room (ER) performance, patient behavior, and service efficiency in a hospital setting. This dashboard enables healthcare stakeholders to make informed decisions for better patient care and operational management.

## ✅ Project Overview
This project presents a real-time, multi-layered dashboard for visualizing and analyzing key metrics related to hospital emergency services, including:

* Patient Volume and Demographics
* Wait Times and Service Timeliness
* Admission Rates
* Department Referrals
* Patient Satisfaction

  ## 🛠️ Tools & Technologies
* SQL –  aggregation, KPI calculation
* Power BI – Interactive dashboards, DAX measures, drillthroughs

  ## 📚 Data Columns Explained

| Column                                          | Description                            |
| ----------------------------------------------- | -------------------------------------- |
| `patient_id`                                    | Unique identifier per patient          |
| `patient_admission_date`                        | Timestamp of ER visit                  |
| `patient_gender`, `patient_age`, `patient_race` | Demographic data                       |
| `department_referral`                           | Department the patient was referred to |
| `patient_admission_flag`                        | Whether the patient was admitted       |
| `patient_satisfaction_score`                    | Feedback score                         |
| `patient_waittime`                              | Minutes waited before first response   |


## 🧾 SQL Analysis Performed

| Query                             | Purpose                           |
| --------------------------------- | --------------------------------- |
| `COUNT(*)` by admission date      | Total daily patients              |
| `AVG(patient_waittime)`           | Avg wait time daily and overall   |
| `AVG(patient_satisfaction_score)` | Avg patient satisfaction          |
| `CASE` for admission flags        | To track Admitted vs Not Admitted |
| `GROUP BY department_referral`    | Referral analysis by department   |
| `TIME-based groupings`            | By hour, by weekday               |
| `Age buckets`                     | For 0–10, 11–20, etc.             |

## 📂 Dashboards Included in Power BI
### 📆 Monthly View
KPIs by month (volume, age, wait time, referral, etc.)
<img width="1079" height="706" alt="image" src="https://github.com/user-attachments/assets/4c65eabd-c451-4bc1-b72f-466202d44169" />

### 📊 Consolidated View
Overall summary across date ranges for trends
<img width="1187" height="735" alt="image" src="https://github.com/user-attachments/assets/86f54151-4bc2-4ee6-8a13-53caa3450d6e" />

### 👥 Patient Details View

Drill-through patient-level grid (ID, gender, referral, etc.)

### 💡 Summary Insights

Final slide with business conclusions & action points

## 📌 Key Insights

* **High Traffic Times**: Most ER visits occur during evening hours (5 PM – 9 PM) and weekends.

* **Age Group Trend**: The 21–30 and 31–40 age groups account for the largest share of ER visits.
* **Gender Pattern**: Slightly more females visited than males during the reporting period.
* **Referral Hotspots**: Departments like Orthopedics and Cardiology receive the most ER referrals.
* **Service Delays**: Days with high patient volume correlated with lower satisfaction scores and longer wait times.

📈 Recommendations
**Improve Peak-Time Staffing**
➤ Add more staff during peak evening and weekend hours to reduce wait times.

**Optimize Referral Departments**
➤ Increase capacity/resources in departments with high referral loads (e.g., Cardiology).

**Monitor Satisfaction Dips**
➤ Link drops in satisfaction to specific time slots or staff shifts and investigate root causes.

**Speed Up First Response Time**
➤ Implement triage automation or fast-track lanes to boost the % of patients seen within 30 minutes.

**Use Demographics for Targeted Planning**
➤ Align campaigns, communication, or services toward majority visiting groups (like 20–40 age segment).

✅ Conclusion
The Hospital Emergency Room Analysis provided a comprehensive overview of ER operations, patient demographics, and service efficiency. By integrating structured SQL analysis with dynamic Power BI dashboards, we were able to extract meaningful insights and patterns from historical ER visit data.

#### Key takeaways from the analysis include:

🔍 High patient volumes were observed during evening hours and weekends, indicating the need for dynamic resource allocation based on time patterns.

⌛ Average wait times fluctuated significantly across days, often aligning with lower patient satisfaction scores.

🏥 A significant portion of patients were not admitted, emphasizing the ER’s role in primary triage and outpatient handling.

📈 Departments like Cardiology and Orthopedics received the highest number of referrals, suggesting potential bottlenecks or staffing needs in those areas.

👵 The 21–40 age group accounted for the largest share of visits, pointing to health awareness needs in younger populations.

🧍‍♂️ Gender and race distribution revealed no major disparity, but provide useful context for inclusive healthcare planning.

This analysis empowers hospital administrators to:

* Make data-informed staffing decisions.

* Implement triage improvements.

* Track service quality in real time.

Allocate resources based on departmental load and patient demographics.

In conclusion, this project serves as a valuable tool to enhance emergency room performance, patient experience, and overall hospital operations through continuous data-driven monitoring and improvement.


