# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: _PROJECT_NAME
  labels:
    app: _PROJECT_NAME
spec:
  replicas: 3
  selector:
    matchLabels:
      app: _PROJECT_NAME
  template:
    metadata:
      labels:
        app: _PROJECT_NAME
    spec:
      containers:
      - name: _PROJECT_NAME
        image: gcr.io/GOOGLE_CLOUD_PROJECT/_PROJECT_NAME:COMMIT_SHA
        ports:
        - containerPort: 8080
      readinessProbe:
        httpGet:
          path: /health
          port: 8080
        ports:
        - containerPort: 8080
          name: _PROJECT_NAME
---
kind: Service
apiVersion: v1
metadata:
  name: _PROJECT_NAME
spec:
  selector:
    app: _PROJECT_NAME
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
