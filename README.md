# EventStore Droplet Image Builder

This project creates a DigitalOcean droplet image with EventStoreDB OSS using Packer and a cloud-init script for certificate configuration.

## Prerequisites

- [Packer](https://www.packer.io/) (>= 1.0.0)
- [DigitalOcean API Token](https://docs.digitalocean.com/reference/api/create-personal-access-token/)

## Image Configuration

The Packer configuration (`eventstore-droplet-forge.pkr.hcl`) sets up:
- Ubuntu 20.04 LTS as the base image
- Region: NYC3
- Droplet Size: s-1vcpu-1gb
- Custom EventStore configuration file
- Ansible provisioning for setup

## Certificate Setup

The cloud-init script performs the following:
- Downloads and configures SSL certificates:
  - CA certificate
  - Node certificate
  - Node key
- Sets appropriate ownership to eventstore user
- Updates system CA certificates
- Configures firewall to allow EventStore traffic (port 2113)
- Starts the EventStore service

## Usage

1. Set your DigitalOcean API token:
```bash
export DIGITALOCEAN_API_TOKEN=your_token_here
```

2. Build the image using Packer:
```bash
packer init eventstore-droplet-forge.pkr.hcl
packer build eventstore-droplet-forge.pkr.hcl
```

The build process will create a snapshot named `eventstore-YYYY_MM_DD, hh-mm` in your DigitalOcean account. 
