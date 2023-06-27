import pandas as pd
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
import seaborn as sns


name = pd.Series(['A', 'B', 'C', 'D', 'E', 'F', 'G'])
power = pd.Series([130, 250, 190, 300, 210, 220, 170])
weight = pd.Series([1900, 2600, 2200, 2900, 2400, 2300, 2100])
efficiency = pd.Series([16.3, 10.2, 11.1, 7.1, 12.1, 13.2, 14.2])

df = pd.DataFrame ({
    'name' : name,
    'horse power' : power,
    'weight' : weight,
    'efficiency' : efficiency
})

df = df.set_index('name')

X = df[['horse power', 'weight']]
y = df['efficiency']

reg = LinearRegression()
reg.fit(X, y)

# 회귀 계수 및 절편 출력
coefficient = reg.coef_
intercept = reg.intercept_
print("회귀 계수:", coefficient)
print("절편:", intercept)

r2_score = reg.score(X, y)
print("예측 점수 :", r2_score)

new_data = pd.DataFrame({
    'horse power': [280],
    'weight': [2500]
})

predictions = reg.predict(new_data)
print("280 마력 자동차의 예상 연비 : %.2f km/l" %predictions)

plt.figure(figsize=(10,10))
sns.pairplot(data=df)
plt.show()

corr = df.corr()
plt.figure(figsize=(10,10))
sns.heatmap(data=corr, annot=True)
plt.show()