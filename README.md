# Partial Differential Equations Final Project

## Final Project Topic: 
**Optimal Control of Systems Governed by Partial Differential Equations, Heat Sink Shape Optimization using the Adjoint Method**

---

The purpose of the MATLAB files are to a) solve 2D Laplace Equation with Dirichlet and convective boundary conditions ([Math_112C_Project_Main.m](https://github.com/kylespink13/Heat_Sink_Shape_Optimization/blob/01390ffe62fc844bdd0e15af78dad8b235d06ebb/Math%20112C%20Final%20Project%20Code/Math_112C_Project_Main.m)) (constant heat emitted from the bottom of the heat sink in ambient temperature), b) calculate the defined objective function ([objectiveFunction.m](https://github.com/kylespink13/Heat_Sink_Shape_Optimization/blob/01390ffe62fc844bdd0e15af78dad8b235d06ebb/Math%20112C%20Final%20Project%20Code/objectiveFunction.m)),
$$J = \lambda_{1}\frac{area_{k}}{area_{ref}} + \lambda_{2}\frac{temp_{k}}{temp_{ref}}$$
where $\lambda_{1}$ and $\lambda_{2}$ are weights placed on the normalized area and average temperature (to be minimized), and c) generate the updated geometry using the adjoint method with a gradient descent algorithm ([yGradient.m](https://github.com/kylespink13/Heat_Sink_Shape_Optimization/blob/01390ffe62fc844bdd0e15af78dad8b235d06ebb/Math%20112C%20Final%20Project%20Code/yGradient.m)).

---

### Background:
Final project for UC Irvine's Math 112C—Intro to Partial Differential Equations III course.

Material covered in the course:
  1. Numerical Methods for ODEs and PDEs
     - Euler's Method
     - Error and Stability
     - Finite Differences for Heat Equation and 2D Poisson Equation
  2. Reaction-Diffusion Equations
     - Fisher-KPP Equation
     - Wave Speed
     - Turing Pattern Formation
  3. Random Walks
     - Brownian Motion
     - Stochastic Differential Equations
     - Fokker-Planck Equation
     - Ornstein-Uhlenbeck Process
  5. Black-Scholes Equation
     - Ito's Lemma
  6. Fourier Transforms for PDEs
