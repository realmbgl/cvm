# cvm


```
openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
```


```
docker build -t myvm .
```


```
docker run -d -p 2222:22 -p 6080:6080 --name=myvm myvm
```


```
https://<your-host-ip>:6080/vnc.html

username: ubuntu
initial password: passw0rd

```

```
docker build -t <your-docker-hub-id>/myvm .

docker push <your-docker-hub-id>/myvm
```

launching with mesos marathon

```
{
  "id": "myvm",
  "container": {
    "docker": {
      "image": "<your-docker-hub-id>/myvm",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 6080, "protocol": "tcp" },
        { "containerPort": 22, "protocol": "tcp" }
      ]
    }
  },
  "args": [],
  "cpus": 2,
  "mem": 2048,
  "env": {
  },
  "instances": 1,
  "constraints": []

}
```

```
https://<myvm-ip>:<myvm-1st-port>/vnc.html

username: ubuntu
initial password: passw0rd
```

