# Partial Differential Equations Final Project

## Final Project Topic: 
Optimal Control of Systems Governed by Partial Differential Equations, Heat Sink Shape Optimization using the Adjoint Method

The purpose of the MATLAB files are to a) solve 2D Laplace Equation with Dirichlet and convective boundary conditions (constant heat emitted from the bottom of the heat sink in ambient temperature), b) calculate the defined objective function,
$$J = \lambda_{1}\frac{area_{k}}{area_{ref}} + \lambda_{2}\frac{temp_{k}}{temp_{ref}}$$
and c) generate the updated geometry using the adjoint method with a gradient descent algorithm.

### Background:
Final project for UC Irvine's Math 112C—Intro to Partial Differential Equations III course.

Concepts covered:
  1. Numerical Methods for ODEs and PDEs
     - Euler's Method
     - Error and Stability
     - Finite Differences for Heat Equation and 2D Poisson Equation
  2. Reaction-Diffusion Equations
     - Fisher-KPP Equation
     - Wave Speed
     - Turing Pattern Formation
  3. Random Walks
     - Stochastic Differential Equations
     - Fokker-Plank Equation
     - Ornstein-Uhlenbeck Process
  4. Black-Scholes Equation
     - Ito's Lemma
  5. Fourier Transforms for PDEs
