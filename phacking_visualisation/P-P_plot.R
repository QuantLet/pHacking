skewed_uniform = function(n=1000, c=0.25)
{
  x1 = (runif(n)-1)/2
  x2 = runif(n)/2
  xx = runif(n)
  xx = xx<c
  x  = xx*x1+(1-xx)*x2
  x  = sort(x)
  return(x) 
}
n 		= 10
c     = 0.25
J 		= 1000
t 		= c( rep(0, J) )
nor 	= c( rep(0, J) )

for (j in 1:J){
  x      = skewed_uniform(n,c)
  t[j]   = sqrt(n) * ( (mean(x) - (-0.25*c+0.25*(1-c)))/sd(x) )
  nor[j] = pnorm(t[j])
}
t       = sort(t)
t_q     = seq(0,J-1)/J
nor_q   = sort(nor)
t_q_l   =t_q[nor_q>0.99]
nor_q_l = nor_q[nor_q>0.99]
t_q_c   = t_q[t_q>0.99]
nor_q_c = nor_q[t_q>0.99]
plot(t_q, nor_q, pch=16, col="steelblue")
points(t_q_l, nor_q_l, pch=16, col="tomato")
points(t_q_c, nor_q_c, pch=16, col="lightgreen")
lines(c(-1,2), c(-1,2))