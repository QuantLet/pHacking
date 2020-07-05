n 		= 1000000
J 		= 100
p 		= 0.025
q_p 	= -qnorm(0.025, 0, 1)
t 		= c( rep(0, J) )

for (j in 1:J){
    x    = runif(n)
    t[j] = sqrt(n) * ( (mean(x) - 0.5)/sd(x) )
}

plot( abs(t) , pch=16)
for (j in 1:J){
    if (abs(t[j]) > q_p){
        points( abs(t[j]), x=j , pch=16, col="red")
    }
}  
abline(h = q_p, col = "blue")