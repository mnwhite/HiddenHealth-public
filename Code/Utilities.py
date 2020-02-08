'''
This file contains some basic utilities used in the estimation.  The code here is
copy-pasted from an older version of the HARK package, which I wrote years ago.
'''
import numpy as np
from scipy.interpolate import interp1d
from time import time
from copy import copy
from scipy.optimize import fmin

def getPercentiles(data,weights=None,percentiles=[0.5],presorted=False):
    '''
    Calculates the requested percentiles of (weighted) data.  Median by default.
    
    Parameters
    ----------
    data : numpy.array
        A 1D array of float data.
    weights : np.array
        A weighting vector for the data.
    percentiles : [float]
        A list of percentiles to calculate for the data.  Each element should
        be in (0,1).
    presorted : boolean
        Indicator for whether data has already been sorted.
        
    Returns
    -------
    pctl_out : numpy.array
        The requested percentiles of the data.
    '''
    if data.size <= 2:
        return np.zeros(np.array(percentiles).shape) + np.nan
    
    if weights is None: # Set equiprobable weights if none were passed
        weights = np.ones(data.size)/float(data.size)
    
    if presorted: # Sort the data if it is not already
        data_sorted = data
        weights_sorted = weights
    else:
        order = np.argsort(data)
        data_sorted = data[order]
        weights_sorted = weights[order]
        
    cum_dist = np.cumsum(weights_sorted)/np.sum(weights_sorted) # cumulative probability distribution
    
    # Calculate the requested percentiles by interpolating the data over the
    # cumulative distribution, then evaluating at the percentile values
    inv_CDF = interp1d(cum_dist,data_sorted,bounds_error=False,assume_sorted=True)
    pctl_out = inv_CDF(percentiles)
    return pctl_out


def drawDiscrete(N,P=[1.0],X=[0.0],exact_match=False,seed=0):
    '''
    Simulates N draws from a discrete distribution with probabilities P and outcomes X.
    
    Parameters
    ----------
    P : np.array
        A list of probabilities of outcomes.
    X : np.array
        A list of discrete outcomes.
    N : int
        Number of draws to simulate.
    exact_match : boolean
        Whether the draws should "exactly" match the discrete distribution (as
        closely as possible given finite draws).  When True, returned draws are
        a random permutation of the N-length list that best fits the discrete
        distribution.  When False (default), each draw is independent from the
        others and the result could deviate from the input.
    seed : int
        Seed for random number generator.
        
    Returns
    -------
    draws : np.array
        An array draws from the discrete distribution; each element is a value in X.
    '''   
    # Set up the RNG
    RNG = np.random.RandomState(seed)
    
    if exact_match:
        events = np.arange(P.size) # just a list of integers
        cutoffs = np.round(np.cumsum(P)*N).astype(int) # cutoff points between discrete outcomes
        top = 0
        # Make a list of event indices that closely matches the discrete distribution
        event_list        = []
        for j in range(events.size):
            bot = top
            top = cutoffs[j]
            event_list += (top-bot)*[events[j]]
        # Randomly permute the event indices and store the corresponding results
        event_draws = RNG.permutation(event_list)
        draws = X[event_draws]
    else:
        # Generate a cumulative distribution
        base_draws = RNG.uniform(size=N)
        cum_dist = np.cumsum(P)
        
        # Convert the basic uniform draws into discrete draws
        indices = cum_dist.searchsorted(base_draws)
        draws = np.asarray(X)[indices]
    return draws


def minimizeNelderMead(objectiveFunction, parameter_guess, verbose=False, which_vars=None, **kwargs):
    '''
    Minimizes the objective function using the Nelder-Mead simplex algorithm,
    starting from an initial parameter guess.
    
    Parameters
    ----------
    objectiveFunction : function
        The function to be minimized.  It should take only a single argument, which
        should be a list representing the parameters to be estimated.
    parameter_guess : [float]
        A starting point for the Nelder-Mead algorithm, which must be a valid
        input for objectiveFunction.
    which_vars : np.array or None
        Array of booleans indicating which parameters should be estimated.  When
        not provided, estimation is performed on all parameters.
    verbose : boolean
        A flag for the amount of output to print.
        
    Returns
    -------
    xopt : [float]
        The values that minimize objectiveFunction.
    '''
    # Specify a temporary "modified objective function" that restricts parameters to be estimated
    if which_vars is None:
        which_vars = np.ones(len(parameter_guess),dtype=bool)
    def objectiveFunctionMod(params):
        params_full = copy(parameter_guess)
        params_full[which_vars] = params
        out = objectiveFunction(params_full)
        return out
    parameter_guess_mod = parameter_guess[which_vars]

    # Execute the minimization, starting from the given parameter guess
    t0 = time() # Time the process
    OUTPUT = fmin(objectiveFunctionMod, parameter_guess_mod, full_output=1, disp=verbose, **kwargs)
    t1 = time()

    # Extract values from optimization output:
    xopt = OUTPUT[0]        # Parameters that minimize function.
    fopt = OUTPUT[1]        # Value of function at minimum: ``fopt = func(xopt)``.
    optiter = OUTPUT[2]     # Number of iterations performed.
    funcalls = OUTPUT[3]    # Number of function calls made.
    warnflag = OUTPUT[4]    # warnflag : int
                            #   1 : Maximum number of function evaluations made.
                            #   2 : Maximum number of iterations reached.
    # Check that optimization succeeded:
    if warnflag != 0:
        print("Minimization failed! xopt=" + str(xopt) + ', fopt=' + str(fopt) + 
                      ', optiter=' + str(optiter) +', funcalls=' + str(funcalls) +
                      ', warnflag=' + str(warnflag))
    xopt_full = copy(parameter_guess)
    xopt_full[which_vars] = xopt

    # Display and return the results:
    if verbose:
        print("Time to estimate is " + str(t1-t0) +  " seconds.")
    return xopt_full


def calcHessian(f,x,eps=0.0001,which=None):
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
    which : np.array
        Boolean array of same size as x indicating which indices should be
        included in the Hessian.  All indices are included by default.
        
    Returns
    -------
    hessian : np.array
        The Hessian of f at x, as an NxN array.
    '''
    N = x.size
    if which is None:
        which = np.ones(N,dtype=bool)
    epsilon = np.abs(eps*x)
    fx = f(x)
    M = np.sum(which)
    these = np.where(which)[0]
    hessian = np.zeros((M,M))
        
    for k in range(M):
        i = these[k]
        for l in range(k+1):
            j = these[l]
            
            if i == j:
                x0 = copy(x)
                x0[i] -= epsilon[i]
                f0 = f(x0)
                x1 = copy(x)
                x1[i] += epsilon[i]
                f1 = f(x1)
                hessian[k,l] = (f1 + f0 - 2*fx)/(epsilon[i]**2)
            else:
                x0 = copy(x)
                x0[i] -= epsilon[i]
                x0[j] -= epsilon[j]
                f0 = f(x0)
                x1 = copy(x)
                x1[i] += epsilon[i]
                x1[j] -= epsilon[j]
                f1 = f(x1)
                x2 = copy(x)
                x2[i] -= epsilon[i]
                x2[j] += epsilon[j]
                f2 = f(x2)
                x3 = copy(x)
                x3[i] += epsilon[i]
                x3[j] += epsilon[j]
                f3 = f(x3)
                d2f_dxidxj = ((f3 - f2)/(2*epsilon[i]) - (f1 - f0)/(2*epsilon[i]))/(2*epsilon[j])
                hessian[k,l] = d2f_dxidxj
                hessian[l,k] = d2f_dxidxj
                
    return hessian