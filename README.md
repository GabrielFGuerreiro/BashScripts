# Sobre
Este repositório contém os materiais dos meus estudos nas aulas de Sistemas Operacionais, realizados na Fatec Baixada Santista - Rubens Lara. Nesse repositório estarão os scripts realizados tanto em sala de aula quanto fora dela.

# Conceitos estudados
- **Manipulação de Diretórios**: Uso de comandos Bash para navegação, criação, modificação e exclusão de arquivos e diretórios.
- **Cópia e Movimentação de Arquivos**: Utilização de cp para copiar arquivos, mv para mover e renomear arquivos e diretórios.rios.
- **Gestão de Usuários e Permissões**: Scripts para manipulação de usuários e gerenciamento de permissões de acesso.
- **Permissões de Arquivos e Diretórios**: Utilização de comandos como chmod para alterar permissões de acesso e chown para modificar proprietários de arquivos.
- **Comandos importantes**: Resolução de problemas com o uso de comandos úteis, como "sed", "grep", "tr", "awk" e outros.

# Scripts descrições
### **Script1**  
Um script que converta o tempo em minutos e segundos.

### **Script2**
Um script que promova a autenticação no ambiente Linux.

### **Script3**
Um script que quando executado solicite uma senha. Se a senha estiver errada exiba mensagem orientando o usuário e se o mesmo pressionar ENTER retorna a execução do programa.  
Caso a senha esteja correta, deve ser feito o menu:  
1. Identificar um usuário  
2. Criar um usuário  
3. Apagar um usuário  
4. Sair  

Caso 1 verificar se o usuário existe, se sim exiba as informações, senão exiba mensagem dizendo usuário não cadastrado.  
Caso 2 verificar se o usuário existe, se sim exibir mensagem dizendo que o usuário já existe, senão criar o usuário e definir sua senha.  
Caso 3 verificar se o usuário existe, se sim apagar o usuário e sua área de trabalho, senão exibir mensagem que o usuário não está cadastrado.  
Qualquer outra escolha deverá ser exibida mensagem de erro e retornar para o menu.  

### **Script4**
Um script que deverá receber um caminho. Caso o caminho exista, deverá pedir o nome do arquivo. Se o arquivo existir e for do tipo txt, exiba o conteúdo do arquivo e em seguida separando as palavras que compõem por um X na frente e um X atrás exibindo como ficou o novo texto.

### **Script5**
Um script que mostre as informações de todos os usuários do ambiente Linux, cuja a identificação de usuário seja maior ou igual a 500, cabendo salientar que entre as informações de cada usuário deverá ser criado uma espera de 6 segundos.

### **Script6**
Um script que receba por parâmetro o diretório e a extensão do arquivo e a partir dessas informações será feita uma busca nos arquivos desse diretório que contém “-“, caso exista será substituído por “_” exibindo as informações.

### **Script7**

Um script que receba por argumento a rota que será pesquisada.
Caso a rota não seja informada, deve ser exibido uma mensagem orientando o usuário.
Se a rota não existir, exiba mensagem de erro orientando o usuário.
Caso a rota exista, deve ser criado o menu:

Menu  
<1> Listagem completa  
<2> Listagem somente dos diretórios  
<3> Listagem somente dos arquivos  
<4> Listagem somente dos links  
<5> Sair  

### **Script8**
 
 Um script que recebe um diretório e contabiliza a quantidade de itens (diretórios/arquivos).
 Se o arquivo tiver a extensão .txt, renomeie sem ela.

 ### **Script9**

 Um script que receba valores de 1 a 100 e mostre a soma dos valores e a sua média enquanto o número -1 não for digitado.

 ### **Script10**

 Um script que receba uma senha. Caso a senha esteja errada, o usuário precisará apertar ENTER para tentar novamente ou ESPAÇO para encerrar o script. O usuário possui apenas 5 tentativas para acertar, caso não consiga, deverá esperar 5 segundos para continuar tentando.

 Após o usuário acertar a senha, um menu com opções deve aparecer. A opção 1 tem o objetivo de informar o user com diversas informações como a data/horário atual, o histórico de pesquisas.

# Docker
Para rodar os script é possível usar o Git Bash do VS Code, porém nem todos os comandos do ambiente linux estão disponíveis. Por isso, usei um contêiner Docker para configurar um ambiente de desenvolvimento isolado com todas as ferramentas necessárias.

## Como configurar o ambiente

### Passo 1: Instalar Docker

Se você ainda não tem Docker instalado, pode baixar e instalar a partir do site oficial: 

### Passo 2: Criar um Arquivo Dockerfile

No VS Code, crie um novo arquivo chamado Dockerfile no diretório do seu projeto com o seguinte conteúdo:

FROM ubuntu:latest

#Instalar utilitários necessários  
RUN apt-get update && apt-get install -y \  
    bsdmainutils \  
    util-linux \  
    && rm -rf /var/lib/apt/lists/*  

#Definir o diretório de trabalho  
WORKDIR /workspace  

#Iniciar com bash  
CMD ["bash"]  


### Passo 3: Criar um Arquivo docker-compose.yml

Crie um arquivo docker-compose.yml no mesmo diretório com o seguinte conteúdo:

version: '3.8'  

services:  
  bash-env:  
    build: .  
    volumes:  
      - .:/workspace  
    tty: true  

### Passo 4: Dev Containers

1. Instale a extensão Dev Containers
2. Com o Docker aberto, abra o comando Command Palette (Ctrl+Shift+P) e procure por Remote-Containers: Open Folder in Container.
3. Selecione o diretório do seu projeto.
(O VS Code vai usar o docker-compose.yml e o Dockerfile para configurar e abrir o ambiente de desenvolvimento dentro de um contêiner Docker.)

## Como parar a execução do contêiner/desconecta-lo do VS

### Opção 1
No VS Code, você pode desconectar do contêiner Docker através da paleta de comandos. Pressione Ctrl+Shift+P para abrir a paleta de comandos e digite Remote-Containers: Close Remote Connection. Isso irá desconectar o VS Code do contêiner.

### Opção 2
Se você estiver usando o Docker Desktop, pode abrir o Docker Dashboard e encontrar o contêiner em execução na lista de contêineres.
Clique no contêiner e, em seguida, clique no botão para parar o contêiner.