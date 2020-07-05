n 		= 10
J 		= 10000
t 		= c( rep(0, J) )

for (j in 1:J){
    x    = runif(n)
    t[j] = sqrt(n) * ( (mean(x) - 0.5)/sd(x) )
}
t=sort(t)
p_t 	= c( rep(0, 999) )
p_n 	= c( rep(0, 999) )

for (i in 1:999){
    p_t[i] = t[i*10]
    p_n[i] = qnorm(i/1000)
}
p_t_l=p_t[p_n< -2.326]
p_n_l=p_n[p_n< -2.326]
p_t_c=p_t[p_t< -2.326]
p_n_c=p_n[p_t< -2.326]
plot(p_t, p_n, pch=16, col="steelblue", xlim=c(-4,4), ylim=c(-4,4), xlab="",ylab="")
points(p_t_c, p_n_c, pch=16, col="tomato")
points(p_t_l, p_n_l, pch=16, col="lightgreen")
lines(c(-10,10), c(-10,10))