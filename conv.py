import numpy as np

def convolve(A,B):
    #Inversion of B
    B = B[::-1]
    
    newL = (2*(len(B)-1))+(len(A)) #Length of multiplication vectors
    
    #Creating new vectors for multiplication
    newA = np.zeros((newL,1))
    newB = np.zeros((newL,1))
    #Implementing A vector to new vector in correct place
    for i in range(len(A)):
        newA[len(B)-1+i] = A[i]
    
    #Multiplication od newA and individual version of newB
    l = 0
    conv = []
    for k in range(newL-len(B)+1):
        for i in range(len(B)):        
            newB[l + i] = B[i] 
            
        conv.append(np.sum(newA*newB))  
        l = l + 1
        newB = np.zeros((newL,1))
        
    return conv

if __name__ == "__main__":
    
    A = np.array([1,2,3])
    B = np.array([1,2,3])

    build_in_conv = np.convolve(A, B)
    
    if all(build_in_conv==convolve(A, B)):
        print("Values Agree")
    print("Built in function:", build_in_conv)
    print("Above function:", convolve(A, B))




