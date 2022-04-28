import numpy as np
import matplotlib.pyplot as plt
from mat4py import loadmat

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

def plot_data(inputs,targets,weights):

    def create_plot(line_x, line_y):
        a = (line_y[1] - line_y[0]) / (line_x[1] - line_x[0])
        new_line_x = np.linspace(-2, 2, 10)
        new_line_y = []
        for x in new_line_x:
            new_line_y.append(a * (x - line_x[2]) + line_y[2])
        plt.plot(new_line_x, new_line_y)

        plt.axis([-0.1, 1.1, -0.1, 1.1])
        plt.xlabel('P(1)')
        plt.ylabel('P(2)')
        plt.title('Vectors to be Classified')
        plt.show()

    plt.figure(figsize=(6,6))
    plt.grid(True)

    for input,target in zip(inputs,targets):
        plt.plot(input[0],input[1],'ro' if (target == 1.0) else 'bo')

    line_x = []
    line_y = []
    for i in np.linspace(np.amin(inputs[:,:1]),np.amax(inputs[:,:1])):
        slope = -(weights[0]/weights[2])/(weights[0]/weights[1])
        intercept = -weights[0]/weights[2]
        y = (slope*i) + intercept
        line_x.append(i)
        line_y.append(y)

    create_plot(line_x,line_y)

if __name__ == '__main__':
    #NAND
    #input = np.array([[0,0],[0,1],[1,0], [1,1]])
    #output = np.array([1,1,1,0])

    #Data from .mat file
    '''
    data = loadmat('dane_perceptron.mat')
    data = [data['dane'][0], data['dane'][1], data['dane'][2]]
    input = []
    for i in range(len(data[0])):
        input.append([data[0][i],data[1][i]])

    input = np.array(input)
    output = np.array(data[2])
    '''

    #Executor
    w0,w1,w2,results = perceptron(input,output)
    print(results)
    print(w0, w1, w2)
    np.savetxt("results.csv", results, delimiter=",", fmt="%.2f")
    plot_data(input,output,[w0,w1, w2])


