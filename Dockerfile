FROM python:3.6-slim

WORKDIR /servo

# Install dependencies
RUN pip3 install signalfx requests PyYAML && \
    apt-get update && apt-get install -y apache2-utils

ADD https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl

# Install servo
ADD https://raw.githubusercontent.com/opsani/servo-k8s/master/adjust \
    https://raw.githubusercontent.com/opsani/servo-sfx/master/measure \
    https://raw.githubusercontent.com/opsani/servo/master/measure.py \
    https://raw.githubusercontent.com/opsani/servo/master/servo \
    /servo/

RUN chmod a+rwx /servo/adjust /servo/measure /servo/servo /usr/local/bin/kubectl
RUN chmod a+rw /servo/measure.py

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python3", "servo" ]