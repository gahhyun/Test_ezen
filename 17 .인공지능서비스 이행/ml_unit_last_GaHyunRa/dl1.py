import numpy as np
import matplotlib.pyplot as plt


def stepfunc(x):
    return np.where(x <= 0, -1, 1)   # x 값이 (x <= 0)을 만족하면 -1 반환, 만족하지 못하면 1을 반환

def sigmoid(x):
    return 1 / (1 + np.exp(-x))     # 넘파이의 exp(x) 함수는 e^x를 구하는 지수 함수이다.

def tahn(x):                        # 쌍곡탄젠트 함수
    return (np.exp(x) - np.exp(-x)) / (np.exp(x) + np.exp(-x))

def relu(x):
    return np.maximum(0, x)     # 인수로 주어진 수 중 가장 큰 수를 반환

def softplus(x):
    return np.log(1 + np.exp(x))   # Softplus 함수 계산

x = np.arange(-6, 6, 0.1)         # x 값으로 -6 ~ 6까지 0.1 간격의 소수로 이루어진 배열

plt.figure(figsize=(15, 3))

plt.subplot(1, 4, 1)  # 1행 4열 중 첫 번째
plt.plot(x, stepfunc(x), color='blue')          # 색상
plt.title('step')                               # 이름 설정
plt.grid()                                      # 격자 표시

plt.subplot(1, 4, 2)  # 1행 4열 중 두 번째
plt.plot(x, sigmoid(x), color='blue')           # 색상
plt.title('logistic sigmoid')                   # 이름 설정
plt.grid()                                      # 격자 표시

plt.subplot(1, 4, 3)  # 1행 4열 중 세 번째
plt.plot(x, tahn(x), color='blue')               # 색상
plt.title('tanh(hyperbolic tangent)')            # 이름 설정
plt.grid()                                       # 격자 표시

plt.subplot(1, 4, 4)  # 1행 4열 중 네 번째
plt.plot(x, softplus(x), color='red', label='Softplus')     # 색상, 라벨
plt.plot(x, relu(x), color='blue', label='ReLU')            # 색상, 라벨
plt.title('ReLU and softplus')                              # 이름 설정
plt.legend()                                                # 범례
plt.grid()                                                  # 격자 표시

plt.tight_layout()  # 서브플롯 간 간격 조절
plt.show()