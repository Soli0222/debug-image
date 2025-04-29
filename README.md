# Debug Image for Kubernetes

このリポジトリは、Kubernetes環境でのデバッグに便利なツールが含まれたコンテナイメージを構築するためのDockerfileを提供します。

## 概要

このイメージは以下のような状況で役立ちます：
- Kubernetesクラスター内でのネットワーク問題の調査
- Podやコンテナ間の接続性のテスト
- クラスター内のDNS解決の確認
- システムリソースのモニタリング

## 含まれるツール

このイメージには以下のデバッグツールが含まれています：
- `curl`, `wget`: HTTPリクエスト用
- `net-tools`, `iproute2`: ネットワーク設定確認用
- `iputils-ping`, `traceroute`: ネットワーク接続性テスト用
- `dnsutils`: DNS問題の診断用
- `tcpdump`: ネットワークパケットの分析用
- `vim`, `nano`: テキスト編集用
- `strace`, `gdb`: プロセス分析用
- `netcat`, `socat`: TCP/UDPコネクション操作用
- `lsof`, `htop`, `procps`: プロセスとリソース監視用
- その他汎用ツール

## ビルド方法

以下のコマンドでDockerイメージをビルドできます：

```bash
docker build -t debug:latest .
```

## Kubernetesでの使用方法

提供されている`pod.yaml`を使用して、デバッグPodをクラスターにデプロイできます：

```bash
kubectl apply -f pod.yaml
```

デプロイ後、以下のコマンドでコンテナ内にアクセスできます：

```bash
kubectl exec -it debug-pod -- /bin/bash
```

## CI/CD

このリポジトリはGitHub Actionsを使用してイメージの自動ビルドと公開を行います。
新しいタグをプッシュすると、イメージが自動的にGitHub Container Registry（ghcr.io）に公開されます。

## カスタマイズ

必要に応じてDockerfileを編集し、追加のツールをインストールすることができます。
