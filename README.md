# rzmqdb-driver
R ZeroMQ Database Driver

## Overview
R ZeroMQ Database provides a quick, easy and flexible way to store data in-memory.

Rzmqdb uses [fst](https://www.fstpackage.org/) to compress data. 
> The fst package for R provides a fast, easy and flexible way to serialize data frames. With access speeds of multiple GB/s, fst is specifically designed to unlock the potential of high speed solid state disks that can be found in most modern computers. Data frames stored in the fst format have full random access, both in column and rows.

## Use rzmqdb-driver

### Load rzmqdb-driver
```
library(rzmqdb-driver)
library(UUIDgenerate)
```

### Define environment variables
```
environmentId <- uuid::UUIDgenerate()
documentId <- "doc1"
key <- "mtcars"
```

### Insert data
```
rzmqdb.driver::insert(environmentId,documentId,key,mtcars)
```

### Select data
```
data <- rzmqdb.driver::select(environmentId,documentId,key)
```

