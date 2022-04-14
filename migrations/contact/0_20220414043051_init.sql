-- upgrade --
CREATE TABLE IF NOT EXISTS `aerich` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `version` VARCHAR(255) NOT NULL,
    `app` VARCHAR(100) NOT NULL,
    `content` JSON NOT NULL
) CHARACTER SET utf8mb4;
CREATE TABLE IF NOT EXISTS `order` (
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `user_email` VARCHAR(30) NOT NULL,
    `receiver_name` VARCHAR(20) NOT NULL,
    `receiver_address` VARCHAR(100) NOT NULL,
    `receiver_phone` VARCHAR(15) NOT NULL,
    `delivery_memo` LONGTEXT NOT NULL,
    `total_price` DECIMAL(7,2) NOT NULL,
    `discount_price` DECIMAL(7,2) NOT NULL,
    `deal_order_status` VARCHAR(17) NOT NULL  COMMENT 'COMPLETED: COMPLETED\nCANCELLED: CANCELLED\nPARTIAL_CANCELLED: PARTIAL_CANCELLED',
    KEY `idx_order_user_id_ce7302` (`user_id`)
) CHARACTER SET utf8mb4;
CREATE TABLE IF NOT EXISTS `orderdealdetail` (
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `deal_id` BIGINT NOT NULL,
    `deal_name` VARCHAR(100) NOT NULL,
    `total_price` DECIMAL(7,2) NOT NULL,
    `discount_price` DECIMAL(6,2) NOT NULL,
    `deal_order_status` VARCHAR(17) NOT NULL  COMMENT 'COMPLETED: COMPLETED\nCANCELLED: CANCELLED\nPARTIAL_CANCELLED: PARTIAL_CANCELLED',
    KEY `idx_orderdealde_order_i_e4d498` (`order_id`),
    KEY `idx_orderdealde_user_id_0f4f13` (`user_id`)
) CHARACTER SET utf8mb4;
