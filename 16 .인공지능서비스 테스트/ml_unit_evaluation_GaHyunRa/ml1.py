import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

name = pd.Series(['A', 'B', 'C', 'D', 'E', 'F', 'G'])
power = pd.Series([130, 250, 190, 300, 210, 220, 170])
efficiency = pd.Series([16.3, 10.2, 11.1, 7.1, 12.1, 13.2, 14.2])

df = pd.DataFrame ({
    'name' : name,
    'horse power' : power,
    'efficiency' : efficiency
})

df = df.set_index('name')

print("===================================")
print(df)

X = df['horse power']
y = df['efficiency']

print("===================================")
print(X)
print("===================================")
print(y)

X = X.values.reshape(-1,1)

X_train, X_test, y_train, y_test = train_test_split(X,y, test_size=0.2, random_state=10)
print("===================================")
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)


X_train, X_val, y_train, y_val = train_test_split(X_train, y_train, test_size=0.25, random_state=10)
print("===================================")
print(X_train.shape, X_val.shape, X_test.shape, y_train.shape, y_val.shape, y_test.shape)
print("===================================")
print(X_train)

reg = LinearRegression()
reg.fit(X_train, y_train.values)

coefficient = reg.coef_
intercept = reg.intercept_
print("회귀 계수:", coefficient)
print("절편:", intercept)

pred_train = reg.predict(X_train)
pred_val = reg.predict(X_val)

mse_train = mean_squared_error(y_train, pred_train)
mse_val = mean_squared_error(y_val, pred_val)

r2_train = reg.score(X_train, y_train)
r2_val = reg.score(X_val, y_val)
print("훈련 데이터 예측 점수 :", r2_train)
print("검증 데이터 예측 점수 :", r2_val)

print("280 마력 자동차의 예상 연비 : %.2f km/l" %reg.predict(np.array([[280]])))