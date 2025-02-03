# Sales Performance Report
## Measuring Retail Store Sales Performance with SQL
### Background Project
The dataset contains sales transaction data from DQLab Store, covering orders placed between 2009 and 2012. Key attributes include:</p></br>
**Order Details:** order_id, order_status, order_date, customer <br/>
**Sales Metrics:** order_quantity, sales, discount, discount_value <br/>
**Product Information:** product_category, product_sub_category <br/></br>
The data allows for analyzing sales performance, discount effectiveness, and product trends over time.

</br>
1. Overall performance DQLab Strore from 2009 till 2012 for Order numbers and total sales which order status is finished.</br>
</br>

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
<img align="center" width="550" height="160" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output1.png">
Fig 1: Number of sales and order
</br>
</br>Full income received by DQLab is tracked over time. The best whole income had been 2009 and it does not get greater after that. But distinctive from the variety of order income, it goes trip barring in 2011. Although the trade is not too widespread over the years.
</br>
</br>
</br>
2. Overall Performance by Sub Category:
</br>
</br>

```
SELECT year(order_date) years, product_sub_category, SUM(sales) sales FROM clean_data 
WHERE year(order_date) BETWEEN 2011 AND 2012 AND order_status = 'Order Finished'
GROUP BY years, product_sub_category
ORDER BY years, sales DESC;
```
</br>
Output:
<img align="center" width="600" height="700" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output2.png">
Fig 2: Sales By Sub Category on 2011 & 2012
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
 FROM clean_data
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
</br>
4. Promotion Effectiveness and Efficiency by using Product Sub Category
</br>
</br>

```
SELECT YEAR(order_date) years, product_category, product_sub_category, 
SUM(sales) sales, SUM(discount_value) Promotion_Value,
ROUND(SUM(discount_value)*100/SUM(sales),2) 'Burn_Rate_Percentage'
FROM clean_data
WHERE YEAR(order_date) = 2012 AND order_status = 'Order Finished'
GROUP BY 3, 2, 1
ORDER BY 4 DESC;
```

</br>
<img align="center" width="750" height="450" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output4.png">
Fig 4: Burn Rate by sub-category of product

</br>
</br>
Only five subcategories of products feature a burn charge of under 4.5%. As demonstrated on the first five rows, it starts with Rubber Bands and progresses to Telephones and Communication. While on DQLab Store, the labels have greater than 0.02% from the most anticipated burn charge price from the DQLab Store.
</br>
</br>
What is very interesting is that from these findings, we note that there are still many subcategories of products which have a burn charge greater than 4.5%.
</br>
</br>
</br>
5. Customers Transactions per Year
</br>
</br>

```
SELECT YEAR(order_date) years,
        COUNT(DISTINCT customer) 'number of customers'
 FROM clean_data
 WHERE order_status = 'Order Finished'
 GROUP BY 1;
```
</br>
The calculations regarding the clients’ variety do not integrate the reproduction value for each year. That is the reason why DISTINCT is used in this case to get the special price of the clients number.
</br>
</br>
Output:
<img align="center" width="400" height="200" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output5.png">
Fig 5: Number of customers by year
</br>
</br>
The diversity of clients is not changing significantly overall. However, there was no drastic drop in customers, which is a welcome relief. The number of clients seems to fluctuate around the 580–590 mark.
</br>
</br>
</br>
6. New Customer Over the Years
</br>
</br>

```
SELECT YEAR(first_order) years,
        COUNT(customer) 'new customer'
 FROM(
        SELECT customers,
               MIN(order_date) first_order
        FROM clean_data
        WHERE order_status = 'Order Finished'
        GROUP BY 1) first
 GROUP BY 1;
```
</br>
In order to collect new customers each year, our main objective is to analyze first time transactions. This can be obtained by using the MIN() function on first_order and counting the number of clients.
</br>
</br>
Output:
<img align="center" width="350" height="180" src="https://github.com/Shihab27/DQLAB_Sales_Performance_Analysis/blob/main/output6.png">
Fig 6: Number of new customers by year
</br>
</br>
The acquisition of new customers has drastically reduced over the last 12 months. The only new clients we received in 2012 alone was 11. But as we look back at the previous data, the amount of clients does not appear to increase. This Fig 6 indicates that a lot of our old customers are still returning to DQLab Store to make purchases without the new clients base dropping.
