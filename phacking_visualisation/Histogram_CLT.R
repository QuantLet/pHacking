library("evd")
library("rmutil")
library("ggplot2")
n_stack  = c(5,10,100,1000,10000,100000)
J        = 1000
p        = 0.025
q_p      = -qnorm(0.025, 0, 1)
p_crit_n = c()
for (n in n_stack){
  p_crit = 0
  for (j in 1:J){
      x = runif(n)
      #x = rt(n,1)
      #x = rlaplace(n)
      #x = rcauchy(n)
      t = sqrt(n) * ( (mean(x) - 0)/sd(x) )
      if (abs(t) > q_p) {
          p_crit = p_crit+1
      }  
  }
  p_crit_n = rbind(p_crit_n,p_crit/J*100)  
}
Uniform   = p_crit_n
#Student_t = p_crit_n
#Cauchy    = p_crit_n
#Laplace   = p_crit_n

df = data.frame(Uniform, Laplace, Student_t, Cauchy)
barplot(t(as.matrix(df)), beside=TRUE, col=c("tomato", "steelblue", "lightgreen", "orange"),names.arg=c("5","10","100","1000","10000","100000"), xlab = "n", ylab="P(%)")
