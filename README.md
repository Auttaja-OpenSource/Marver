# Marver

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/0ebe243e3e3249d9a36c7b230dca354a)](https://app.codacy.com/app/auttaja-dev-team/Marver?utm_source=github.com&utm_medium=referral&utm_content=Auttaja-OpenSource/Marver&utm_campaign=Badge_Grade_Settings)
[![Docker Repository on Quay](https://quay.io/repository/kelwing/marver/status "Docker Repository on Quay")](https://quay.io/repository/kelwing/marver)

Marver is a K8s StatefulSet autoscaler that uses the Discord Gateway Bot endpoint to determine the recommended number of shards and automatically scale up when Discord recommends it.

This project requires that you already be using Kubernetes, and assume you have some understand of how Kubernetes works.  It also assumes that you have your bot set up to handle changes in the StatefulSet's replica count gracefully.  Meaning: if we scale up, all existing shards will need to re-identify with Discord to present the new shard count, and update their local cache as necessary.

## Getting Started
1.  Edit the glide.yaml to change the Kubernetes library version to the one that matches your cluster version.  You can find a [compatibility matrix](https://github.com/kubernetes/client-go#compatibility-matrix) on the client-go Github repository.
2.  Store the Discord bot token and webhook ID + token in Kubernetes secrets.
3.  Edit kubernetes/cronjob.yaml and change the environment variables to match your set up.
4.  Apply the Kubernetes configurations to the namespace your bot is in, and watch it autoscale :-D

