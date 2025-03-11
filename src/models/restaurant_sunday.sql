select * 
from {{source("raw_data","RESTAURANTS")}}
WHERE OPEN_ON_SUNDAY=1
