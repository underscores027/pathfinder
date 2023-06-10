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