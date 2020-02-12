# rzmqdb-driver
R ZeroMQ Database Driver

## Load rzmqdb-driver
```
library(rzmqdb-driver)
```

## Insert data
```
rzmqdb.driver::insert("81caa6f8-fb01-484d-8472-c5f2c066de86","doc1","mtcars", mtcars)
```

## Select data
```
data <- rzmqdb.driver::select("81caa6f8-fb01-484d-8472-c5f2c066de86","doc1","mtcars")
```

