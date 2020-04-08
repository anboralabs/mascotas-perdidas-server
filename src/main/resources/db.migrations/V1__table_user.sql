CREATE TABLE users (
    user_id uuid DEFAULT uuid_generate_v4 (),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR,
    PRIMARY KEY (user_id)
);