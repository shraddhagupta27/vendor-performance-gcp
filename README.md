# vendor-performance-gcp

# Vendor Performance Analytics
End-to-end vendor performance analytics pipeline using GCP (BigQuery + Cloud Storage), Python, and Looker Studio to evaluate sales, profit, and inventory efficiency across vendors and products.

## Overview

This project builds a complete analytics workflow to assess vendor performance for a retail business. Using Google Cloud, BigQuery SQL, and Python, the solution processes raw datasets, engineers KPIs, performs exploratory and statistical analysis, and delivers an interactive dashboard summarizing vendor profitability, sales contribution, and inventory inefficiencies.

## Problem Statement

Retail companies often struggle to identify which vendors contribute most to profitability, which products underperform, and where inventory inefficiencies occur. With fragmented raw data across purchases, prices, sales, and invoices, decision-makers lack a unified, accurate view of vendor performance. This project solves this by creating a consolidated, analytics-ready data model and dashboard that surfaces measurable insights to support pricing, inventory optimization, and vendor negotiation strategies.

## Dataset

Source: Kaggle
Link: https://www.kaggle.com/datasets/harshmadhavan/vendor-performance-analysis

## Tools & Technologies

- Google Cloud Platform (GCP)
- Cloud Storage
- BigQuery (SQL + Python client)
- Python (pandas, numpy, google-cloud-bigquery)
- SQL (BigQuery Standard SQL)
- Looker Studio for dashboarding

## Methods

- Ingested datasets into Google Cloud Storage
- Loaded cleaned files into BigQuery via Python
- Designed relational schema and created analytical tables
- Developed SQL-based ETL pipeline to build vendor summary KPIs
- Performed EDA & hypothesis testing
- Built interactive dashboard summarizing vendor-level performance

## Key Insights

- Total Sales across vendors exceeded $441M, while total Purchases were $307M, generating ~$134M in gross profit.
- Profit margins varied significantly by vendor, enabling targeted renegotiation opportunities.
- Unsold capital exceeded $2.7M, concentrated in specific slow-moving SKUs.
- Actual purchase prices frequently deviated from contracted prices, impacting cost efficiency.

## Dashboard 

https://lookerstudio.google.com/s/ogEezzxlbdE


