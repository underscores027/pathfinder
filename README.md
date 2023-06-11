# TRABALHO 01:  PathFinder
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Eduardo Henrique Próspero Souza: duvrdx@gmail.com<br>
Lucas Vieira da Silva: lucasvieiradasilva07@gmail.com<br>

Mattheus Colares Gonçalves: mattheuscg11@hotmail.com<br>
Victor Oliveira Santos: victoroliveira34vv@gmail.com<br>

### 2.INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados <nome do projeto> 
<br>e motivação da escolha realizada. <br>

> A empresa "Pathfinder" desenvolveu um aplicativo que permite às pessoas oferecerem ou aceitarem caronas de forma prática. O objetivo do aplicativo é facilitar o compartilhamento de caronas, proporcionando uma solução conveniente para otimizar o transporte, fornecendo mais opções de veículos aos usuários. Os usuários podem armazenar informações sobre trajetos, horários e preferências de carona no aplicativo. Ele permite criar ofertas de carona e explorar as opções disponíveis, fornecendo um leque de alternativas diferentes de veículos como moto, ônibus, van e etc. promovendo a economia de recursos e a socialização entre os usuários. O "Pathfinder" oferece uma interface intuitiva e recursos de segurança, contribuindo para a redução do tráfego e uma forma mais sustentável de transporte.


### 3.MINI-MUNDO<br>


> No sistema Pathfinder, existem diversas entidades e relacionamentos que precisam ser considerados para que o sistema funcione corretamente. A entidade Pessoa representa os usuários do sistema, sendo necessário registrar informações como nome, telefone, email e endereço de cada pessoa, assim como deverá logar nesse sistema com senha e nome de usuário.

> A entidade Carona representa as caronas disponíveis para serem oferecidas e solicitadas no sistema. Cada Carona possui informações como o local de saída, horário de saída, local de destino e horário de chegada. Além disso, é necessário registrar os dados da pessoa que cederá a carona, das pessoas que receberam a carona e também informações do veículo que será usado para a carona, como placa, tipo de veículo, marca, cor e número de assentos.

> O relacionamento entre Pessoa e Carona é 1:N, ou seja, uma pessoa pode oferecer várias caronas, mas uma carona só pode ser cedida por uma pessoa. Por outro lado, uma pessoa que procura uma carona pode selecionar uma das caronas disponíveis, criando um relacionamento N:1 entre Pessoa e Carona.

> Também é possível que uma pessoa que oferta a carona possa visualizar todas as pessoas interessadas em participar da carona e decidir se aceita ou não a carona. Nesse caso, temos um relacionamento N:1 entre Carona e Pessoa.
> 
> Por fim, uma pessoa pode avaliar a carona e o passageiro, o que cria um relacionamento N:1 entre Pessoa e Avaliação, e outro relacionamento N:1 entre Carona e Avaliação. A entidade Avaliação possui atributos como nota e comentário, representando a opinião da pessoa sobre a carona e/ou passageiro.


### 4.PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
 
