create table dim_product(
    product_id int primary key,
    product_name nvarchar(100),
    category nvarchar(50),
    price decimal(10,2)
);

create table dim_customer(
    customer_id int primary key,
    customer_name nvarchar(100),
    city nvarchar(50),
    segment nvarchar(50)
);

create table dim_time(
    time_id int primary key, 
    date DATE, 
    month INT, 
    quarter INT,
    year INT
);

create table fact_sales(
    sale_id int primary key, 
    product_id int,
    customer_id int,
    time_id int, 
    quantity int,
    total_amount decimal(10, 2),
    foreign key (product_id) references dim_product(product_id),
    foreign key (customer_id) references dim_customer(customer_id),
    foreign key (time_id) references dim_time(time_id)
);

