# Proposal: Harden Kubernetes for Experimental Release

## Problem
The Kubernetes management flow relies on K3s running inside virtual machines or containers. Since container and virtualization backends are still undergoing refinement, Kubernetes orchestration is a high-risk feature that must not block the core 0.1 release, yet remains highly valuable to showcase.

## Goal
Mark the Kubernetes features as "Experimental" in the CLI and App. Hardens the VM-backed K3s setup, cluster listing, kubeconfig generation, and teardown logic, failing gracefully if prerequisites are unmet.

## Non-goals
- No production-grade multi-node clustering.
- No Helm charts catalog or package manager UI.
- No integrated Kubernetes dashboard clone (use external lenses or kubectl).

## User impact
Users will see a clearly labeled "Experimental" Kubernetes view. They will be able to start a single-node K3s cluster on a local VM, extract its kubeconfig, and delete the cluster cleanly without corrupting other workflows.

## Engineering impact
- Updates the Kubernetes interface UI views with experimental badges.
- Standardizes cluster creation checks to verify virtualization is functional before starting K3s.
- Cleans up generated kubeconfig entries upon cluster removal.

## Risk
Medium. Kubernetes clusters occupy significant CPU/memory resources; if the user's host environment is resource-constrained, VM startup could fail and cause UI lockups.

## Rollback
Optionally hide or disable the Kubernetes tab from sidebar if it breaks local builds.
