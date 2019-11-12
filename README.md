# `b` is a test-app for Qpard

## Summary

It has services, that use RabbitMQ and Bunny gem for receiving messages from `a`, sending messages back to it and calculating items costs

You can establish the connection to RabbitMQ in b-app by sending a get request

```
require 'rest-client'

r = RestClient.get('http://localhost:3001/')
```
