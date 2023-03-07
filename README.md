
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
This is the issue words and the positive and negative sentiments.

![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/Summary.png)






## Data Analysis

1. ![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/Rplot.png)  

First I sorted out the sentiment of data in bing_table. In that table there is word, company, state, submitted via, consumer disputed, date and sentiments. Then I made a plot using Submitted_via as my x axis, sentiment as my y axis and I filled it with Submitted_via to make my chart colorful. The code I used is:


    ggplot(aes(x = Submitted_via, y= sentiment, fill = Submitted_via), data = bing_table) +
    geom_col(show.legend = TRUE)+
    facet_wrap(vars(), ncol = 1, scales = "free_x")+
    labs(x="Submitted Via", y ="Sentiment")+
    theme_classic()
In this graph it is seen that the customer uses web to write neagative emotion related to the issue. If they use fax and phone, they don't say much about the issue or show their emotion. So if a business wants to get honest review, viewing the web could be better option for them.  The code I used for it is:

2.![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/State.png) 

In this graph it is seen that the customer uses web to write neagative emotion related to the issue. If they use fax and phone, they don't say much about the issue or show their emotion. So if a business wants to get honest review, viewing the web could be better option for them.  The code I used for it is:

    ggplot(aes(x = word, y= sentiment, fill = State), data = bing_table) +
    geom_col(show.legend = TRUE)+
    facet_wrap(vars(), ncol = 1, scales = "free_x")+
    labs(x="Word", y ="Sentiment")+
    theme_classic()


Then I thought about sorting the data using the same table but this time I filled it with states to see which states have what kind of value. In the diagram we can see that the state AA has the most negative sentiment and WI has the least neagtive sentiment. 
Then I thought about sorting the data using the same table but this time I filled it with states to see which states have what kind of value. In the diagram we can see that the state AA has the most negative sentiment and WI has the least neagtive sentiment. 


3. ![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/Word%2C%20sentiment.png)

This graph shows the word and sentiment accorsing to the product. In Bank account or service there is "problems" word used a lot. In credit card we can see "fraud", "issue", "protection", "debt" and "delinquent". In credit report there is "incorrect" word with the most sentiment. The code I used for it is: 

    ggplot(bing_table, aes(word, sentiment, fill = Product)) +
    geom_col(show.legend = FALSE) +
    facet_wrap(~Product, ncol = 2, scales = "free_x")

4. Word cloud for Negative words
![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/Negative%20cloud.png)

5. Word cloud for positive words
![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/Positive%20cloud.png)

6. Shinny app code and the diagram
Code used for making shinny app:

    
    #Bar graph
    barplot(bing_df$sentiment)
![App Screenshot](https://github.com/stutishrestha21/Text-Analysis/blob/main/Pictures/Shinny.png)

It shows how many negative words the sentiment of it.

## Conclusion

Sentimental analysis helped to find whether the data is positive or negative. It helpes business to see the issue and know it's sentiment and understand customers need.
