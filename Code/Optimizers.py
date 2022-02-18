'''
Various tools for optimizing; originally written as example solutions for UDel Econ 867.
'''

import numpy as np
from scipy.optimize import minimize_scalar
from copy import copy


def calcJacobian(f,x,eps=1e-8):
    '''
    Calculate the Jacobian of a R^N --> R^M function at a given point by finite difference.
    
    Parameters
    ----------
    f : function
        A real function that takes a single 1D array as an input.
    x : np.array
        The point in the domain of f at which to evaluate the gradient.
    eps : float
        Relative perturbance for calculating finite differences.
        
    Returns
    -------
    jacobian : np.array
        The Jacobian of f at x, as an MxN size array.
    '''
    N = x.size
    fx = f(x)
    M = fx.size
    epsilon = np.maximum(np.abs(eps*x),eps)
    
    jacobian = np.zeros((M,N))
    for n in range(N):
        y = copy(x)
        y[n] += epsilon[n]
        fy = f(y)
        jacobian[:,n] = (fy-fx)/epsilon[n]
    return jacobian


def calcGradient(f,x,eps=1e-8):
    '''
    Calculates the gradient of a real function at a given point by finite difference.
    
    Parameters
    ----------
    f : function
        A real function that takes a single 1D array as an input.
    x : np.array
        The point in the domain of f at which to evaluate the gradient.
    eps : float
        Relative perturbance for calculating finite differences.
        
    Returns
    -------
    gradient : np.array
        The gradient of f at x, as an N length vector.
    '''
    N = x.size
    epsilon = np.maximum(np.abs(eps*x),eps)
    fx = f(x)
    dvec = np.zeros(N)
    for i in range(N):
        y = copy(x)
        y[i] += epsilon[i]
        dvec[i] = f(y)
    gradient = (dvec-fx)/epsilon
    return gradient


    
def calcHessian(f,x,eps=0.0001):
    '''
    Calculates the Hessian of a real function at a given point by finite difference.
    
    Parameters
    ----------
    f : function
        A real function that takes a single 1D array as an input.
    x : np.array
        The point in the domain of f at which to evaluate the Hessian.
    eps : float
        Relative perturbance for calculating finite differences.
        
    Returns
    -------
    hessian : np.array
        The Hessian of f at x, as an NxN array.
    '''
    N = x.size
    epsilon = np.maximum(np.abs(eps*x),eps)
    fx = f(x)
    dvec= np.zeros(N)
    for j in range(x.size):
        x0 = copy(x)
        x0[j] += epsilon[j]
        dvec[j] = f(x0)
        
    ddarray = np.zeros((N,N))
    for i in range(N):
        for j in range(i+1):
            if i == j:
                x0 = copy(x)
                x0[i] -= epsilon[i]
                ddarray[i,j] = f(x0)
            else:
                x0 = copy(x)
                x0[i] += epsilon[i]
                x0[j] += epsilon[j]
                ddarray[i,j] = f(x0)
                ddarray[j,i] = ddarray[i,j]
    
    hessian = np.zeros((N,N))
    for i in range(N):
        for j in range(N):
            if i == j:
                hessian[i,j] = (dvec[i] + ddarray[i,j] - 2*fx)/epsilon[i]**2
            else:
                hessian[i,j] = (ddarray[i,j] + fx - dvec[i] - dvec[j])/(epsilon[i]*epsilon[j])                
    return hessian


def minimizeQnDscalar(f,x0):
    '''
    Quick and dirty minimizer for scalar problems, which will eventually find
    a local minimum of f(x) "near" x0 if one exists.  
    
    Parameters
    ----------
    f : function
        A real function that maps R --> R.
    x0 : np.array
        The point in the domain of f around which to find a local minimum.
        
    Returns
    -------
    xstar : float
        A local minimum of f(x) that is "near" x0.
    eval_count : int
        Number of times the function was evaluated.
    '''
    diff0 = np.maximum(0.1*x0,0.000001) # Initial difference
    diffmax = 1.0e10
    fac = np.exp(1)              # Factor by which to expand bracket
    dl = diff0
    dh = diff0
    a = x0-dl
    b = x0
    c = x0+dh
    fb = f(b)
    fa = fb
    fc = fb
    found_lower = False
    found_upper = False
    found_bracket = found_lower and found_upper
    eval_count = 1
    while not found_bracket:
        if not found_lower:
            f_new = f(a)
            eval_count += 1
            
            if (f_new > fa):
                fa = f_new
                found_lower = True
            elif np.isnan(f_new):
                dl /= fac**(2/3)
                a = x0-dl
            else:
                fa = f_new
                dl *= fac
                a = x0-dl
        
        if not found_upper:
            f_new = f(c)
            eval_count += 1
            
            if (f_new > fc):
                fc = f_new
                found_upper = True
            elif np.isnan(f_new):
                dh /= fac**(2/3) 
                c = x0+dh
            else:
                fc = f_new
                dh *= fac
                c = x0+dh
                
        found_bracket = found_lower and found_upper
        if dl > diffmax or dh > diffmax:
            print("There isn't a bracketing interval within " + str(diffmax) + ' of x0!')
            found_bracket = True
            
    xmin = minimize_scalar(f,bounds=(a,c),tol=1e-8,method='bounded')
    eval_count += xmin.nfev
    xstar = xmin.x
    return xstar, eval_count


