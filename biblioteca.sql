
CREATE DATABASE biblioteca;

CREATE TABLE biblioteca(
id_biblioteca int auto_increment primary key,
nome varchar(255) not null,
endereco varchar (255) not null,
cnpj bigint unsigned,
proprietario varchar(255) not null

);

CREATE TABLE usuario(
id_usuario int auto_increment primary key,
nome varchar(255),
email varchar(100) unique,
num_identificacao int unique,
associacao enum('Regular', 'Premium'),
data_registro date,
cpf bigint unsigned
);

CREATE TABLE categoria(
id_categoria int auto_increment primary key,
nome varchar(100) not null
);

CREATE TABLE livro(
id_livro int auto_increment primary key,
isbn int unique,
titulo varchar(255),
descricao text
);

CREATE TABLE categoria_livro(
 id_livro int,
 id_categoria int,
 primary key(id_livro, id_categoria),
 foreign key (id_livro) references livro(id_livro),
 foreign key (id_categoria) references categoria(id_categoria)
);

CREATE TABLE autor(
id_autor int auto_increment primary key,
nome varchar(255),
data_nascimento date,
biografia text
);

CREATE TABLE livro_autor (
 id_livro_autor int auto_increment primary key,
 id_livro int,
 id_autor int,
 foreign key (id_livro) references livro(id_livro),
 foreign key (id_autor) references autor(id_autor)
);

CREATE TABLE emprestimo (
id_emprestimo int auto_increment primary key,
data_retirada date,
data_devolucao date,
id_livro int,
id_usuario int,
foreign key (id_livro) references livro(id_livro),
foreign key (id_usuario) references usuario(id_usuario)
);

INSERT INTO biblioteca(nome, endereco, cnpj, proprietario)
VALUES
('Livraria A', 'Rua A', 123456, 'Ana'),
('Livraria B', 'Rua B', 123457, 'Bia'),
('Livraria C', 'Rua C', 123458, 'Carol'),
('Livraria D', 'Rua D', 123459, 'Dani'),
('Livraria E', 'Rua E', 123451, 'Elle'),
('Livraria F', 'Rua F', 123452, 'Fabi'),
('Livraria G', 'Rua G', 123453, 'Gi'),
('Livraria H', 'Rua H', 123454, 'Heitor'),
('Livraria I', 'Rua I', 123455, 'Isa'),
('Livraria J', 'Rua J', 123411, 'Ju');


INSERT INTO usuario(nome, email, num_identificacao, associacao, data_registro, cpf)
VALUES
('João', 'joao@mail.com', 1, 'Premium', '2022-01-01', 8888),
('Pedro', 'pedro@mail.com', 2, 'Premium', '2022-02-01', 8889),
('Maria', 'maria@mail.com', 3, 'Regular', '2022-03-01', 8890),
('Lucas', 'lucas@mail.com', 4, 'Premium', '2022-04-01', 8891),
('Julia', 'julia@mail.com', 5, 'Regular', '2022-05-01', 8892),
('Roberto', 'roberto@mail.com', 6, 'Premium', '2022-06-01', 8893),
('Carla', 'carla@mail.com', 7, 'Regular', '2022-07-01', 8894),
('Rafael', 'rafael@mail.com', 8, 'Premium', '2022-08-01', 8895),
('Sofia', 'sofia@mail.com', 9, 'Regular', '2022-09-01', 8896),
('Ana', 'ana@mail.com', 10, 'Premium', '2022-01-01', 7777);

INSERT INTO categoria(nome)
VALUES
('Terror'),
('Comédia'),
('Romance'),
('Distopia'),
('Infantil'),
('Utopia'),
('Fantasia'),
('Suspense'),
('Mistério'),
('Horror');

