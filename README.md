<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f9;
        }
        h1, h2 {
            color: #333;
        }
        ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        ul li {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h1>Data Science Project - Titanic Dataset</h1>
    <h2>Project Description</h2>
    <p>This project involves analyzing a modified version of the Titanic dataset, which includes information such as passenger demographics, ticket class, fare, and survival status. The primary goal is to preprocess the data for further analysis and predictive modeling. Key steps include data cleaning, handling missing values, outlier detection, data transformation, and class balancing.</p>

    <h2>Preprocessing Steps</h2>
    <ul>
        <li><strong>Library Installation and Loading:</strong> Installed and loaded necessary libraries (`dplyr`, `tibble`, `ggplot2`, `ROSE`).</li>
        <li><strong>Data Loading and Inspection:</strong> Loaded the dataset and checked its structure, data types, and missing values.</li>
        <li><strong>Handling Missing Values:</strong> 
            <ul>
                <li>Replaced empty values in categorical columns with `NA`.</li>
                <li>Filled missing values in numeric columns with their mean and categorical columns with their mode.</li>
            </ul>
        </li>
        <li><strong>Removing Invalid and Incomplete Data:</strong> 
            <ul>
                <li>Removed rows with more than 2 `NA` values.</li>
                <li>Corrected invalid values in the `who` column.</li>
            </ul>
        </li>
        <li><strong>Outlier Detection and Handling:</strong> 
            <ul>
                <li>Used histograms to detect outliers in `age` and `fare`.</li>
                <li>Applied the IQR method to remove outliers.</li>
            </ul>
        </li>
        <li><strong>Data Normalization:</strong> Normalized the continuous attribute `age`.</li>
        <li><strong>Data Transformation:</strong> Converted categorical variables into factors with appropriate labels.</li>
        <li><strong>Data Balancing:</strong> Addressed class imbalance in the `survived` variable using the `ROSE` package for oversampling and undersampling.</li>
    </ul>

    <h2>Conclusion</h2>
    <p>Through this project, various data preparation steps were successfully applied, including data cleaning, descriptive statistics calculation, and dataset balancing. These steps are vital for preparing data for further analysis and predictive modeling, ensuring robust and accurate results.</p>
</body>
</html>
