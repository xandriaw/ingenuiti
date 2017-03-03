
library('RODBC')
library('dplyr')

buko<- odbcConnect(dsn='buko', uid='buko-user', pwd='buko-access')
inspector<-odbcConnect(dsn='inspector', uid='buko-user', pwd='buko-access')