--
--Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. 
--Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos 
--comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo.
--

CREATE DATABASE empresadevendas;

CREATE TABLE vendas (
  id SERIAL PRIMARY KEY,
  data_compra DATE NOT NULL,
  produto VARCHAR(100) NOT NULL,
  quantidade INTEGER NOT NULL
);

INSERT INTO vendas (data_compra, produto, quantidade) VALUES
  ('2023-06-12', 'Produto A', 5),
  ('2023-06-12', 'Produto B', 10),
  ('2023-06-12', 'Produto C', 3),
  ('2023-06-11', 'Produto A', 2),
  ('2023-06-11', 'Produto B', 8),
  ('2023-06-11', 'Produto C', 6);

CREATE OR REPLACE PROCEDURE obter_quantidade_vendas()
AS $$
DECLARE
   registro_vendas RECORD; --RECORD é um tipo de dado genérico
BEGIN
   FOR registro_vendas IN SELECT * FROM vendas LOOP
      -- Faça algo com cada registro de vendas, como exibir na tela ou processar os dados.
      RAISE NOTICE 'Produto: % - Quantidade: %', registro_vendas.produto, registro_vendas.quantidade;
   END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL obter_quantidade_vendas();
