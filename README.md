# 🤖 Testes Automatizados de API - Diretorias

Este repositório contém a automação de testes da API **The Mentalists Academy T14**, implementados em **Robot Framework**.  
O objetivo é validar os principais cenários de negócio relacionados ao **cadastro, consulta, edição e validação de diretorias**.

📌 Repositório oficial: 👉 [the-mentalists-academyt14-api-robot](https://github.com/Tiagosousabjj/the-mentalists-academyt14-api-robot)

---

## 🌍 Visão Geral

A suíte de testes foi criada com foco em:
- ✔️ **Validação funcional** dos endpoints da API
- ✔️ **Boas práticas de automação**
- ✔️ **Cobertura de cenários positivos e negativos**
- ✔️ **Relatórios detalhados** e rastreáveis
- ✔️ Facilidade de **execução local** ou em **pipelines CI/CD** (ex.: GitHub Actions)

---

## 🛠️ Tecnologias e Ferramentas

- 🐍 **Python 3.x** → linguagem base  
- 🤖 **Robot Framework** → framework de testes  
- 🌐 **RequestsLibrary** → para chamadas HTTP  
- 🧰 **Collections** → manipulação de dados  
- 📝 **Log HTML / Report HTML** → relatórios nativos do Robot  
- 🚀 (opcional) **GitHub Actions** → integração contínua  

---

## 📂 Estrutura do Projeto

the-mentalists-academyt14-api-robot/
├── diretorias.robot # 📜 Arquivo principal com todos os cenários de teste
├── resources/ # 📁 Pasta com recursos e keywords reutilizáveis
│ └── utils.py # 🔧 Funções auxiliares em Python
├── requirements.txt # 📦 Lista de dependências do projeto
├── .gitignore # 🚫 Arquivos e pastas ignorados pelo Git
└── README.md # 📖 Documentação do projeto

yaml
Copiar código

---

## ⚙️ Instalação do Ambiente

1. **Clone o repositório**
   ```bash
   git clone https://github.com/Tiagosousabjj/the-mentalists-academyt14-api-robot.git
   cd the-mentalists-academyt14-api-robot
Crie e ative um ambiente virtual (opcional, mas recomendado)

bash
Copiar código
python -m venv venv
source venv/bin/activate   # Linux / Mac
venv\Scripts\activate      # Windows
Instale as dependências

bash
Copiar código
pip install -r requirements.txt
Verifique a instalação do Robot

bash
Copiar código
robot --version
▶️ Como Executar os Testes
Rodar todos os cenários

bash
Copiar código
robot diretorias.robot
Rodar um cenário específico

bash
Copiar código
robot -t "Cenário 01: Criar diretoria" diretorias.robot
Rodar apenas casos que contêm uma tag

bash
Copiar código
robot -i smoke diretorias.robot
📊 Relatórios Gerados
Após a execução, os seguintes arquivos são criados na raiz do projeto:

log.html → Log detalhado da execução (passo a passo)

report.html → Relatório consolidado dos testes

output.xml → Saída em XML (útil para CI/CD)

🔎 Exemplo de relatório:


✅ Cenários de Teste Implementados
1️⃣ Criar diretoria
2️⃣ Campo diretoria obrigatório
3️⃣ Campo diretoria letras maiúsculas, minúsculas e &
4️⃣ Apenas letras maiúsculas
5️⃣ Apenas letras minúsculas
6️⃣ Apenas caracteres especiais
7️⃣ Letras maiúsculas, minúsculas e &
8️⃣ Mais de 50 caracteres
9️⃣ Buscar todas as diretorias
🔟 Buscar diretoria por ID
1️⃣1️⃣ Contar diretorias
1️⃣2️⃣ Editar diretoria

🤝 Boas práticas com Git & GitHub
🌱 Crie uma branch para suas alterações (feature/...)

📝 Commits claros e descritivos:

sql
Copiar código
git commit -m "Adiciona cenário X — descrição breve"
🔀 Abra um Pull Request para revisão

🧩 FAQ
❓ Preciso configurar variáveis de ambiente?
👉 Não, atualmente o projeto já traz os dados de autenticação direto no código.

❓ Onde vejo os logs dos testes?
👉 Após cada execução, abra o arquivo log.html no navegador.

❓ É possível rodar os testes no CI/CD?
👉 Sim, basta adicionar um workflow no GitHub Actions para rodar robot diretorias.robot.

📌 Próximos Passos
 Adicionar mais cenários de validação de borda

 Configurar GitHub Actions para execução automática

 Implementar variáveis de ambiente seguras para tokens e URLs

📌 Projeto para prática de automação de testes de API com Robot Framework