INSERT INTO livro(isbn, titulo, descricao)
VALUES
(1, 'Ventos da Mudança', 'Numa terra onde o vento pode alterar o destino, uma jovem enfrenta adversidades para descobrir sua verdadeira identidade.'),
(2, 'Sombras na Água', 'Uma trama de suspense e mistério que se desenrola em uma pequena cidade litorânea, onde segredos submersos vêm à tona.'),
(3, 'Luz Entre Ruínas', 'Num mundo pós-apocalíptico, a história de um grupo de sobreviventes que busca esperança e renascimento entre as ruínas do antigo mundo.'),
(4, 'Caminhos de Vidro', 'Uma jornada emocional de autodescoberta, onde personagens enfrentam escolhas difíceis e seguem caminhos inesperados, como se fossem feitos de vidro.'),
(5, 'O Jardim das Esferas', 'Um conto de fantasia que se desenrola num jardim mágico, onde esferas místicas guardam segredos antigos e inexplorados.'),
(6, 'Sussurros do Passado', 'Um romance histórico que mergulha nas vidas entrelaçadas de personagens em diferentes épocas, revelando segredos guardados pelo tempo.'),
(7, 'Além do Horizonte', 'Uma odisséia intergaláctica que leva os protagonistas além dos limites conhecidos do universo, desafiando suas percepções sobre a existência.'),
(8, 'Círculos de Destino', 'Um intrincado drama familiar que se desenrola em torno de segredos guardados por gerações, explorando o impacto do passado no presente.'),
(9, 'Silhuetas na Neblina', 'Um thriller psicológico que mergulha nas mentes de personagens enigmáticos, enquanto mistérios se desdobram em um ambiente nebuloso.'),
(10, 'O Pássaro de Fogo', ' Um conto de fantasia épica que segue a jornada de um herói destinado a encontrar o lendário Pássaro de Fogo, enfrentando desafios sobrenaturais.');

INSERT INTO autor(nome, data_nascimento, biografia)
VALUES
('Lucas Martins', '1978-05-14', 'Lucas Martins, autor brasileiro, é apaixonado por contar histórias desde a infância. Sua jornada literária começou com contos e poesias, evoluindo para romances que exploram a condição humana.'),
('Sofia Carvalho', '1984-08-01', 'Sofia Carvalho, autora e contista, traz em suas obras uma mistura de suspense e emoção. Sua escrita envolvente conquistou leitores ao explorar os aspectos misteriosos da vida cotidiana.'),
('Beatriz Oliveira', '1988-01-01', 'Beatriz Oliveira, autora brasileira, é conhecida por suas narrativas cativantes que exploram a resiliência humana em cenários desafiadores. Sua escrita única combina elementos de ficção científica e drama para criar mundos envolventes.'),
('Rafael Silva', '1990-12-21', 'Rafael Silva, jovem autor contemporâneo, tem uma paixão por explorar os aspectos complexos da condição humana. Suas histórias são reflexões profundas sobre as escolhas que moldam nossas vidas.'),
('Mariana Santos', '1999-01-15','Mariana Santos, autora de fantasia, transporta seus leitores para mundos imaginários. Sua paixão por mitologia e magia cria narrativas encantadoras que capturam a imaginação.'),
('Gabriel Lima', '1973-02-02', 'Gabriel Lima, autor prolífico, tem um talento especial para conectar o passado e o presente em suas narrativas. Sua escrita detalhada transporta os leitores através das eras, explorando as complexidades das relações humanas.'),
('Isabella Ferreira', '1988-05-05', ' Isabella Ferreira, autora de ficção científica, combina imaginação vívida e reflexões filosóficas em suas obras. Sua escrita transporta os leitores para mundos desconhecidos.'),
('Eduardo Santos','1970-06-06', 'Eduardo Santos, escritor renomado, é conhecido por suas narrativas familiares profundas e emocionais. Sua abordagem sutil revela verdades universais sobre conexões humanas.'),
('Amanda Costa', '1945-04-04', 'Amanda Costa, autora de suspense, tece histórias intrigantes que desafiam as expectativas. Sua escrita hábil cria um ambiente tenso e imprevisível.'),
('Gustavo Oliveira', '1983-09-09', 'Gustavo Oliveira, autor de fantasia, é um contador de histórias apaixonado por mundos mágicos. Seu estilo narrativo único transporta os leitores para aventuras extraordinárias.');

INSERT INTO emprestimo(data_retirada, data_devolucao, id_livro, id_usuario)
VALUES
('2024-01-01', '2024-01-05', 1, 1),
('2024-01-01', '2024-01-06', 2, 2),
('2024-01-01', '2024-01-07', 3, 3),
('2024-01-01', '2024-01-08', 4, 4),
('2024-01-01', '2024-01-09', 5, 5),
('2024-01-01', '2024-01-10', 6, 6),
('2024-01-01', '2024-01-11', 7, 7),
('2024-01-01', '2024-01-12', 8, 8),
('2024-01-01', '2024-01-13', 9, 9),
('2024-01-01', '2024-01-14', 10, 10);

INSERT INTO livro_autor(id_livro, id_autor)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


/*
SELECT livro.titulo, autor.nome
FROM livro
INNER JOIN livro_autor ON livro.id_livro = livro_autor.id_livro
INNER JOIN autor ON livro_autor.id_autor = autor.id_autor
*/

SELECT livro.titulo, usuario.nome, emprestimo.data_retirada, emprestimo.data_devolucao
FROM livro
INNER JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
INNER JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario;