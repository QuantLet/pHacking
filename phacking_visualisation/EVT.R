library("evd")

m = 10000
n = 100
n_large = 10000
x_c=c( rep(0, m) )
x_c_large=c( rep(0, m) )
for (i in 1:m){
    x=max(rnorm(n))
    x_large=max(rnorm(n_large))
    x_c[i]=x
    x_c_large[i]=x_large
}
mu_n=qnorm(1-(1/n))
sigma_n=qnorm(1-(1/n)*exp(-1))-mu_n
mu_n_l=qnorm(1-(1/n_large))
sigma_n_l=qnorm(1-(1/n_large)*exp(-1))-mu_n_l
x=sort(x_c)
y=sort(rgumbel(m,mu_n, sigma_n))
x_large=sort(x_c_large)
y_large=sort(rgumbel(m,mu_n_l, sigma_n_l))
plot(x, y, pch=16, col="steelblue", xlim=c(1,7), ylim=c(1,7))
points(x_large, y_large, pch=16, col="lightgreen")
lines(c(-10,10), c(-10,10))