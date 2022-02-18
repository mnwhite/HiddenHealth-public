'''
This file has some small functions for swapping between polynomial coefficients
and Taylor expansion format.
'''

import numpy as np
from scipy.special import perm, factorial

def changePolyToTaylor(coeffs, x0):
    '''
    Change a polynomial coefficient vector into a vector of derivatives at x0.
    
    Parameters
    ----------
    coeffs : np.array
        Array of polynomial coefficients: f(x) = a0 + a1+x1  + a2*x2**2 + ...
    x0 : float
        Point around which to build Taylor expansion coefficients.
        
    Returns
    -------
    taylor : np.array
        Array of derivatives of the function at x0: f(x0), f'(x0), f''(x0), ...
    '''
    taylor = np.zeros_like(coeffs)
    coeffs_now = np.copy(coeffs)
    N = coeffs.size
    
    for n in range(N):
        temp = 0.
        for j in range(N-n):
            temp += coeffs_now[j]*x0**j
        taylor[n] = temp
        
        coeffs_next = np.zeros_like(coeffs_now)
        for j in range(1,N-n):
            coeffs_next[j-1] = j*coeffs_now[j]
        coeffs_now = coeffs_next
    
    return taylor


def changeTaylorToPoly(taylor, x0):
    '''
    Change a vector of derivatives at x0 into a polynomial coefficient vector.
    
    Parameters
    ----------
    taylor : np.array
        Array of derivatives of the function at x0: f(x0), f'(x0), f''(x0), ...
    x0 : float
        Point around which the Taylor expansion is defined.
        
    Returns
    -------
    coeffs : np.array
        Array of polynomial coefficients: f(x) = a0 + a1+x1  + a2*x2**2 + ...
    '''
    coeffs = np.zeros_like(taylor)
    N = taylor.size
    
    for n in range(N-1,-1,-1):
        this = taylor[n]/factorial(n)
        for j in range(N-1,n,-1):
            this -= perm(j,n)/factorial(n)*coeffs[j]*x0**(j-n)
        coeffs[n] = this
        
    return coeffs


def convertOldToNewParams(params, age_min):
    '''
    Previous version of code used polynomial coefficients as parameters; now
    switching to Taylor expansion style, specifying derivatives at age_min.
    
    Parameters
    ----------
    params : np.array
        Array of "old style" parameters.
        
    Returns
    -------
    output : np.array
        Array of "new style" parameters.
    '''
    HealthAgeCoeffs = np.array([params[17], params[19]*1e-1, params[20]*1e-3, params[21]*1e-5, params[22]*1e-7])
    HealthAgeTaylor = changePolyToTaylor(HealthAgeCoeffs, age_min)
    MortHealthCoeffs = np.array([0., params[2]*1e-1, params[3]*1e-2, params[4]*1e-3, params[5]*1e-4])
    MortHealthTaylor = changePolyToTaylor(MortHealthCoeffs, 0.)
    MortAgeCoeffs = np.array([params[0], params[6]*1e-3, params[7]*1e-5, params[8]*1e-7, params[9]*1e-9])
    MortAgeTaylor = changePolyToTaylor(MortAgeCoeffs, age_min)
    CorrCoeffs = np.array([params[12], params[13]*1e-2, params[14]*1e-5, params[15]*1e-8, params[16]*1e-11])
    CorrTaylor = changePolyToTaylor(CorrCoeffs, age_min)
    
    output = np.copy(params)
    output[0]  = MortAgeTaylor[0]
    output[2]  = MortHealthTaylor[1]*1e1
    output[3]  = MortHealthTaylor[2]*1e2
    output[4]  = MortHealthTaylor[3]*1e3
    output[5]  = MortHealthTaylor[4]*1e4
    output[6]  = MortAgeTaylor[1]*1e2
    output[7]  = MortAgeTaylor[2]*1e4
    output[8]  = MortAgeTaylor[3]*1e6
    output[9]  = MortAgeTaylor[4]*1e8
    output[12] = CorrTaylor[0]
    output[13] = CorrTaylor[1]*1e2
    output[14] = CorrTaylor[2]*1e4
    output[15] = CorrTaylor[3]*1e6
    output[16] = CorrTaylor[4]*1e8
    output[17] = HealthAgeTaylor[0]
    output[19] = HealthAgeTaylor[1]*1e1
    output[20] = HealthAgeTaylor[2]*1e2
    output[21] = HealthAgeTaylor[3]*1e3
    output[22] = HealthAgeTaylor[4]*1e4
    
    return output
    


if __name__ == '__main__':
    
    K = 5
    T = 100
    
    for t in range(T):
        coeffs = 10*(0.5-np.random.rand(K))
        x0 = 20*(0.5-np.random.rand())
        out = changeTaylorToPoly(changePolyToTaylor(coeffs, x0),x0)
        print(np.max(np.abs(out-coeffs)))
    
