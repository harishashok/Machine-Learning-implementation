# I wanted to use read.transactions to use the system memory efficiently since the transactions data might have millions of cells that have no useful information.

groceries <- read.transactions("groceries.csv", sep = ",")

#To visualize the item support.This allows you to produce at a bar chart depicting the proportion of transactions
containing certain items.
itemFrequencyPlot(groceries, support = 0.1)
#Plot generated

#To limit the items of the plot to a specific number of items in the transactions
itemFrequencyPlot(groceries, topN = 30)
#Plot generated

#Plotting the spare matrix for the items in the transactions
image(groceries[1:100])

#TRAINING A MODEL ON THE DATA

#Using the apriori function to generate a set of rules based on the parameters of confidence and support
#The value 0.006 of support is selected based on the proportion of items from total number of items to generate a valid set of rules
# Setting the condidence parameter is tricky since it cannot be very high or very low since we dont want the 
#rules to restrict most of the associations or produce associations that are very obvious. for now we can take 25% level

groceryRule <- apriori(groceries, parameter = list(support = 0.006, confidence = 0.25, minlen =2 ))
# this object contains a set of 463 rules of association for the items in the transactions. 

#MINING DEEP TO FIND MORE INSIGHTS INTO THE RULES
#Using the sort funciton to find more actionable rules in the transactions with more confidence and lift

inspect(sort(groceryRule, by = "lift") [1:10])