def minimizeCoordSearch(f,x0,tol=0.000001,verbose=False):
    '''
    Finds a minimum of the function f: R^N --> R near x0 using coordinate search.
    
    Parameters
    ----------
    f : function
        A real function that maps R^N --> R.
    x0 : np.array
        The initial search point for a local minimum.
    tol : float
        Relative tolerance of the minimization process.
    verbose : bool
        Indicator for whether to print iterative progress to screen.
        
    Returns
    -------
    xstar : float
        A local minimum of f(x) that is "near" x0.
    '''
    N = x0.size
    maxiter = 10000
    x_now = x0
    converged = False
    
    i = 0
    eval_count = 0
    while (not converged) and (i < maxiter):
        step = np.zeros(N)
        x_temp = copy(x_now)
        for j in range(N):
            dir_vec = np.zeros(N)
            dir_vec[j] = 1.
            tempFunc = lambda alpha : f(x_temp + alpha*dir_vec)
            step[j], evals = minimizeQnDscalar(tempFunc,0.0)
            eval_count += evals
            x_temp[j] += step[j] # Immediately update this index
        x_next = x_now + step
        if (np.max(np.abs(step/(1.+x_next))) < tol):
            converged = True
        x_now = x_next
        fx_now = f(x_now)
        eval_count += 1
        i += 1
        if verbose:
            print('Iteration ' + str(i) + ': x=' + str(x_now) + ', f(x)=' + str(fx_now) + ', total evals=' + str(eval_count))
        
    if i == maxiter:
        print('Local minimum was not found within ' + str(maxiter) + ' iterations!')
    xstar = x_now
    print('Minimization by coordinate search took ' + str(i) + ' iterations with ' + str(eval_count) + ' function evaluations.')
    return xstar


def minimizeSteepestDescent(f,x0,tol=0.000001,which=None,verbose=False):
    '''
    Finds a minimum of the function f: R^N --> R near x0 using the steepest descent method.
    
    Parameters
    ----------
    f : function
        A real function that maps R^N --> R.
    x0 : np.array
        The initial search point for a local minimum.
    tol : float
        Relative tolerance of the minimization process.
    which : np.array
        Array of booleans indicating over which arguments the function should be
        minimized.  Defaults to minimizing over all arguments.
    verbose : bool
        Indicator for whether to print iterative progress to screen.
        
    Returns
    -------
    xstar : float
        A local minimum of f(x) that is "near" x0.
    '''
    if which is None:
        which = np.ones_like(x0).astype(bool)
    maxiter = 10000
    x_now = x0[which]
    converged = False
    
    # Make a temporary function to be minimized
    def f_alt(x):
        x_temp = x0.copy()
        x_temp[which] = x
        return f(x_temp)
    
    i = 0
    eval_count = 0
    while (not converged) and (i < maxiter):
        dir_vec = calcGradient(f_alt,x_now)
        tempFunc = lambda alpha : f_alt(x_now + alpha*dir_vec)
        step,evals = minimizeQnDscalar(tempFunc,0.0)
        step *= dir_vec
        eval_count += evals
        x_next = x_now + step
        if (np.max(np.abs(step/(1.+x_next))) < tol):
            converged = True
        x_now = x_next
        fx_now = f_alt(x_now)
        eval_count += 1
        i += 1
        if verbose:
            print('Iteration ' + str(i) + ': x=' + str(x_now) + ', f(x)=' + str(fx_now) + ', total evals=' + str(eval_count))
        
    if i == maxiter:
        print('Local minimum was not found within ' + str(maxiter) + ' iterations!')
    xstar = x_now
    print('Minimization by steepest descent took ' + str(i) + ' iterations with ' + str(eval_count) + ' function evaluations.')
    return xstar


