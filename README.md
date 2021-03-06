# rzmqdb-driver
R ZeroMQ Database Driver for [R ZeroMQ Database](https://github.com/aborderon/rzmqdb).


## Overview
R ZeroMQ Database provides a quick, easy and flexible way to store data in-memory.

Rzmqdb uses [fst](https://www.fstpackage.org/) to compress data. 
> The fst package for R provides a fast, easy and flexible way to serialize data frames. With access speeds of multiple GB/s, fst is specifically designed to unlock the potential of high speed solid state disks that can be found in most modern computers. Data frames stored in the fst format have full random access, both in column and rows.

## Build from source

> See the [rzmq](https://github.com/ropensci/rzmq) package for more details.

Installation from source requires [`ZeroMQ`](http://zeromq.org/area:download). On __Debian__ or __Ubuntu__ use [libzmq3-dev](https://packages.debian.org/testing/libzmq3-dev):

```
sudo apt-get install -y libzmq3-dev
```

On __Fedora__ we need [zeromq-devel](https://apps.fedoraproject.org/packages/zeromq-devel):

```
sudo yum install zeromq-devel
```

On __CentOS / RHEL__ we install [zeromq3-devel](https://apps.fedoraproject.org/packages/zeromq3-devel) via EPEL:

```
sudo yum install epel-release
sudo yum install zeromq3-devel
```

On __OS-X__ use [zeromq](https://github.com/Homebrew/homebrew-core/blob/master/Formula/zeromq.rb) from Homebrew:

```
brew install zeromq
```

## Use rzmqdb-driver

### Load rzmqdb-driver
```
library(rzmqdb-driver)
library(UUIDgenerate)
```

### Define environment variables

>**environmentId** : The environnement who contains informations of one document

>**documentId** : The document who contains informations of multiple values

>**key** : The key of one value

>**value** : The value to insert

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

> data
                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
```

