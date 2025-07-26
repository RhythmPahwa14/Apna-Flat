create database ECommerce;
use ECommerce;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2),
    order_date DATETIME
);

INSERT INTO products (product_id, name, price, stock) VALUES
(1, 'Laptop', 75000.00, 10),
(2, 'Smartphone', 30000.00, 15),
(3, 'Headphones', 2000.00, 50);


-- Here we are using single Sql Query to perform this Task
-- Get product price and stock
SELECT name, price, stock FROM products WHERE product_id = 1;

-- Check if stock is available (manually verify before running next steps)

-- Insert into orders
INSERT INTO orders (customer_id, product_id, quantity, total_price, order_date)
VALUES (101, 1, 2, 2 * 75000.00, NOW());

-- Update product stock
UPDATE products
SET stock = stock - 2
WHERE product_id = 1;

SELECT * FROM orders;
SELECT * FROM products;

DELIMITER //
CREATE PROCEDURE PlaceOrder (
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_quantity INT,
    OUT result VARCHAR(100)
)
BEGIN
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_stock INT;

    -- Get price and stock
    SELECT price, stock INTO v_price, v_stock
    FROM products
    WHERE product_id = p_product_id;

    -- Check stock
    IF v_stock < p_quantity THEN
        SET result = 'Not enough stock';
    ELSE
        -- Insert order
        INSERT INTO orders (customer_id, product_id, quantity, total_price, order_date)
        VALUES (p_customer_id, p_product_id, p_quantity, v_price * p_quantity, NOW());

        -- Update stock
        UPDATE products
        SET stock = stock - p_quantity
        WHERE product_id = p_product_id;

        SET result = 'Order placed successfully';
    END IF;
END //

DELIMITER ;

-- Call PlaceOrder Procedure
CALL PlaceOrder(101, 1, 2, @status);
SELECT @status;

Select * from orders;
Select * from products;