def minimizeNewton(f,x0,tol=0.000001,verbose=False):
    '''
    Finds a minimum of the function f: R^N --> R near x0 using Newton's method.
    
    Parameters
    ----------
    f : function
        A real function that maps R^N --> R.
    x0 : np.array
        The initial search point for a local minimum.
    tol : float
        Relative tolerance of the minimization process.
    verbose : bool
        Indicator for whether to print iterative progress to screen.
        
    Returns
    -------
    xstar : float
        A local minimum of f(x) that is "near" x0.
    '''
    N = x0.size
    maxiter = 10000
    x_now = x0
    converged = False
    
    i = 0
    eval_count = 0
    while (not converged) and (i < maxiter):
        grad = calcGradient(f,x_now)
        hess = calcHessian(f,x_now)
        eval_count += 1 + N + 1 + N*(N-1)/2 # gradient plus hessian evaluations
        dir_vec = np.linalg.solve(hess,-grad)
        tempFunc = lambda alpha : f(x_now + alpha*dir_vec)
        step, evals = minimizeQnDscalar(tempFunc,1.0) # Newton with line search
        step *= dir_vec
        eval_count += evals
        x_next = x_now + step
        if (np.max(np.abs(step/(1.+x_next))) < tol):
            converged = True
        x_now = x_next
        fx_now = f(x_now)
        eval_count += 1
        i += 1
        if verbose:
            print('Iteration ' + str(i) + ': x=' + str(x_now) + ', f(x)=' + str(fx_now) + ', total evals=' + str(eval_count))
        
    if i == maxiter:
        print('Local minimum was not found within ' + str(maxiter) + ' iterations!')
    xstar = x_now
    print("Minimization by Newton's method took " + str(i) + ' iterations with ' + str(eval_count) + ' function evaluations.')
    return xstar


def minimizeBFGS(f,x0,tol=0.000001,which=None,verbose=False):
    '''
    Finds a minimum of the function f: R^N --> R near x0 using the BFGS method,
    starting with the identity matrix as the initial "approximate Hessian".
    
    Parameters
    ----------
    f : function
        A real function that maps R^N --> R.
    x0 : np.array
        The initial search point for a local minimum.
    tol : float
        Relative tolerance of the minimization process.
    which : np.array
        Array of booleans indicating over which arguments the function should be
        minimized.  Defaults to minimizing over all arguments.
    verbose : bool
        Indicator for whether to print iterative progress to screen.
        
    Returns
    -------
    xstar : float
        A local minimum of f(x) that is "near" x0.
    '''
    if which is None:
        which = np.ones_like(x0).astype(bool)
    N = np.sum(which)
    maxiter = 10000
    x_now = x0[which]
    converged = False
    
    # Make a temporary function to be minimized
    def f_alt(x):
        x_temp = x0.copy()
        x_temp[which] = x
        return f(x_temp)
    
    i = 0
    hess = np.eye(N) # Initial approximate Hessian is simply identity matrix
    grad = calcGradient(f_alt,x_now)
    eval_count = N+1
    while (not converged) and (i < maxiter):
        dir_vec = np.linalg.solve(hess,-grad)
        tempFunc = lambda alpha : f_alt(x_now + alpha*dir_vec)
        step, evals = minimizeQnDscalar(tempFunc,0.0) # BFGS with line search
        step *= dir_vec
        eval_count += evals
        x_next = x_now + step
        if (np.max(np.abs(step/(1.+x_next))) < tol):
            converged = True
        grad_next = calcGradient(f_alt,x_next)
        eval_count += N+1
        zk = np.reshape(step,(N,1))
        yk = np.reshape(grad_next - grad,(N,1)) # Update approximate Hessian
        if (np.mod(i,N)) == 0 and (i > 1):
            hess = np.eye(N) # Reset the Hessian every N iterations to prevent bogging
        else:
            hess += -np.dot(np.dot(hess,np.dot(zk,zk.transpose())),hess)/np.dot(zk.transpose(),(np.dot(hess,zk))) + np.dot(yk,yk.transpose())/np.dot(yk.transpose(),zk)
        x_now = x_next
        fx_now = f_alt(x_now)
        eval_count += 1
        grad = grad_next
        i += 1
        if verbose:
            print('Iteration ' + str(i) + ': x=' + str(x_now) + ', f(x)=' + str(fx_now) + ', total evals=' + str(eval_count))
        
    if i == maxiter:
        print('Local minimum was not found within ' + str(maxiter) + ' iterations!')
    xstar = x0.copy()
    xstar[which] = x_now
    print('Minimization by BFGS took ' + str(i) + ' iterations with ' + str(eval_count) + ' function evaluations.')
    return xstar


