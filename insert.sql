
-- administrator 
INSERT INTO administrator (id, name, firstname, email, password, telephone, creation_date) VALUES (	1,	'Durang', 'Jean', 'jean@gmail.com', 'jeanjean', 0903932837, '2018.12.31');
INSERT INTO administrator (id, name, firstname, email, password, telephone, creation_date) VALUES (	2,	'Duval', 'Astrid', 'astrid@gmail.com', 'astridastrid', 0298765432, '2018.12.31');

-- customer
INSERT INTO customer (id, name, firstname, email, password, telephone, creation_date) VALUES (	1,	'Ein', 'Dieter', 'dieter@gmail.com', 'didi', 0100000000, '2019.01.01');
INSERT INTO customer (id, name, firstname, email, password, telephone, creation_date) VALUES (	2,	'Zwei', 'Alice', 'alice@gmail.com', 'alicezwei', 0200000000, '2019.01.02');
INSERT INTO customer (id, name, firstname, email, password, telephone, creation_date) VALUES  (	3,	'Drei', 'Antoine', 'antoine@gmail.com', 'dreidrei', 0300000000, '2019.01.03');

-- address
INSERT INTO address (id, street, building, zip_code, city, instructions, customer_id) VALUES ( 1, '18 rue de lion', 'bâtiment A', 33000, 'Bordeaux', 'Entrer par la porte de derrière', 1);
INSERT INTO address (id, street, building, zip_code, city, instructions, customer_id) VALUES ( 2, '20 rue du chat', '', 33000, 'Bordeaux','', 2);
INSERT INTO address (id, street, building, zip_code, city, instructions, customer_id) VALUES ( 3, '6 rue des oiseaux', '', 33000, 'Bordeaux','', 3);

-- order_state
INSERT INTO order_state (id, name) VALUES (1, 'On hold');
INSERT INTO order_state (id, name) VALUES (2, 'In progress');
INSERT INTO order_state (id, name) VALUES (3, 'Delivered');
INSERT INTO order_state (id, name) VALUES (4, 'Canceled');

-- deliverer_state
INSERT INTO deliverer_state (id, name) VALUES (1, 'free');
INSERT INTO deliverer_state (id, name) VALUES (2, 'busy');

-- product_type
INSERT INTO product_type (id, name) VALUES (1, 'meal');
INSERT INTO product_type (id, name) VALUES (2, 'dessert');

-- deliverer
INSERT INTO deliverer (id, name, firstname, email, password, telephone, creation_date, latitude, longitude, deliverer_state_id) VALUES (1,	'Dubois', 'Ryan', 'dubois@gmail.com', 'dudubois', 0600000001, '2018.12.31', 44.8414563, -0.570378, 1);
INSERT INTO deliverer (id, name, firstname, email, password, telephone, creation_date, latitude, longitude, deliverer_state_id) VALUES (2,	'Renee', 'Elodie', 'elodie@gmail.com', 'renelodi', 0600000002, '2018.12.31', 44.84981451680592, -0.5444240570068359, 1);
INSERT INTO deliverer (id, name, firstname, email, password, telephone, creation_date, latitude, longitude, deliverer_state_id) VALUES (3,	'Legrand', 'Thibault', 'tibo@gmail.com', 'tibobo', 0600000003, '2018.12.31', 44.84584389529796, -0.5508613586425781, 2);

-- product
INSERT INTO product (id, name, description, cost, creation_date, product_type_id) VALUES (1, 'Magret de canard', 'Magret de canard accompagné de pommes sautées', 35, '2018.12.31', 1);
INSERT INTO product (id, name, description, cost, creation_date, product_type_id) VALUES (2, 'Paupiettes de veau', 'Paupiettes de veau avec plusieurs légumes', 30, '2018.12.31', 1);
INSERT INTO product (id, name, description, cost, creation_date, product_type_id) VALUES (3, 'Tarte tatin', 'Tarte aux pommes avec de la cannelle et du sucre vanillé', 20, '2018.12.31', 2);
INSERT INTO product (id, name, description, cost, creation_date, product_type_id) VALUES (4, 'Gâteau Opéra', 'Pâtisserie constituée de biscuits et de ganache au chocolat', 23, '2018.12.31', 2);

-- an_order
INSERT INTO an_order (id, payment_date, start_date, end_date, total_amount, instructions, order_state_id, customer_id, deliverer_id, deliverer_state_id) VALUES (1, '2019-01-01 13:29:00', '2019-01-01 13:30:00', '2019-01-01 01:40:18', 55, '', 3, 1, 1, 1);
INSERT INTO an_order (id, payment_date, start_date, end_date, total_amount, instructions, order_state_id, customer_id, deliverer_id, deliverer_state_id) VALUES (2, '2019-01-02 20:24:00', '2019-01-02 20:25:00', '2019-01-02 08:33:40', 53, '', 3, 2, 2, 1);
INSERT INTO an_order (id, payment_date, start_date, end_date, total_amount, instructions, order_state_id, customer_id, deliverer_id, deliverer_state_id) VALUES (3, '2019-01-03 19:18:00', '2019-01-03 19:19:00', '2019-01-03 07:27:18', 81, '', 3, 3, 3, 2);

-- order_items
INSERT INTO order_items (id, quantity, an_order_id, order_state_id, customer_id, product_id, product_type_id) VALUES (1, 1, 1, 3, 1, 1, 1);
INSERT INTO order_items (id, quantity, an_order_id, order_state_id, customer_id, product_id, product_type_id) VALUES (1, 2, 1, 3, 1, 3, 2); 
INSERT INTO order_items (id, quantity, an_order_id, order_state_id, customer_id, product_id, product_type_id) VALUES (1, 3, 2, 3, 2, 2, 1);
INSERT INTO order_items (id, quantity, an_order_id, order_state_id, customer_id, product_id, product_type_id) VALUES (1, 4, 2, 3, 2, 4, 2);
INSERT INTO order_items (id, quantity, an_order_id, order_state_id, customer_id, product_id, product_type_id) VALUES (1, 5, 3, 3, 3, 1, 1);
INSERT INTO order_items (id, quantity, an_order_id, order_state_id, customer_id, product_id, product_type_id) VALUES (2, 6, 3, 3, 3, 4, 2);