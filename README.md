# local-llm-tutorial-2504

ローカルでLLMを動かすのを目指す。オフライン環境でのインストールもできると非常に良い。

## 環境構築

### ollamaのインストール

- Github: https://github.com/ollama/ollama

公式で案内されているインストール方法は、1. インターネット接続が必要、2. sudo権限が必要という課題がある。

sudoなし、オフラインでインストールする手順。

#### バイナリファイルのダウンロード

インターネットにつながる端末でバイナリファイルをダウンロードする。

```bash
# バイナリファイルのダウンロード (Githubのリリースページにあるやつでも良いかも)
curl -L https://ollama.com/download/ollama-linux-amd64.tgz -o ollama.tgz
```

#### 解凍・パスを通す
```bash
mkdir ollama
cd ollama

# 解凍
tar -xzf ollama.tgz

```

解凍してできた `./bin` にパスを通す (必要であれば権限付与する)。

```bash
# サーバーを建てる
ollama serve    # バックグラウンドで実行するときは `nohup` を使う

# 別のターミナルから実行してみる
ollama --version
```


### モデルのダウンロード

[各種サイト](https://swallow-llm.github.io/evaluation/index.ja.html)を参考に性能の良さそう／サイズが小さそう なモデルを探す。主要なモデルはollamaでダウンロードできるらしいが、オフラインインストールできるようにするため、自分でダウンロードする方法を覚える。

Hugging Faceからファイルをダウンロード。`tokyotech-llm-Llama-3.1-Swallow-8B-Instruct-v0.3-Q5_K_M.gguf` にした。
- https://huggingface.co/mmnga/tokyotech-llm-Llama-3.1-Swallow-8B-Instruct-v0.3-gguf/tree/main

### モデルの作成・実行

```bash
# モデルの作成
ollama create swallow-8b -f ./Modelfile # swallow-8b 部分がモデル名

# モデルの実行
ollama run swallow-8b

# プロンプトから抜けるとき
/bye
```

### （インターネットにつながる場合）モデルのダウンロード～実行

```bash
ollama run hf.co/mmnga/tokyotech-llm-Llama-3.1-Swallow-8B-Instruct-v0.3-gguf
```

### open-webuiのインストール

```bash
conda create -n open-webui python=3.11
conda activate open-webui
python3 -m pip install open-webui
```

```bash
# サーバーを建てる
open-webui serve --port 8080
```

ブラウザで http://localhost:8080 にアクセスすると使える！

よくわからないけれど、ollamaのモデルも勝手に認識してくれた。
認識してくれてないときは、「設定」＞「接続」＞「Ollama API」から `http://localhost:11434` を追加すれば良さそう。

sshで接続した先でサーバーを建てた場合は、ポートフォアワーディングしてやればよい。

```bash
ssh username@hostname -L 8080:localhost:8080
```

## 参考

- [Ollamaで体験する国産LLM入門](https://zenn.dev/hellorusk/books/e56548029b391f)
