# 🏠 IAC-HomeLab

Este repositório contém a infraestrutura como código (**IaC**) para montar um **Home Lab** utilizando **Proxmox**, **Terraform** e **Kubespray**, com o objetivo de provisionar e configurar automaticamente um **cluster Kubernetes** de forma prática, escalável e reprodutível.

---

## 🚀 Objetivo do Projeto

A ideia é criar um ambiente completo de laboratório para:
- Estudo e prática com **Kubernetes**.
- Explorar integrações com ferramentas de observabilidade, segurança e automação.
- Ter um ambiente pessoal de simulação próximo a um cenário real de produção.

---

## 🛠️ Tecnologias Utilizadas

- **Proxmox VE** → Hypervisor para gerenciar máquinas virtuais (on-premise).
- **Terraform** → Automação do provisionamento de infraestrutura no Proxmox.
- **Kubespray** → Ferramenta para instalação e configuração do cluster Kubernetes.
- **Ansible** → Base do Kubespray, para gerenciar a configuração e orquestração dos nós.
- **Kubernetes** → Orquestrador de containers que será criado e configurado no cluster.

---




