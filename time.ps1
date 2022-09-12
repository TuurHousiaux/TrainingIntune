net stop w32time
w32tm /config /syncfromflags:manual /manualpeerlist:"0.be.pool.ntp.org 1.be.pool.ntp.org 2.be.pool.ntp.org 3.be.pool.ntp.org"
net start w32time
w32tm /config /update
w32tm /resync /rediscover
tzutil /s "Romance Standard Time"

