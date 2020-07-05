n 		= 3
J 		= 1000
t 		= c( rep(0, J) )
nor 	= c( rep(0, J) )

for (j in 1:J){
  x      = runif(n)
  t[j]   = sqrt(n) * ( (mean(x) - 0.5)/sd(x) )
  nor[j] = pnorm(t[j])
}
t     = sort(t)
t_q   = seq(0,J-1)/J
nor_q = sort(nor)
t_q_l=t_q[nor_q>0.99]
nor_q_l=nor_q[nor_q>0.99]
t_q_c=t_q[t_q>0.99]
nor_q_c=nor_q[t_q>0.99]
plot(t_q, nor_q, pch=16, col="steelblue")
points(t_q_l, nor_q_l, pch=16, col="tomato")
points(t_q_c, nor_q_c, pch=16, col="lightgreen")
lines(c(-1,2), c(-1,2))