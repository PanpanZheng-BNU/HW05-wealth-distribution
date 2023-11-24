# HW05 wealth distribution

## The structure of data
### The structure of entire folder
- `./data/N100` folder which stores the data when agents' number $N = 100$ 
    - `alpha03` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$  follows a power-law distribution with an exponent parameter of $\alpha = 0.3$ 
    - `alpha07` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a power-law distribution with an exponent parameter of $\alpha = 0.7$  
    - `alphan03` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a power-law distribution with an exponent parameter of $\alpha = -0.3$  
    - `alphan07` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a power-law distribution with an exponent parameter of $\alpha = -0.7$  
    - `u05` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a uniform distributin $U(0.0,0.5)$ 
    - `u51` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a uniform distributin $U(0.5,1.0)$ 
    - `u24` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a uniform distributin $U(0.2,0.4)$ 
    - `u79` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a uniform distributin $U(0.75,0.95)$ 
    - `u81` data of wealth(`m*.csv`) and saving propensity(`lambda*.csv`) corresponding to each steady wealth distribution, when the saving propensity $\lambda$ follows a uniform distributin $U(0.8,1,0)$ 
    - `lambda` data of the saving propensity when the saving propensity $\lambda$ obey to uniform distribution $U(0,1)$
    - `m` data of wealth (or incomes) which coresponds to the saving propensity in `./lambda`
- `./data/N1000` folder which stores the data when agents' number $N =1000$ 
    - `lambda` data of the saving propensity when the saving propensity $\lambda$ obey to uniform distribution $U(0,1)$
    - `m` data of wealth (or incomes) which coresponds to the saving propensity in `./lambda`
- `./data/N200` folder which stores the data when agents' number $N = 200$ 
    - `lambda` data of the saving propensity when the saving propensity $\lambda$ obey to uniform distribution $U(0,1)$
    - `m` data of wealth (or incomes) which coresponds to the saving propensity in `./lambda`

### The structure of single `.csv` file
- `m*.csv`
    - each row is one steady distribution of wealth or incomes $m$ 

        |          | $m_{1}$ | $m_{2}$ | $\cdots$ | $m_{N}$ |
        |:---------|:--------|:--------|:---------|:--------|
        | $1$      |         |         |          |         |
        | $2$      |         |         |          |         |
        | $\vdots$ |         |         |          |         |
        | $n$      |         |         |          |         |

- `lambda*.csv`
    - each row is saving propensity $\lambda$ corresponding to each steady distribution of wealth

        |          | $\lambda_{1}$ | $\lambda_{2}$ | $\cdots$ | $\lambda_{N}$ |
        |:---------|:--------------|:--------------|:---------|:--------------|
        | $1$      |               |               |          |               |
        | $2$      |               |               |          |               |
        | $\vdots$ |               |               |          |               |
        | $n$      |               |               |          |               |

