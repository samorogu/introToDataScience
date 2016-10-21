# coding: utf-8

##
## Tomado de https://gist.github.com/randyzwitch/c44ff2a76d81fa1e77cb
##


import random
import csv
import pandas as pd
import faker

fake = faker.Factory.create('es_MX')

NUMBER_OF_CLIENTS = 50

# Create customer file of NUMBER_OF_CLIENTS customers with fake data
# Use dataframe index as a way to generate unique customer id
customers = [fake.simple_profile() for x in range(0, NUMBER_OF_CLIENTS)]
customer_df = pd.DataFrame(customers)
customer_df["cust_id"] = customer_df.index

#Read in transactions file from arules package
with open("data/groceries.txt") as f:
    transactions = f.readlines()

#Remove new line character
transactions = [x[0:-1] for x in transactions]

#Generate transactions by cust_id

#file format:
#cust_id::int
#store_id::int
#transaction_datetime::string/datetime
#items::string


#for each customer...
for i in range(0, NUMBER_OF_CLIENTS):
    #...create a file...
    with open('data/transactions/custfile_%s' % i, 'w') as csvfile:
        trans = csv.writer(csvfile,
                           delimiter=' ',
                           quotechar='"',
                           quoting=csv.QUOTE_MINIMAL)
        #...that contains all of the transactions they've ever made
        for j in range(1, random.randint(1,365)):
            trans.writerow([i, fake.postcode(),
                            fake.date_time_this_decade(before_now=True, after_now=False),
                            transactions[random.randint(0,len(transactions) - 1)]])
