CREATE TABLE `product_category` (
  `id` int,
  `name` varchar(255),
  `desc` text,
  `created_at` timestamp,
  `modified_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `product_inventory` (
  `id` int,
  `quantity` int,
  `created_at` timestamp,
  `modified_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `discount` (
  `id` int,
  `name` varchar(255),
  `desc` text,
  `discount_percent` decimal,
  `active` boolean,
  `created_at` timestamp,
  `modified_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `product` (
  `id` int,
  `name` varchar(255),
  `desc` text,
  `SKU` varchar(255),
  `category_id` int,
  `inventory_id` int,
  `price` decimal,
  `discount_id` int,
  `created_at` timestamp,
  `modified_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `order_details` (
  `id` int,
  `user_id` varchar(255),
  `total` decimal,
  `payment_id` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `order_items` (
  `id` int,
  `order_id` int,
  `product_id` int,
  `quantity` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `payment_details` (
  `id` int,
  `order_id` int,
  `amount` int,
  `provider` varchar(255),
  `status` varchar(255),
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `user` (
  `id` int,
  `username` varchar(255),
  `password` text,
  `first_name` decimal,
  `last_name` varchar(255),
  `telephone` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `shopping_session` (
  `id` int,
  `user_id` varchar(255),
  `total` decimal,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `cart_item` (
  `id` int,
  `session_id` int,
  `product_id` int,
  `quantity` int,
  `created_at` timestamp,
  `modified_at` timestamp
);

CREATE TABLE `user_address` (
  `id` int,
  `user_id` int,
  `address_line1` varchar(255),
  `address_line2` varchar(255),
  `city` varchar(255),
  `postal_code` varchar(255),
  `country` varchar(255),
  `telephone` varchar(255),
  `mobile` varchar(255)
);

CREATE TABLE `user_payment` (
  `id` int,
  `user_id` int,
  `payment_type` varchar(255),
  `provider` varchar(255),
  `account_no` int,
  `expiry` date
);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`inventory_id`) REFERENCES `product_inventory` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`id`) REFERENCES `order_details` (`user_id`);

ALTER TABLE `payment_details` ADD FOREIGN KEY (`id`) REFERENCES `order_details` (`payment_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`id`) REFERENCES `order_items` (`product_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`id`) REFERENCES `cart_item` (`product_id`);

ALTER TABLE `cart_item` ADD FOREIGN KEY (`session_id`) REFERENCES `shopping_session` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`id`) REFERENCES `shopping_session` (`user_id`);

ALTER TABLE `user_address` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_payment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
