# Sales Performance Report
## Measuring Retail Store Sales Performance with SQL
### Background Project
<p>
The dataset contains sales transaction data from DQLab Store, covering orders placed between 2009 and 2012. Key attributes include:

**Order Details:** order_id, order_status, order_date, customer <br/>
**Sales Metrics:** order_quantity, sales, discount, discount_value <br/>
**Product Information:** product_category, product_sub_category <br/>
The data allows for analyzing sales performance, discount effectiveness, and product trends over time.
</p>
</br>
1. Overall performance DQLab Strore from 2009 till 2012 for Order numbers and total sales which order status is finished.</br>

```
SELECT
	YEAR(order_date) AS year1,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales
FROM clean_data
WHERE order_status = 'Order Finished'
AND order_date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 1;
```
</br>
Output:
<img align="center" width="600" height="160" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output1.png">
Fig: Number of sales and order
</br>
</br>Full income received by DQLab is tracked over time. The best whole income had been 2009 and it does not get greater after that. But distinctive from the variety of order income, it goes trip barring in 2011. Although the trade is not too widespread over the years.
</br>
</br>
</br>
2. Overall Performance by Sub Category:</br>


```
SELECT YEAR(order_date) as years,
        product_sub_category,
        sum(sales) as sales
FROM dqlab_sales_store
WHERE YEAR(order_date) BETWEEN 2011 AND 2012 AND order_status = 'Order Finished'
GROUP BY years, product_sub_category
ORDER BY years, sales DESC;
```
</br>
Output:
<img align="center" width="600" height="700" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output2.png">
Fig: Sales By Sub Category on 2011 & 2012
</br>
</br>
</br>
3. Promotion Effectiveness and Efficiency by Years
</br>
</br>

```
SELECT YEAR(order_date) years,
        SUM(sales) sales,
        SUM(discount_value) 'promotion_value',
        ROUND( SUM(discount_value)*100/SUM(sales), 2) 'burn_rate_percentage'
 FROM dqlab_sales_store
 WHERE order_status = 'Order Finished'
 GROUP BY 1;
```

</br>
Throughout this project, burn rate evaluation is used for determining the effectiveness and effectivity of promotions. It does this by evaluating the total of promoting cost to that of completed sales. Here, DQLab hopes that the burn price will not exceed 4.5%. Enumerating how to calculate burn price is detailed below : 
</br>
</br>
<img align="center" width="400" height="100" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/formula1.png">
</br>
Output:
<img align="center" width="600" height="130" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output3.png">
</br>The overview leads us to the understanding that the burn prices are at a rate of more than 4.5% over the period of every 12 months as an average. This explains the promotional campaigns so far have not been able to curb the burn rate to a maximum of 4.5%. By grouping these questions to each product, we can solve which product was overwhelmingly influential in increasing the burn rate beyond expectations.
</br>
</br>
4. Promotion Effectiveness and Efficiency by using Product Sub Category
</br>
</br>
