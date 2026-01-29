CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    day_of_week VARCHAR(20)
);

CREATE TABLE dim_time (
    time_id TIME PRIMARY KEY,
    hour INT,
    minute INT,
    period VARCHAR(10)
);

CREATE TABLE dim_payment_method (
    payment_method_id SERIAL PRIMARY KEY,
    payment_method_name VARCHAR(50)
);

CREATE TABLE dim_coffee (
    coffee_id SERIAL PRIMARY KEY,
    coffee_name VARCHAR(100)
);

CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE fact_orders (
    order_id SERIAL PRIMARY KEY,
    date_id DATE REFERENCES dim_date(date_id),
    time_id TIME REFERENCES dim_time(time_id),
    payment_method_id INT REFERENCES dim_payment_method(payment_method_id),
    coffee_id INT REFERENCES dim_coffee(coffee_id),
    customer_id INT REFERENCES dim_customer(customer_id),
    amount DECIMAL(10,2)
);
