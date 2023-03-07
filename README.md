
# Project 1- Text Analysis 📕




## Introduction 🪩
I will analyse the Consumer Complaints csv file to understand issue sentiment in customer feedback 🙋‍♀️. 

## Library 📦
Here are the libraries I install to do cleaning, plots and analysis:

    1. dplyr
    2. tidyverse
    3. readxl
    4. lubridate
    5. shiny
    6. ggplot2
    7. DT
    8. sentimentr
    9. wordcloud
    10. tidytext
    11. textdata
    12. RColorBrewer
    13. reshape2
## Dictionary 📖
For analysis I used data_df table:

1. Date_received - The date that the customer wrote a review.
2. Submitted_via - What platform did the customer used to submit the review.
3. Company_response - How did the company responded to the customer?
4. Timely_response - This shows if company send response to the customer every now and then.
5. Consumer disputed - Did customer had a dispute with the compnay or not?
6. Customer_Id - The uniques ID provided to customer.
7. word - The issue that customer were facing is broken down in the words column.
------

## Data cleaning 🫧
1. Converting Data
The data provided is massive so rather than working it with  CSV, I converted it into RDS file.

2. Renaming
I used my_data table to rename all columns that had unnecessary names:

    my_data <- data %>%
    select(Date.received, Product, Issue, Company, State, Submitted.via, Company.response.to.consumer, Timely.response., Consumer.disputed., Complaint.ID)%>% 
    rename(Date_received = Date.received)%>% 
    rename(Company_response = Company.response.to.consumer)%>%
    rename(Submitted_via = Submitted.via)%>% 
    rename(Timely_Response = Timely.response.)%>% 
    rename(Consumer_disputed = Consumer.disputed.)%>% 
    rename(Consumer_ID = Complaint.ID)

3. Choosing word for sentiment
Since the Issue column had the word that could be displayed as sentiments, I decided to separate each word in a single row:

    data_df <- unnest_tokens(tbl = my_data, input = Issue, output = word)

I made a table of the connecting words like: because, although, so, but and much more to remove it from our data because those data doesn't have any emotion:

    stop_words <- get_stopwords(source = "smart")
    data_df <- anti_join(data_df, stop_words, by= "word")





## DATA Summary 🎬

![App Screenshot](https://raw.githubusercontent.com/stutishrestha21/Text-Analysis/main/Summary.png?token=GHSAT0AAAAAAB7VMISWCCKZUJE23P2TCM4QZAGQXPA)  




