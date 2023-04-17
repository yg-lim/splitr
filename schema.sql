CREATE TABLE users (
  id serial PRIMARY KEY,
  username text NOT NULL UNIQUE,
  password text NOT NULL
);

-- CREATE TABLE friends (
--   user_id integer NOT NULL
--     REFERENCES users (id)
--     ON DELETE CASCADE,
--   friend_user_id integer NOT NULL
--     REFERENCES users (id)
--     ON DELETE CASCADE
-- );

CREATE TABLE split_lists (
  id serial PRIMARY KEY
);

CREATE TABLE split_lists_users (
  split_list_id integer NOT NULL
    REFERENCES split_lists (id)
    ON DELETE CASCADE,
  user_id integer NOT NULL
    REFERENCES users (id)
    ON DELETE CASCADE
);

ALTER TABLE split_lists_users
  ADD CONSTRAINT unique_users_in_split_lists
  UNIQUE (user_id, split_list_id);

CREATE TABLE expenses (
  id serial PRIMARY KEY,
  description text NOT NULL,
  amount numeric(6,2) NOT NULL,
  date date NOT NULL
    DEFAULT CURRENT_DATE,
  is_payment boolean NOT NULL
    DEFAULT false,
  split_list_id integer NOT NULL
    REFERENCES split_lists (id)
    ON DELETE CASCADE,
  borrowed_from_user_id integer NOT NULL
    REFERENCES users (id)
    ON DELETE CASCADE,
  owed_to_user_id integer NOT NULL
    REFERENCES users (id)
    ON DELETE CASCADE
);