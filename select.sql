use ef_database;
 SELECT d.id, d.name, d.firstname, s.name state FROM deliverer d JOIN deliverer_state s ON s.id = deliverer_state_id WHERE s.name = "free";
 SELECT c.name customer_name, p.name product_name, p.cost FROM order_items i JOIN customer c ON c.id = i.customer_id JOIN product p ON p.id = i.product_id where i.an_order_id = 3;
 
 