![Alt text](./src/prototipo.png)
![Design no Figma](https://www.figma.com/file/hMKfHIgBpal9FpKLGiPlvf/Untitled?type=design&fuid=956652625531670595")
 
#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
   
> A Empresa PathFinder precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome de cada usuario e o número de caronas que participou/ofertou
  
* Relatório relativo às avaliações feitas pelos usuários, bem como as informações da carona referida
  
* Relatório que mostre para cada linha obtida o veículo, seu dono, número de vagas e placa
  
* Relatório que mostre as informações relacionadas a todos os usuários
  
* Relatório que obtenha a avalição média de cada usuário, e o número total de avaliações

 
 
#### 4.3 TABELA DE DADOS DO SISTEMA:
![Exemplo de Tabela de dados da Empresa Pathfinder](https://docs.google.com/spreadsheets/d/1fEzlYw6J-TvsMX7OhIYmhlUsq6KIayEMO9RtgxbyaaM/edit?usp=sharing)
    
    
### 5.MODELO CONCEITUAL<br>       
![Alt text](./src/modelo_conceitual.png)    
        
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Kailany faustino, Lucas codeco]
    • Endereço de pessoa não é descrito no mini mundo e existe no modelo conceitual
    • No veículo, falta data de fabricação e cor que não está descrito no mini mundo

    Obs: Trabalho muito bem organizado e de fácil entendimento. Os ajustes são pontuais e podem ser feitos de forma rápida
 
 
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 Descrição dos dados 
    LOGIN: campo que armazena os dados da pessoa para efetuar o login no sistema.<br>
    PESSOA: campo que armazena dados de identificação e formas de comunicação de pessoa.<br>
    CARONA: campo que armazena pessoas e veículos relacionados a carona, e se <br>
    VEICULO: campo que contém todos os veículos de uma pessoa.<br>
    AVALIACAO: campo que relaciona pessoa com carona e possibilita a avaliação entre pessoas que participaram de uma carona.<br>


### 6	MODELO LÓGICO<br>
![Alt text](./src/modelo_logico.png)   

### 7	MODELO FÍSICO<br>
```sql
CREATE TABLE login_pessoa (
    id serial PRIMARY KEY,
    nome varchar(127),
    telefone bigint,
    senha varchar(127),
    email varchar(127) UNIQUE
);

CREATE TABLE veiculo (
    id serial PRIMARY KEY,
    placa char(7) UNIQUE,
    descricao varchar(127),
    assentos smallint,
    id_dono integer REFERENCES login_pessoa(id)
);

CREATE TABLE carona (
    id serial PRIMARY KEY,
    local_saida point,
    local_chegada point,
    horario_saida timestamp,
    horario_chegada timestamp,
    id_veiculo integer REFERENCES veiculo(id)
);

CREATE TABLE participante_carona (
    id serial PRIMARY KEY,
    id_carona integer REFERENCES carona(id),
    id_avaliador integer REFERENCES login_pessoa(id),
    id_avaliado integer REFERENCES login_pessoa(id)
);

CREATE TABLE avaliacao (
    id integer PRIMARY KEY REFERENCES participante_carona(id),
    nota smallint,
    comentario text
);
```        
       
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
```sql
insert into login_pessoa (nome, telefone, senha, email)values
('Norma Fisher',27900090266,'c97997164f74d4e24b3d7a4ce0e8b25c','Norf@hotmail.com'),
('Jorge Sullivan',27900093370,'3a141651ed83375318e912e56e61f552','jjorsu@hotmail.com'),
('Elizabeth Woods',27900082926,'5f549708104b8b011a2527a1414b4986','elizwoods1@hotmail.com'),
('Susan Wagner',27900067247,'6d229d10cc8db19c74a2452775d42a63','susanmwz@hotmail.com'),
('Peter Montgomery',27900036845,'2f01779b820d01742b0835f7d7dd603b','peter3421m@hotmail.com'),
('Theodore Mcgrath',27900002919,'5a9e0eb798c7fe93a20309cb709e5dee','theomogr2@hotmail.com');

insert into veiculo (placa,descricao,assentos,id_dono)
values
('MSG6795','ford ka',2,1),
('MRH0184','motocicleta',1,5),
('MPJ8659','fiat palio preto',3,2),
('MPR4764','carro duas portas',3,6),
('MPX1937','kombi',7,5),
('MTB1418','camionete',1,3);

insert into carona (local_saida, local_chegada,horario_saida,horario_chegada,id_veiculo)
values
('(1.0, 0.0)', '(1.0, 1.0)','2022-12-31 20:00:00.00000','2022-12-31 20:58:52.23498',5),
('(-1.0, -1.0)','(0.0, 0.0)','2022-12-31 13:30:00.00000','2022-12-31 14:48:02.03921',4),
('(-3.0, -2.0)','(-1.0, 2.0)','2023-01-23 03:22:24.00212','2023-01-23 04:00:46.39412',2),
('(-2.0, 0.0)','(2.0, 5.0)','2023-02-02 13:00:00.00000','2023-02-02 13:56:01.93281',6),
('(1.0, 1.0)','(1.2, 8.0)','2023-02-03 09:30:00.00000','2023-02-03 10:10:32.02930',1),
('(2.0, -5.0)','(2.0, 3.0)','2023-02-03 15:00:00.00000','2023-02-03 16:00:01.92835',3);

insert into participante_carona (id_carona, id_avaliador, id_avaliado)
values
(6,6,4),
(6,4,6),
(4,3,2),
(3,2,3),
(1,1,5),
(2,5,1);

insert into avaliacao (id, comentario, nota)
values
(1,'paia',2),
(2,'maneirin',5),
(3,'não respeita as leis de trânsito',4),
(4,'bem rapidinho ele',5),
(5,'passageiro tava com cachorro',1),
(6,'passageiro falou muito',3)
```


### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	![Link para o Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM?usp=sharing)

># Marco de Entrega 01: Do item 1 até o item 9.1<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>

[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=IrxOTfsQMbDI)

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)<br>

[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=I3Aifx050oU_)

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>

[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=f-UWo_1VqaKr)
    
#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>

[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=a0EBYQaQTq1o)

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>

[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=AmVqkgWOdnAP)

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    
[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=Zu0igliyZKSh)

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>

[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=DtSVzMxYHh3s)

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
     
[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=Nj_QSxE88nt7)

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     
[Colab](https://colab.research.google.com/drive/1nPcN75w-1UrjmIBCwKdrHAuiW5bAQhCM#scrollTo=wmFCOQsaaxA-)

># Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 03: Itens 10 e 11<br>
<br>
<br>




### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")
