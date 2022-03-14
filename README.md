<h1 align="center">Microservices Stack 👋</h1>

> LAB de estudos de um caso de implementacao de uma stack completa para atender uma empresa que esta adotando microservicos em um ambiente AWS ou GCP. 

Estudo de caso: 
> Fomos contratados para fazer a migracao de um workload monolitico e on-premises;
- A empresa ja tem dois modulos de seu servico pronto para ser implementado.
- A empresa precisara manter seu core on primesses rodando e esses dois servicos sao essenciais para isso.

Arquitetura proposta:

![stack](https://shortest.link/3hRp)

Como se trata de uma simulacao nosso front-proxy (envoy) vai rodar dentro do cluster e nao em um servidor.

Stack:
 - Gerenciador de infraestrura = Terraform
 - Orquestador de Microservices = Kubernetes
 - Front-Proxy = Envoy 
 - Ingress Gateway = Contour
 - Service Mesh = Linkerd
 - Oberservabilidade = Prometheus e Grafana
 - CI/CD = GithubActions e ArgoCD


### ✨ [Demo](/)

## Instalação

```sh
terraform init
```

## Aplicando

```sh
terraform apply --auto-approve
```

## Validação

```sh
terraform validate
```

## Adicionando o contexto do nosso cluster ao kubectl

```bash
aws eks --region us-east-1 update-kubeconfig --name nome-do-cluster
```

```bash
kubectl get nodes
```

## Deploy o Ingress

```bash
kubectl apply -f kubernetes/ingress/contour.yaml
```
## Deploy o Mesh

```bash
kubernetes/linkerd/install.sh
```
## Deploy demo services

```bash
kubectl apply -f kubernetes/apps/service1/service1_deploy.yaml
kubectl apply -f kubernetes/apps/service2/service2_deploy.yaml
```
## 🤝 Contributing

Contribuicoes sao bem vindas!<br />

## Show your support

Deixe uma ⭐️ se esse projeto te ajudou!

## 📝 License

This project is [MIT](LICENSE) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_