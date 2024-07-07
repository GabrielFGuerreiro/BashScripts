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
