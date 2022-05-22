-- upgrade --
CREATE TABLE IF NOT EXISTS `aerich` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `version` VARCHAR(255) NOT NULL,
    `app` VARCHAR(100) NOT NULL,
    `content` JSON NOT NULL
) CHARACTER SET utf8mb4;
CREATE TABLE IF NOT EXISTS `order` (
    `order_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `user_email` VARCHAR(30) NOT NULL,
    `user_name` VARCHAR(20) NOT NULL,
    `user_phone` VARCHAR(15) NOT NULL,
    `receiver_name` VARCHAR(20) NOT NULL,
    `receiver_address` VARCHAR(100) NOT NULL,
    `receiver_phone` VARCHAR(15) NOT NULL,
    `delivery_memo` LONGTEXT NOT NULL,
    `total_price` DECIMAL(7,2) NOT NULL,
    `discount_price` DECIMAL(7,2) NOT NULL,
    `deal_order_status` VARCHAR(17) NOT NULL  COMMENT 'COMPLETED: COMPLETED\nCANCELLED: CANCELLED\nPARTIAL_CANCELLED: PARTIAL_CANCELLED',
    `created_at` DATETIME(6) NOT NULL  DEFAULT CURRENT_TIMESTAMP(6),
    `modified_at` DATETIME(6) NOT NULL  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    KEY `idx_order_user_id_ce7302` (`user_id`),
    KEY `idx_order_created_a653c8` (`created_at`),
    KEY `idx_order_user_id_0774cb` (`user_id`, `created_at`)
) CHARACTER SET utf8mb4;
CREATE TABLE IF NOT EXISTS `order_deal_detail` (
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL,
    `deal_id` BIGINT NOT NULL,
    `deal_name` VARCHAR(100) NOT NULL,
    `total_price` DECIMAL(7,2) NOT NULL,
    `discount_price` DECIMAL(6,2) NOT NULL,
    `deal_order_status` VARCHAR(17) NOT NULL  COMMENT 'COMPLETED: COMPLETED\nCANCELLED: CANCELLED\nPARTIAL_CANCELLED: PARTIAL_CANCELLED',
    `created_at` DATETIME(6) NOT NULL  DEFAULT CURRENT_TIMESTAMP(6),
    `modified_at` DATETIME(6) NOT NULL  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    KEY `idx_order_deal__order_i_cfa388` (`order_id`)
) CHARACTER SET utf8mb4;
CREATE TABLE IF NOT EXISTS `order_deal_option_detail` (
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL,
    `deal_id` BIGINT NOT NULL,
    `option_id` BIGINT NOT NULL,
    `option_name` VARCHAR(100) NOT NULL,
    `option_quantity` INT NOT NULL,
    `option_unit_price` DECIMAL(7,2) NOT NULL,
    `total_price` DECIMAL(7,2) NOT NULL,
    `option_order_status` VARCHAR(17) NOT NULL  COMMENT 'COMPLETED: COMPLETED\nCANCELLED: CANCELLED\nPARTIAL_CANCELLED: PARTIAL_CANCELLED',
    `created_at` DATETIME(6) NOT NULL  DEFAULT CURRENT_TIMESTAMP(6),
    `modified_at` DATETIME(6) NOT NULL  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    KEY `idx_order_deal__order_i_619300` (`order_id`)
) CHARACTER SET utf8mb4;
