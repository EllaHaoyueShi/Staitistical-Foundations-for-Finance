# Introduction

## What are the codes here used for?

The main programs are shown as follows:

1. `Student_t.m` calculates the p.d.f. of Student's t-distribution by its definition and the inversion formula, and outputs a plot of these 2 p.d.f.s.

2. `Sum_of_Student_t.m`  calculates the p.d.f. of the sum r.v. of 2 Student's t-distribution (with the same or different degrees of freedom) by: 1. Convolution Formula; 2. Simulation; 3. Inversion formula.

3.  Given the true value of $df$ of a Student's t-distribution, the sample size, the resample size in each Bootstrap and the number of simulation, `Estimation_ofES.m`  outputs a true ES value and c.i. for ES by parametric and nonparametric Bootstrap. Apart from that, one can get the plots about the actual coverage and the average length of c.i.  from this file.

---

The folder `funcs` stores the function we defined to do the calculation mentioned above. The detailed explanation of each function can be read in the source code files. The call sequence of the functions are: 

```
getSumStudenttPDFByConvolution(mu,scale,x,v1,v2)
=> getStudenttPDFByDefinition(mu,scale,v,x)

getStudenttPDFByInversion(v, x) 
=> getStudenttCF(t,v) 
	=> bessel_3(z,x)
	
tBootstrapES(df, sample_size, bootstrap_num, cilevel)
=> getES(mu,scale,v,ESlevel)
=> tMaxLike(x, initvec)
	=> tLogLike(param, x, bound)
		=> einschrk ( pin ,bound , Vin )
```

