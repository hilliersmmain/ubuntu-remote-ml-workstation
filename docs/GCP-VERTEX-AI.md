# GCP Vertex AI Integration

## Overview
We use $1000 in Vertex AI credits for workloads exceeding local RTX 3060 capabilities (12GB VRAM).

## Setup
1. **GCP Project:** Create/Select project in Google Cloud Console.
2. **APIs Enabled:** Enable "Vertex AI API".
3. **Authentication:**
   - Install gcloud CLI.
   - Run `gcloud auth application-default login`.
   - Set project: `gcloud config set project <PROJECT_ID>`.

## Dual-Mode Workflow
1. **Develop Local:** Prototype on small subsets of data using local GPU.
2. **Scale Remote:** Use Vertex AI Training jobs for full dataset training.

## Python SDK
```python
from google.cloud import aiplatform

aiplatform.init(project='my-project', location='us-central1')

job = aiplatform.CustomTrainingJob(
    display_name='my-training-job',
    script_path='train_script.py',
    container_uri='us-docker.pkg.dev/vertex-ai/training/pytorch-gpu.2-0:latest',
)
```
