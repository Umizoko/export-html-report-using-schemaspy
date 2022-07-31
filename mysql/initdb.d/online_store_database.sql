CREATE TABLE customers (
    customer_id VARCHAR(36),
    first_name VARCHAR(18) NOT NULL,
    last_name VARCHAR(18) NOT NULL,
    PRIMARY KEY (customer_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT='会員';

CREATE TABLE products (
    product_id VARCHAR(36),
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT='商品';

CREATE TABLE sales_orders (
    sales_order_id INT AUTO_INCREMENT,
    customer_id VARCHAR(36),
    PRIMARY KEY (sales_order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT='注文';

CREATE TABLE sales_order_items (
    sales_order_item_id INT AUTO_INCREMENT,
    parent_id INT,
    product_id VARCHAR(36),
    PRIMARY KEY (sales_order_item_id),
    FOREIGN KEY (parent_id) REFERENCES sales_orders(sales_order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT='注文商品';
