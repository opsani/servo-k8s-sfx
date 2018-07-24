# Optune Servo with Kubernetes (adjust) and SignalFx (measure) drivers

## Build servo container
```
docker build . -t example.com/servo-k8s-sfx
```

## Running servo as a Deployment within the application namespace

See the servo-sfx repository README for instructions on configuring the servo deployment with a Kubernetes secret containing the SignalFx API key.

__WIP__

> The `OPTUNE_USE_DEFAULT_NAMESPACE` environment variable set to `1` is used when the servo is embedded in the application itself (e.g., runs as a pod within the same namespace); this allows the namespace to be different from the `app_id` given to the servo.

