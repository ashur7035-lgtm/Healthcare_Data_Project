# Healthcare Data Insights - Example script
import pandas as pd

df = pd.read_csv('../Datasets/diabetes_healthcare_dataset.csv')
# Basic stats
disease_freq = df['outcome'].value_counts().reset_index().rename(columns={'index':'outcome','outcome':'count'})
age_groups = pd.cut(df['age'], bins=[17,30,45,60,100], labels=['18-30','31-45','46-60','61+'])
by_age = df.groupby(age_groups)['outcome'].mean().reset_index().rename(columns={'outcome':'positive_rate'})
print("Disease frequency (0 = negative, 1 = positive):")
print(disease_freq)
print("\nPositive rate by age group:")
print(by_age)
