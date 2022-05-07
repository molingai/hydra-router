# 日志

hydraLogger 使用的是 https://github.com/pnxtech/hydra-plugin-hls

hydra-plugin-hls 在 hydra上加了log的方法, 这个方法会向  hydra-logging-svcs 服务发消息

```js
let msg = hydra.createUMFMessage({
    to: 'hydra-logging-svcs:/',
    from,
    body: {
      ts,
      serviceName: fromName,
      serviceVersion: hydra.getInstanceVersion(),
      instanceID: hydra.getInstanceID(),
      severity: type,
      body: message
    }
});
hydra.sendMessage(msg);
```

所以, 日志都会发到 hydra-logging-svcs 上

Hydra Logging Service (HLS)

HLS is a distributed logging service intended to aggrigate log entries for running microservice instances within a cluster.

Log entries are posted using Hydra's underlying Redis Pub/Sub channels which are socket streams that are more efficient since they don't rely on HTTP.

hydra-logging-svcs 在:
https://github.com/pnxtech/hydra-logging-svcs
它使用了 https://github.com/trentm/node-bunyan 来处理日志

