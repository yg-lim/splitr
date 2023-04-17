INSERT INTO split_lists (id)
  VALUES (DEFAULT), (DEFAULT);

INSERT INTO split_lists_users (split_list_id, user_id)
  VALUES (1, 1),
         (1, 2),
         (2, 1),
         (2, 3);

INSERT INTO expenses (description, amount, date, is_payment, split_list_id, borrowed_from_user_id, owed_to_user_id)
              VALUES ('coffee', 5.50, '2023-04-17', false, 1, 1, 2),
                     ('lunch', 9.50, '2023-04-16', false, 1, 1, 2),
                     ('concert tickets', 50.00, '2023-04-10', false, 1, 2, 1),
                     ('Payment', 25.00, '2023-04-09', true, 1, 1, 2),
                     ('gas money', 25.80, DEFAULT, false, 2, 1, 3),
                     ('snacks', 12.70, '2023-04-10', false, 2, 1, 3),
                     ('masks', 2.50, '2023-04-10', false, 2, 3, 1),
                     ('Payment', 15.00, '2023-04-10', true, 2, 3, 1);