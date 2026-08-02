# Load dataset
customer_data <- read.csv("data/customer_satisfaction.csv")

# Display first 6 rows
head(customer_data)

# Check data structure
str(customer_data)

# Summary statistics
summary(customer_data)

# Count respondents by brand
table(customer_data$Brand)

# Brand distribution
barplot(table(customer_data$Brand))

# Average satisfaction by brand
aggregate(Satisfaction ~ Brand,
          data = customer_data,
          mean)

# Save average satisfaction by brand
avg_satisfaction <- aggregate(Satisfaction ~ Brand,
                              data = customer_data,
                              mean)

# Average satisfaction chart
barplot(avg_satisfaction$Satisfaction,
        names.arg = avg_satisfaction$Brand,
        main = "Average Satisfaction by Brand",
        ylab = "Average Satisfaction",
        ylim = c(0,5))

# Save average satisfaction table
write.csv(avg_satisfaction,
          "output/average_satisfaction_by_brand.csv",
          row.names = FALSE)