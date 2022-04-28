import numpy as np
import matplotlib.pyplot as plt

def heaviside(x):
    return 0 if x < 0 else 1

def perceptron(input, output):
    w0 = np.random.randn()
    w1 = np.random.randn()
    w2 = np.random.randn()

    eta = 0.25
    er = 1
    it = 0

    results = [[],[]]

    while er != 0:
        er = 0
        j = 0
        for i in range(len(input+1)):
            w = np.sum([w1, w2] * input[i, :]) + w0
            y = heaviside(w)
            e = output[i] - y
            delta_w = e * input[i, :]
            w0 = w0 + eta * e
            w1 = w1 + eta * delta_w[0]
            w2 = w2 + eta * delta_w[1]
            er = er + e * e
            i += 1
        er = er / i
        it = it + 1
        results[0].append(it)
        results[1].append(er)
    return w0,w1,w2,results

if __name__ == '__main__':
    input = np.array([[0,0],[0,1],[1,0], [1,1]])
    output = np.array([1,1,1,0])

    w0,w1,w2,results = perceptron(input,output)
    print(results)
    print(w0, w1, w2)

