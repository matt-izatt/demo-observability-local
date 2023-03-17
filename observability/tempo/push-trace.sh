curl -X POST http://localhost:64455 -H 'Content-Type: application/json' -d '[{
 "id": "1234",
 "traceId": "6543210abcdef",
 "timestamp": 1608239395286533,
 "duration": 100000,
 "name": "Recieved request from user",
 "tags": {
    "http.method": "GET",
    "http.path": "/api"
  },
  "localEndpoint": {
    "serviceName": "Service A"
  }
}]'


curl -X POST http://localhost:64455 -H 'Content-Type: application/json' -d '[{
 "id": "5678",
 "traceId": "6543210abcdef",
 "parentId": "1234",
 "timestamp": 1608239395316533,
 "duration": 50000,
 "name": "Recieved request from Service A",
  "localEndpoint": {
    "serviceName": "Service B"
  }
}]'


curl -X POST http://localhost:64455 -H 'Content-Type: application/json' -d '[{
 "id": "9101112",
 "traceId": "6543210abcdef",
 "parentId": "5678",
 "timestamp": 1608239395346533,
 "duration": 20000,
 "name": "Querying Event Journal",
  "localEndpoint": {
    "serviceName": "Event Journal"
  }
}]'

curl -X POST http://localhost:64455 -H 'Content-Type: application/json' -d '[{
 "id": "13141516",
 "traceId": "6543210abcdef",
 "parentId": "5678",
 "timestamp": 1608239395346533,
 "duration": 15000,
 "name": "Querying Relational DB",
  "localEndpoint": {
    "serviceName": "Relational DB"
  }
}]'