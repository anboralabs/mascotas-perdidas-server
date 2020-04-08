CREATE TABLE users (
    user_id uuid DEFAULT uuid_generate_v4 (),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR,
    PRIMARY KEY (user_id)
);

CREATE TABLE type_pets (
    type_pet_id BIGSERIAL PRIMARY KEY,
    type VARCHAR NOT NULL,
    description VARCHAR
);

CREATE TABLE lost_pets (
    lost_pet_id uuid DEFAULT uuid_generate_v4 (),
    pet_name VARCHAR NOT NULL,
    type_pet BIGINT NOT NULL,
    event_detail VARCHAR NOT NULL,
    reported_date TIMESTAMP NOT NULL DEFAULT now(),
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    lost_state BOOLEAN NOT NULL DEFAULT true,
    user_id VARCHAR NOT NULL,
    PRIMARY KEY (lost_pet_id),
    CONSTRAINT lost_pets_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT lost_pets_type_pet_fkey FOREIGN KEY (type_pet)
        REFERENCES type_pets (type_pet_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE found_pets (
    found_pet_id uuid DEFAULT uuid_generate_v4 (),
    type_pet BIGINT NOT NULL,
    event_detail VARCHAR NOT NULL,
    reported_date TIMESTAMP NOT NULL DEFAULT now(),
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    user_id VARCHAR NOT NULL,
    PRIMARY KEY (found_pet_id),
    CONSTRAINT found_pets_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT found_pets_type_pet_fkey FOREIGN KEY (type_pet)
        REFERENCES type_pets (type_pet_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE match_reported_pets (
    lost_pet_id VARCHAR NOT NULL,
    found_pet_id VARCHAR NOT NULL,
    PRIMARY KEY (lost_pet_id, found_pet_id),
    CONSTRAINT match_reported_pets_lost_pet_id_fkey FOREIGN KEY (lost_pet_id)
        REFERENCES lost_pets (lost_pet_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT match_reported_pets_found_pet_id_fkey FOREIGN KEY (found_pet_id)
        REFERENCES found_pets (found_pet_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE flyers (
    flyer_id uuid DEFAULT uuid_generate_v4 (),
    lost_pet_id VARCHAR NOT NULL,
    flyer_url VARCHAR NOT NULL,
    PRIMARY KEY (flyer_id),
    CONSTRAINT flyers_lost_pet_id_fkey FOREIGN KEY (lost_pet_id)
        REFERENCES lost_pets (lost_pet_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);