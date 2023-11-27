# TP2-DesenvolvimentoDeAplicacoesWeb-PetShop

 # PetShop Cão Q-Late

O projeto PetShop Cão Q-Late visa fornecer uma solução de software para gerenciar os serviços oferecidos a cães pela pet shop. O sistema é projetado para atender aos seguintes requisitos detalhados:

## Recursos do Usuário

### Cliente

1. **Cadastro e Login:**
   - Os clientes podem se cadastrar e fazer login usando seu e-mail e senha.
   - Novos usuários precisam confirmar seu registro por meio de um link enviado por e-mail.

2. **Gerenciamento de Perfil:**
   - Os clientes podem gerenciar suas informações de perfil, incluindo a atualização do número de contato e senha.

3. **Gerenciamento de Cães:**
   - Os clientes podem cadastrar seus cães, fornecendo detalhes como nome, raça e tamanho (pequeno, médio, grande).

4. **Agendamento de Serviços:**
   - Os clientes podem agendar serviços para seus cães, especificando a data, tipo de serviço e o cão.
   - O sistema verifica a disponibilidade e, se a data estiver livre, agenda o serviço; caso contrário, informa o cliente.

5. **Listar Serviços Agendados:**
   - Os clientes podem visualizar uma lista de serviços agendados, mas ainda não executados, mostrando a data, nome do cão e serviço.
   - Uma opção de cancelamento está disponível se a data de execução do serviço for superior a 24 horas.

6. **Listar Serviços Executados:**
   - Os clientes podem visualizar uma lista de todos os serviços já prestados a seus cães, incluindo a data, cão, serviço e custo.

### Administrador

1. **Gerenciamento de Serviços:**
   - Os administradores podem adicionar, atualizar ou remover serviços oferecidos pela pet shop, juntamente com seus preços correspondentes.

2. **Listar Serviços Agendados:**
   - Os administradores podem visualizar uma lista de todos os serviços agendados a partir de uma data específica.

3. **Execução de Serviços:**
   - Os administradores podem registrar a execução de serviços, especificando a data de conclusão do(s) serviço(s) realizado(s).
   - O sistema calcula o custo final, aplicando um desconto de 10% se três ou mais serviços forem selecionados para o mesmo cão.

4. **Gerar Relatórios de Serviços:**
   - Os administradores podem gerar um relatório listando todos os serviços prestados dentro de um intervalo de datas, incluindo a receita total.

## Diretrizes de Desenvolvimento

- Utilizar conceitos Spring MVC para implementação.
- Utilizar o Maven para gestão do projeto.
- Criar um modelo de classe adequado e relacionamentos para modelagem do banco de dados usando JPA.
- Implementar classes DAO (Data Access Object) genéricas para encapsular a JPA para persistência de dados.
- Criar classes DAO específicas para consultas personalizadas no banco de dados.
- Utilizar Ajax para operações no servidor e renderização parcial da página.
- Aplicar CSS para aprimorar a aparência visual da aplicação.
- Implementar uma barra de navegação para fácil acesso a todas as funcionalidades com base no perfil do usuário.
- Validar todos os campos de entrada e exibir mensagens de erro quando necessário.
- Implementar autenticação de usuário, permitindo login e logout.
- Utilizar uma biblioteca como Apache Commons para envio de e-mails.
- Implementar timeout de sessão após 2 minutos de inatividade.
- Avaliar tanto a funcionalidade quanto as boas práticas de codificação.

