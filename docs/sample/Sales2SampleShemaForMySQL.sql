CREATE TABLE application_variables
(
    idvariant                       CHAR(20) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_variables
    ADD CONSTRAINT  PRIMARY KEY  (idvariant)
;
ALTER TABLE application_variables COMMENT = 'システム変数'
;
ALTER TABLE application_variables MODIFY idvariant CHAR(20) NOT NULL  COMMENT 'idvariant'
;
CREATE TABLE application_sessions
(
    session                         CHAR(7) NOT NULL,
    application_users_id            CHAR(5) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexzt050withiduser
    ON application_sessions (application_users_id)
;
ALTER TABLE application_sessions
    ADD CONSTRAINT  PRIMARY KEY  (session)
;
ALTER TABLE application_sessions COMMENT = 'セッション'
;
ALTER TABLE application_sessions MODIFY session CHAR(7) NOT NULL  COMMENT 'session'
;
ALTER TABLE application_sessions MODIFY application_users_id CHAR(5) NOT NULL  COMMENT 'application_users_id'
;
CREATE TABLE application_session_details
(
    session                         CHAR(7) NOT NULL,
    sqprogram                       SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_session_details
    ADD CONSTRAINT  PRIMARY KEY  (session, sqprogram)
;
ALTER TABLE application_session_details COMMENT = 'セッション明細'
;
ALTER TABLE application_session_details MODIFY session CHAR(7) NOT NULL  COMMENT 'session'
;
ALTER TABLE application_session_details MODIFY sqprogram SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT 'sqprogram'
;
CREATE TABLE product_sets
(
    product_no                      VARCHAR(7) NOT NULL,
    no                              VARCHAR(7) NOT NULL,
    set_amount                      INT(11) DEFAULT 0 NOT NULL,
    sqlist                          SMALLINT(6) DEFAULT 0
)
ENGINE=InnoDB
;
CREATE INDEX indexbt021withnrsyohin_sqlist
    ON product_sets (product_no, sqlist)
;
ALTER TABLE product_sets
    ADD CONSTRAINT  PRIMARY KEY  (product_no, no)
;
ALTER TABLE product_sets COMMENT = 'セット構成'
;
ALTER TABLE product_sets MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE product_sets MODIFY no VARCHAR(7) NOT NULL  COMMENT '構成品内部商品№'
;
ALTER TABLE product_sets MODIFY set_amount INT(11) NOT NULL  DEFAULT 0 COMMENT '構成数'
;
ALTER TABLE product_sets MODIFY sqlist SMALLINT(6) DEFAULT 0 COMMENT '構成一覧順'
;
CREATE TABLE set_instructions
(
    no                              VARCHAR(7) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE set_instructions
    ADD CONSTRAINT lt010_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE set_instructions
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE set_instructions COMMENT = 'セット指示'
;
ALTER TABLE set_instructions MODIFY no VARCHAR(7) NOT NULL  COMMENT 'セット指示№'
;
ALTER TABLE set_instructions MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE set_instructions MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE set_instructions MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№1'
;
CREATE TABLE set_instruction_details
(
    no                              VARCHAR(7) NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE set_instruction_details
    ADD CONSTRAINT lt011_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE set_instruction_details
    ADD CONSTRAINT  PRIMARY KEY  (no, line)
;
ALTER TABLE set_instruction_details COMMENT = 'セット指示明細'
;
ALTER TABLE set_instruction_details MODIFY no VARCHAR(7) NOT NULL  COMMENT 'セット指示№'
;
ALTER TABLE set_instruction_details MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '構成行'
;
ALTER TABLE set_instruction_details MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE makers
(
    no                              VARCHAR(5) NOT NULL,
    name                            VARCHAR(40) NOT NULL,
    name_short                      VARCHAR(10) NOT NULL,
    zip_code                        VARCHAR(8) NOT NULL,
    address                         VARCHAR(40) NOT NULL,
    tel_number                      VARCHAR(14) NOT NULL,
    fax_number                      VARCHAR(14) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE makers
    ADD CONSTRAINT  PRIMARY KEY  (no, product_no)
;
ALTER TABLE makers COMMENT = 'メーカー'
;
ALTER TABLE makers MODIFY no VARCHAR(5) NOT NULL  COMMENT 'メーカー№'
;
ALTER TABLE makers MODIFY name VARCHAR(40) NOT NULL  COMMENT 'メーカー名'
;
ALTER TABLE makers MODIFY name_short VARCHAR(10) NOT NULL  COMMENT 'メーカー略称'
;
ALTER TABLE makers MODIFY zip_code VARCHAR(8) NOT NULL  COMMENT '郵便番号'
;
ALTER TABLE makers MODIFY address VARCHAR(40) NOT NULL  COMMENT '住所'
;
ALTER TABLE makers MODIFY tel_number VARCHAR(14) NOT NULL  COMMENT '代表電話番号'
;
ALTER TABLE makers MODIFY fax_number VARCHAR(14) NOT NULL  COMMENT 'fax番号'
;
ALTER TABLE makers MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
CREATE TABLE application_users
(
    id                              CHAR(5) NOT NULL,
    name                            CHAR(30) NOT NULL,
    password                        CHAR(50) NOT NULL,
    nremployee                      CHAR(5),
    employee_no                     VARCHAR(5) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexzt020withnremployee
    ON application_users (nremployee)
;
ALTER TABLE application_users
    ADD CONSTRAINT  PRIMARY KEY  (id)
;
ALTER TABLE application_users COMMENT = 'ユーザ'
;
ALTER TABLE application_users MODIFY id CHAR(5) NOT NULL  COMMENT 'id'
;
ALTER TABLE application_users MODIFY name CHAR(30) NOT NULL  COMMENT 'name'
;
ALTER TABLE application_users MODIFY password CHAR(50) NOT NULL  COMMENT 'password'
;
ALTER TABLE application_users MODIFY nremployee CHAR(5) COMMENT 'nremployee'
;
ALTER TABLE application_users MODIFY employee_no VARCHAR(5) NOT NULL  COMMENT '従業員№'
;
CREATE TABLE application_user_filters
(
    application_users_id            CHAR(5) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_user_filters COMMENT = 'ユーザフィルター値'
;
ALTER TABLE application_user_filters MODIFY application_users_id CHAR(5) NOT NULL  COMMENT 'application_users_id'
;
CREATE TABLE application_user_types
(
    id                              CHAR(20) NOT NULL,
    type                            CHAR(5) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_user_types
    ADD CONSTRAINT  PRIMARY KEY  (id, type)
;
ALTER TABLE application_user_types COMMENT = 'ユーザ定義区分'
;
ALTER TABLE application_user_types MODIFY id CHAR(20) NOT NULL  COMMENT 'id'
;
ALTER TABLE application_user_types MODIFY type CHAR(5) NOT NULL  COMMENT 'type'
;
CREATE TABLE monthly_summary_by_sales_representatives
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    sales_representative_no         VARCHAR(5) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_summary_by_sales_representatives
    ADD CONSTRAINT  PRIMARY KEY  (year, month, sales_representative_no, fiscal_year)
;
ALTER TABLE monthly_summary_by_sales_representatives COMMENT = '営業担当別月次取引sum'
;
ALTER TABLE monthly_summary_by_sales_representatives MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_summary_by_sales_representatives MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_summary_by_sales_representatives MODIFY sales_representative_no VARCHAR(5) NOT NULL  COMMENT '仕入担当者№'
;
ALTER TABLE monthly_summary_by_sales_representatives MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE ratio_of_wholesale_price_to_retail_price_ranks
(
    code                            VARCHAR(2) NOT NULL,
    ratio                           DECIMAL(3,2) DEFAULT 0.00 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE ratio_of_wholesale_price_to_retail_price_ranks
    ADD CONSTRAINT  PRIMARY KEY  (code)
;
ALTER TABLE ratio_of_wholesale_price_to_retail_price_ranks COMMENT = '掛率ランク'
;
ALTER TABLE ratio_of_wholesale_price_to_retail_price_ranks MODIFY code VARCHAR(2) NOT NULL  COMMENT '掛率ランクコード'
;
ALTER TABLE ratio_of_wholesale_price_to_retail_price_ranks MODIFY ratio DECIMAL(3,2) NOT NULL  DEFAULT 0.00 COMMENT '掛率'
;
CREATE TABLE application_holidays
(
    calendar                        CHAR(2) NOT NULL,
    off                             DATE NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_holidays
    ADD CONSTRAINT  PRIMARY KEY  (calendar, off)
;
ALTER TABLE application_holidays COMMENT = '休日テーブル'
;
ALTER TABLE application_holidays MODIFY calendar CHAR(2) NOT NULL  COMMENT 'calendar'
;
ALTER TABLE application_holidays MODIFY off DATE NOT NULL  COMMENT 'off'
;
CREATE TABLE application_monthly_exchange_rates
(
    currency                        CHAR(3) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_monthly_exchange_rates
    ADD CONSTRAINT  PRIMARY KEY  (currency, fiscal_year, month)
;
ALTER TABLE application_monthly_exchange_rates COMMENT = '月次為替レート'
;
ALTER TABLE application_monthly_exchange_rates MODIFY currency CHAR(3) NOT NULL  COMMENT 'currency'
;
ALTER TABLE application_monthly_exchange_rates MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT 'fiscal_year'
;
ALTER TABLE application_monthly_exchange_rates MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT 'month'
;
CREATE TABLE monthly_summaries
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_summaries
    ADD CONSTRAINT  PRIMARY KEY  (year, month, fiscal_year)
;
ALTER TABLE monthly_summaries COMMENT = '月次取引sum'
;
ALTER TABLE monthly_summaries MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_summaries MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_summaries MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE estimates
(
    no                              VARCHAR(7) NOT NULL,
    version                         SMALLINT(6) DEFAULT 0 NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    shipment_line                   SMALLINT(6) DEFAULT 0 NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE estimates
    ADD CONSTRAINT  PRIMARY KEY  (no, version)
;
ALTER TABLE estimates COMMENT = '見積見出し'
;
ALTER TABLE estimates MODIFY no VARCHAR(7) NOT NULL  COMMENT '見積№'
;
ALTER TABLE estimates MODIFY version SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '見積版№'
;
ALTER TABLE estimates MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE estimates MODIFY shipment_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '出荷先行'
;
ALTER TABLE estimates MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
CREATE TABLE estimate_details
(
    no                              VARCHAR(7) NOT NULL,
    version                         SMALLINT(6) DEFAULT 0 NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    price                           INT(11) DEFAULT 0 NOT NULL,
    amount                          INT(11) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE estimate_details
    ADD CONSTRAINT  PRIMARY KEY  (no, version, line)
;
ALTER TABLE estimate_details COMMENT = '見積明細'
;
ALTER TABLE estimate_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '見積№'
;
ALTER TABLE estimate_details MODIFY version SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '見積版№'
;
ALTER TABLE estimate_details MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '見積行'
;
ALTER TABLE estimate_details MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE estimate_details MODIFY price INT(11) NOT NULL  DEFAULT 0 COMMENT '受注単価'
;
ALTER TABLE estimate_details MODIFY amount INT(11) NOT NULL  DEFAULT 0 COMMENT '受注数量'
;
CREATE TABLE customers
(
    no                              VARCHAR(8) NOT NULL,
    buyer_no                        VARCHAR(5) NOT NULL,
    employee_no                     VARCHAR(5) NOT NULL,
    ratio_of_wholesale_price_to_retail_price_ranks_code VARCHAR(2) NOT NULL,
    partner_no                      VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexdt010withnrtantoujyugyoin
    ON customers (buyer_no)
;
ALTER TABLE customers
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE customers COMMENT = '顧客'
;
ALTER TABLE customers MODIFY no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
ALTER TABLE customers MODIFY buyer_no VARCHAR(5) NOT NULL  COMMENT '仕入担当者№'
;
ALTER TABLE customers MODIFY employee_no VARCHAR(5) NOT NULL  COMMENT '従業員№'
;
ALTER TABLE customers MODIFY ratio_of_wholesale_price_to_retail_price_ranks_code VARCHAR(2) NOT NULL  COMMENT '掛率ランクコード'
;
ALTER TABLE customers MODIFY partner_no VARCHAR(8) NOT NULL  COMMENT '取引№'
;
CREATE TABLE monthly_summary_by_customer_products
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    partner_no                      VARCHAR(8) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_summary_by_customer_products
    ADD CONSTRAINT  PRIMARY KEY  (year, month, partner_no, product_no, customer_no, fiscal_year)
;
ALTER TABLE monthly_summary_by_customer_products COMMENT = '顧客商品別月次取引sum'
;
ALTER TABLE monthly_summary_by_customer_products MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_summary_by_customer_products MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_summary_by_customer_products MODIFY partner_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE monthly_summary_by_customer_products MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE monthly_summary_by_customer_products MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
ALTER TABLE monthly_summary_by_customer_products MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE monthly_summary_by_customers
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    partner_no                      VARCHAR(8) NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_summary_by_customers
    ADD CONSTRAINT  PRIMARY KEY  (year, month, partner_no, customer_no, fiscal_year)
;
ALTER TABLE monthly_summary_by_customers COMMENT = '顧客別月次取引sum'
;
ALTER TABLE monthly_summary_by_customers MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_summary_by_customers MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_summary_by_customers MODIFY partner_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE monthly_summary_by_customers MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
ALTER TABLE monthly_summary_by_customers MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE application_numbers
(
    idnumber                        CHAR(20) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_numbers
    ADD CONSTRAINT  PRIMARY KEY  (idnumber)
;
ALTER TABLE application_numbers COMMENT = '採番テーブル'
;
ALTER TABLE application_numbers MODIFY idnumber CHAR(20) NOT NULL  COMMENT 'idnumber'
;
CREATE TABLE stock_transfer_instructions
(
    no                              VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE stock_transfer_instructions
    ADD CONSTRAINT kt020_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE stock_transfer_instructions
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE stock_transfer_instructions COMMENT = '在庫移動指示'
;
ALTER TABLE stock_transfer_instructions MODIFY no VARCHAR(7) NOT NULL  COMMENT '移動指示№'
;
ALTER TABLE stock_transfer_instructions MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE stock_transfer_instruction_details
(
    no                              VARCHAR(7) NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    location_no                     VARCHAR(5),
    product_no                      VARCHAR(7) NOT NULL,
    shipment_transaction_no         VARCHAR(7) NOT NULL,
    arrival_transaction_no          VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE stock_transfer_instruction_details
    ADD CONSTRAINT kt021_sk1 UNIQUE  (shipment_transaction_no)
;
ALTER TABLE stock_transfer_instruction_details
    ADD CONSTRAINT kt021_sk2 UNIQUE  (arrival_transaction_no)
;
ALTER TABLE stock_transfer_instruction_details
    ADD CONSTRAINT  PRIMARY KEY  (no, line)
;
ALTER TABLE stock_transfer_instruction_details COMMENT = '在庫移動指示明細'
;
ALTER TABLE stock_transfer_instruction_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '移動指示№'
;
ALTER TABLE stock_transfer_instruction_details MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '指示行'
;
ALTER TABLE stock_transfer_instruction_details MODIFY location_no VARCHAR(5) COMMENT '先ロケ№'
;
ALTER TABLE stock_transfer_instruction_details MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE stock_transfer_instruction_details MODIFY shipment_transaction_no VARCHAR(7) NOT NULL  COMMENT '出庫管理№'
;
ALTER TABLE stock_transfer_instruction_details MODIFY arrival_transaction_no VARCHAR(7) NOT NULL  COMMENT '入庫管理№'
;
ALTER TABLE stock_transfer_instruction_details MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE stock_transfers
(
    no                              VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE stock_transfers
    ADD CONSTRAINT kt030_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE stock_transfers
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE stock_transfers COMMENT = '在庫振替'
;
ALTER TABLE stock_transfers MODIFY no VARCHAR(7) NOT NULL  COMMENT '在庫振替№'
;
ALTER TABLE stock_transfers MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE stock_transfers MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№1'
;
CREATE TABLE monthly_summary_by_vendor_products
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_summary_by_vendor_products
    ADD CONSTRAINT  PRIMARY KEY  (year, month, vendor_no, product_no, fiscal_year)
;
ALTER TABLE monthly_summary_by_vendor_products COMMENT = '仕入商品別月次取引sum'
;
ALTER TABLE monthly_summary_by_vendor_products MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_summary_by_vendor_products MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_summary_by_vendor_products MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE monthly_summary_by_vendor_products MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE monthly_summary_by_vendor_products MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE purchases_transfers
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE purchases_transfers
    ADD CONSTRAINT ht010_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE purchases_transfers
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE purchases_transfers COMMENT = '仕入振替'
;
ALTER TABLE purchases_transfers MODIFY no VARCHAR(7) NOT NULL  COMMENT '仕入振替№'
;
ALTER TABLE purchases_transfers MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE purchases_transfers MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE vendors
(
    no                              VARCHAR(8) NOT NULL,
    partner_no                      VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE vendors
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE vendors COMMENT = '仕入先'
;
ALTER TABLE vendors MODIFY no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE vendors MODIFY partner_no VARCHAR(8) NOT NULL  COMMENT '取引№'
;
CREATE TABLE monthly_dealing_by_vendors
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_dealing_by_vendors
    ADD CONSTRAINT  PRIMARY KEY  (year, month, vendor_no, fiscal_year)
;
ALTER TABLE monthly_dealing_by_vendors COMMENT = '仕入先別月次取引sum'
;
ALTER TABLE monthly_dealing_by_vendors MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_dealing_by_vendors MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_dealing_by_vendors MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE monthly_dealing_by_vendors MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE product_details_by_vendors
(
    product_no                      VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    from_day                        DATE NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexct011withnrsyohin
    ON product_details_by_vendors (product_no)
;
CREATE INDEX indexct011withnrtorihikisaki
    ON product_details_by_vendors (vendor_no)
;
ALTER TABLE product_details_by_vendors
    ADD CONSTRAINT  PRIMARY KEY  (product_no, vendor_no, from_day)
;
ALTER TABLE product_details_by_vendors COMMENT = '仕入先別商品明細'
;
ALTER TABLE product_details_by_vendors MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE product_details_by_vendors MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE product_details_by_vendors MODIFY from_day DATE NOT NULL  COMMENT '発効日'
;
CREATE TABLE payment_requests
(
    no                              VARCHAR(7) NOT NULL,
    payment_instruction_no          VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE payment_requests
    ADD CONSTRAINT ct110_sk1 UNIQUE  (transaction_no)
;
CREATE INDEX indexct110withnrsiharai
    ON payment_requests (payment_instruction_no)
;
ALTER TABLE payment_requests
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE payment_requests COMMENT = '支払依頼'
;
ALTER TABLE payment_requests MODIFY no VARCHAR(7) NOT NULL  COMMENT '支払依頼№'
;
ALTER TABLE payment_requests MODIFY payment_instruction_no VARCHAR(7) NOT NULL  COMMENT '支払指示№'
;
ALTER TABLE payment_requests MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE payment_instructions
(
    no                              VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE payment_instructions
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE payment_instructions COMMENT = '支払指示'
;
ALTER TABLE payment_instructions MODIFY no VARCHAR(7) NOT NULL  COMMENT '支払指示№'
;
CREATE TABLE partners
(
    no                              VARCHAR(8) NOT NULL,
    name_kana                       VARCHAR(40) NOT NULL,
    name_kanji                      VARCHAR(40) NOT NULL,
    zip_code                        VARCHAR(8) NOT NULL,
    address1                        VARCHAR(30) NOT NULL,
    address2                        VARCHAR(30),
    tell_number                     VARCHAR(14) NOT NULL,
    fax_number                      VARCHAR(14) NOT NULL,
    url                             VARCHAR(40)
)
ENGINE=InnoDB
;
ALTER TABLE partners
    ADD CONSTRAINT at030_sk1 UNIQUE  (name_kanji)
;
ALTER TABLE partners
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE partners COMMENT = '取引先'
;
ALTER TABLE partners MODIFY no VARCHAR(8) NOT NULL  COMMENT '取引№'
;
ALTER TABLE partners MODIFY name_kana VARCHAR(40) NOT NULL  COMMENT 'カナ名'
;
ALTER TABLE partners MODIFY name_kanji VARCHAR(40) NOT NULL  COMMENT '漢字名'
;
ALTER TABLE partners MODIFY zip_code VARCHAR(8) NOT NULL  COMMENT '郵便番号'
;
ALTER TABLE partners MODIFY address1 VARCHAR(30) NOT NULL  COMMENT '住所１'
;
ALTER TABLE partners MODIFY address2 VARCHAR(30) COMMENT '住所２'
;
ALTER TABLE partners MODIFY tell_number VARCHAR(14) NOT NULL  COMMENT '代表電話番号'
;
ALTER TABLE partners MODIFY fax_number VARCHAR(14) NOT NULL  COMMENT 'fax番号'
;
ALTER TABLE partners MODIFY url VARCHAR(40) COMMENT 'ｕｒｌ'
;
CREATE TABLE received_orders
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    shipment_line                   SMALLINT(6) DEFAULT 0 NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    estimate_no                     VARCHAR(7),
    estimate_version                SMALLINT(6) DEFAULT 0,
    customer_no                     VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexgt010withnrmitsumori_sqversion
    ON received_orders (estimate_no, estimate_version)
;
ALTER TABLE received_orders
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE received_orders COMMENT = '受注見出し'
;
ALTER TABLE received_orders MODIFY no VARCHAR(7) NOT NULL  COMMENT '受注№'
;
ALTER TABLE received_orders MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE received_orders MODIFY shipment_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '出荷先行'
;
ALTER TABLE received_orders MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE received_orders MODIFY estimate_no VARCHAR(7) COMMENT '見積№'
;
ALTER TABLE received_orders MODIFY estimate_version SMALLINT(6) DEFAULT 0 COMMENT '見積版№'
;
ALTER TABLE received_orders MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
CREATE TABLE received_order_details
(
    no                              VARCHAR(7) NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    price                           INT(11) DEFAULT 0 NOT NULL,
    amount                          INT(11) DEFAULT 0 NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexgt011withnrtorihikisaki
    ON received_order_details (vendor_no)
;
ALTER TABLE received_order_details
    ADD CONSTRAINT  PRIMARY KEY  (no, line)
;
ALTER TABLE received_order_details COMMENT = '受注明細'
;
ALTER TABLE received_order_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '受注№'
;
ALTER TABLE received_order_details MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '受注行'
;
ALTER TABLE received_order_details MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE received_order_details MODIFY price INT(11) NOT NULL  DEFAULT 0 COMMENT '受注単価'
;
ALTER TABLE received_order_details MODIFY amount INT(11) NOT NULL  DEFAULT 0 COMMENT '受注数量'
;
ALTER TABLE received_order_details MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
CREATE TABLE transaction_schedules
(
    no                              VARCHAR(7) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexet200withnrsyohin_nrsouko
    ON transaction_schedules (product_no, warehouse_no)
;
ALTER TABLE transaction_schedules
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE transaction_schedules COMMENT = '受払予定'
;
ALTER TABLE transaction_schedules MODIFY no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE transaction_schedules MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE transaction_schedules MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
CREATE TABLE transaction_records
(
    no                              VARCHAR(7) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL,
    dtcreate                        TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    set_instruction_no              VARCHAR(7) NOT NULL,
    set_instruction_no_line         SMALLINT(6) DEFAULT 0 NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexet100withdtcreate
    ON transaction_records (dtcreate)
;
CREATE INDEX indexet100withnrtorihikikanri_nrukebarai
    ON transaction_records (transaction_no, no)
;
ALTER TABLE transaction_records
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE transaction_records COMMENT = '受払履歴'
;
ALTER TABLE transaction_records MODIFY no VARCHAR(7) NOT NULL  COMMENT '受払№'
;
ALTER TABLE transaction_records MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE transaction_records MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE transaction_records MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE transaction_records MODIFY dtcreate TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '記録日時'
;
ALTER TABLE transaction_records MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE transaction_records MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE transaction_records MODIFY set_instruction_no VARCHAR(7) NOT NULL  COMMENT 'セット指示№'
;
ALTER TABLE transaction_records MODIFY set_instruction_no_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '構成行'
;
ALTER TABLE transaction_records MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE receive_details
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE receive_details
    ADD CONSTRAINT dt120_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE receive_details
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE receive_details COMMENT = '受領明細'
;
ALTER TABLE receive_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '受領№'
;
ALTER TABLE receive_details MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE receive_details MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE employees
(
    no                              VARCHAR(5) NOT NULL,
    name_kana                       VARCHAR(20) NOT NULL,
    name_kanji                      VARCHAR(20) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE employees
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE employees COMMENT = '従業員'
;
ALTER TABLE employees MODIFY no VARCHAR(5) NOT NULL  COMMENT '従業員№'
;
ALTER TABLE employees MODIFY name_kana VARCHAR(20) NOT NULL  COMMENT 'カナ名'
;
ALTER TABLE employees MODIFY name_kanji VARCHAR(20) NOT NULL  COMMENT '漢字名'
;
CREATE TABLE employee_departments
(
    no                              VARCHAR(5) NOT NULL,
    from_ym                         VARCHAR(6) NOT NULL,
    department_code                 VARCHAR(5) NOT NULL,
    employee_no                     VARCHAR(5) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexat021withcdbumon
    ON employee_departments (department_code)
;
CREATE INDEX indexat021withnrjyugyoin
    ON employee_departments (no)
;
ALTER TABLE employee_departments
    ADD CONSTRAINT  PRIMARY KEY  (no, from_ym, department_code, employee_no)
;
ALTER TABLE employee_departments COMMENT = '従業員所属部門'
;
ALTER TABLE employee_departments MODIFY no VARCHAR(5) NOT NULL  COMMENT '従業員№'
;
ALTER TABLE employee_departments MODIFY from_ym VARCHAR(6) NOT NULL  COMMENT '所属発効年月'
;
ALTER TABLE employee_departments MODIFY department_code VARCHAR(5) NOT NULL  COMMENT '部門コード'
;
ALTER TABLE employee_departments MODIFY employee_no VARCHAR(5) NOT NULL  COMMENT '従業員№1'
;
CREATE TABLE shipments
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    shipment_line                   SMALLINT(6) DEFAULT 0 NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    request_no                      VARCHAR(7) NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE shipments
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE shipments COMMENT = '出荷見出し'
;
ALTER TABLE shipments MODIFY no VARCHAR(7) NOT NULL  COMMENT '出荷№'
;
ALTER TABLE shipments MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE shipments MODIFY shipment_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '出荷先行'
;
ALTER TABLE shipments MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE shipments MODIFY request_no VARCHAR(7) NOT NULL  COMMENT '請求№'
;
ALTER TABLE shipments MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
CREATE TABLE destinations
(
    no                              VARCHAR(8) NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    name                            VARCHAR(40) NOT NULL,
    zip_code                        VARCHAR(8) NOT NULL,
    address                         VARCHAR(40) NOT NULL,
    tel_number                      VARCHAR(14) NOT NULL,
    fax_number                      VARCHAR(14),
    customer_no                     VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE destinations
    ADD CONSTRAINT  PRIMARY KEY  (no, line, customer_no)
;
ALTER TABLE destinations COMMENT = '出荷先'
;
ALTER TABLE destinations MODIFY no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE destinations MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '出荷先行'
;
ALTER TABLE destinations MODIFY name VARCHAR(40) NOT NULL  COMMENT '漢字名'
;
ALTER TABLE destinations MODIFY zip_code VARCHAR(8) NOT NULL  COMMENT '郵便番号'
;
ALTER TABLE destinations MODIFY address VARCHAR(40) NOT NULL  COMMENT '住所'
;
ALTER TABLE destinations MODIFY tel_number VARCHAR(14) NOT NULL  COMMENT '代表電話番号'
;
ALTER TABLE destinations MODIFY fax_number VARCHAR(14) COMMENT 'fax番号'
;
ALTER TABLE destinations MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
CREATE TABLE shipment_details
(
    received_order_no               VARCHAR(7) NOT NULL,
    received_order_line             SMALLINT(6) DEFAULT 0 NOT NULL,
    shipment_line                   SMALLINT(6) DEFAULT 0 NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    shipment_no                     VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE shipment_details
    ADD CONSTRAINT gt012_sk1 UNIQUE  (transaction_no)
;
CREATE INDEX indexgt012withnrsyukka
    ON shipment_details (shipment_no)
;
ALTER TABLE shipment_details
    ADD CONSTRAINT  PRIMARY KEY  (received_order_no, received_order_line, shipment_line)
;
ALTER TABLE shipment_details COMMENT = '出荷明細'
;
ALTER TABLE shipment_details MODIFY received_order_no VARCHAR(7) NOT NULL  COMMENT '受注№'
;
ALTER TABLE shipment_details MODIFY received_order_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '受注行'
;
ALTER TABLE shipment_details MODIFY shipment_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '出荷行'
;
ALTER TABLE shipment_details MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE shipment_details MODIFY shipment_no VARCHAR(7) NOT NULL  COMMENT '出荷№'
;
ALTER TABLE shipment_details MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE products
(
    no                              VARCHAR(7) NOT NULL,
    name                            VARCHAR(30) NOT NULL,
    parts_number                    VARCHAR(20) NOT NULL,
    maker_code                      VARCHAR(5) NOT NULL,
    sales_price                     INT(11) DEFAULT 0,
    purchase_price                  INT(11) DEFAULT 0
)
ENGINE=InnoDB
;
ALTER TABLE products
    ADD CONSTRAINT bt020_sk1 UNIQUE  (parts_number)
;
CREATE INDEX indexbt020withcdmaker
    ON products (maker_code)
;
ALTER TABLE products
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE products COMMENT = '商品'
;
ALTER TABLE products MODIFY no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE products MODIFY name VARCHAR(30) NOT NULL  COMMENT '商品名'
;
ALTER TABLE products MODIFY parts_number VARCHAR(20) NOT NULL  COMMENT '品番'
;
ALTER TABLE products MODIFY maker_code VARCHAR(5) NOT NULL  COMMENT 'メーカーコード'
;
ALTER TABLE products MODIFY sales_price INT(11) DEFAULT 0 COMMENT '標準売価'
;
ALTER TABLE products MODIFY purchase_price INT(11) DEFAULT 0 COMMENT '標準仕入価格'
;
CREATE TABLE monthly_summary_by_warehouse_products
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_summary_by_warehouse_products
    ADD CONSTRAINT  PRIMARY KEY  (year, month, product_no, warehouse_no, fiscal_year)
;
ALTER TABLE monthly_summary_by_warehouse_products COMMENT = '商品倉庫別月次取引sum'
;
ALTER TABLE monthly_summary_by_warehouse_products MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_summary_by_warehouse_products MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_summary_by_warehouse_products MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE monthly_summary_by_warehouse_products MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE monthly_summary_by_warehouse_products MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE monthly_product_transaction_summaries
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE monthly_product_transaction_summaries
    ADD CONSTRAINT  PRIMARY KEY  (year, month, product_no, fiscal_year)
;
ALTER TABLE monthly_product_transaction_summaries COMMENT = '商品別月次取引sum'
;
ALTER TABLE monthly_product_transaction_summaries MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE monthly_product_transaction_summaries MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE monthly_product_transaction_summaries MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE monthly_product_transaction_summaries MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE application_taxes
(
    start                           DATE NOT NULL,
    taxrate                         DECIMAL(3,2) DEFAULT 0.00 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_taxes
    ADD CONSTRAINT  PRIMARY KEY  (start)
;
ALTER TABLE application_taxes COMMENT = '消費税率'
;
ALTER TABLE application_taxes MODIFY start DATE NOT NULL  COMMENT 'start'
;
ALTER TABLE application_taxes MODIFY taxrate DECIMAL(3,2) NOT NULL  DEFAULT 0.00 COMMENT 'taxrate'
;
CREATE TABLE request_instructions
(
    no                              VARCHAR(7) NOT NULL,
    date                            DATE NOT NULL,
    partner_no                      VARCHAR(8) NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE request_instructions
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE request_instructions COMMENT = '請求指示'
;
ALTER TABLE request_instructions MODIFY no VARCHAR(7) NOT NULL  COMMENT '請求№'
;
ALTER TABLE request_instructions MODIFY date DATE NOT NULL  COMMENT '請求日'
;
ALTER TABLE request_instructions MODIFY partner_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE request_instructions MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
CREATE TABLE warehouses
(
    no                              VARCHAR(5) NOT NULL,
    name                            VARCHAR(20) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE warehouses
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE warehouses COMMENT = '倉庫'
;
ALTER TABLE warehouses MODIFY no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE warehouses MODIFY name VARCHAR(20) NOT NULL  COMMENT '倉庫名'
;
CREATE TABLE warehouse_locations
(
    no                              VARCHAR(5) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexbt031withnrsouko
    ON warehouse_locations (warehouse_no)
;
ALTER TABLE warehouse_locations
    ADD CONSTRAINT  PRIMARY KEY  (warehouse_no, no)
;
ALTER TABLE warehouse_locations COMMENT = '倉庫ロケ'
;
ALTER TABLE warehouse_locations MODIFY no VARCHAR(5) NOT NULL  COMMENT 'ロケ№'
;
ALTER TABLE warehouse_locations MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
CREATE TABLE warehouse_stocks
(
    product_no                      VARCHAR(7) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    no                              VARCHAR(5) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexet010withnrsouko
    ON warehouse_stocks (warehouse_no)
;
ALTER TABLE warehouse_stocks
    ADD CONSTRAINT  PRIMARY KEY  (product_no)
;
ALTER TABLE warehouse_stocks COMMENT = '倉庫在庫'
;
ALTER TABLE warehouse_stocks MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE warehouse_stocks MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE warehouse_stocks MODIFY no VARCHAR(5) NOT NULL  COMMENT 'ロケ№'
;
CREATE TABLE stocktaking_instructions
(
    no                              VARCHAR(7) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL,
    location_no                     VARCHAR(5),
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE stocktaking_instructions
    ADD CONSTRAINT kt010_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE stocktaking_instructions
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE stocktaking_instructions COMMENT = '棚卸指示'
;
ALTER TABLE stocktaking_instructions MODIFY no VARCHAR(7) NOT NULL  COMMENT '棚卸№'
;
ALTER TABLE stocktaking_instructions MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
ALTER TABLE stocktaking_instructions MODIFY location_no VARCHAR(5) COMMENT 'ロケ№'
;
ALTER TABLE stocktaking_instructions MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE stocktaking_instruction_details
(
    no                              VARCHAR(7) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    location_no                     VARCHAR(5) NOT NULL,
    price                           INT(11) DEFAULT 0 NOT NULL,
    book_amount                     INT(11) DEFAULT 0,
    real_amount                     INT(11) DEFAULT 0
)
ENGINE=InnoDB
;
ALTER TABLE stocktaking_instruction_details
    ADD CONSTRAINT  PRIMARY KEY  (no, product_no)
;
ALTER TABLE stocktaking_instruction_details COMMENT = '棚卸支持明細'
;
ALTER TABLE stocktaking_instruction_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '棚卸№'
;
ALTER TABLE stocktaking_instruction_details MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE stocktaking_instruction_details MODIFY location_no VARCHAR(5) NOT NULL  COMMENT 'ロケ№'
;
ALTER TABLE stocktaking_instruction_details MODIFY price INT(11) NOT NULL  DEFAULT 0 COMMENT '受払単価'
;
ALTER TABLE stocktaking_instruction_details MODIFY book_amount INT(11) DEFAULT 0 COMMENT '帳簿在庫数量'
;
ALTER TABLE stocktaking_instruction_details MODIFY real_amount INT(11) DEFAULT 0 COMMENT '実棚数量'
;
CREATE TABLE special_purchases
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE special_purchases
    ADD CONSTRAINT ht020_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE special_purchases
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE special_purchases COMMENT = '特殊仕入'
;
ALTER TABLE special_purchases MODIFY no VARCHAR(7) NOT NULL  COMMENT '特殊仕入№'
;
ALTER TABLE special_purchases MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE special_purchases MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE special_sales
(
    no                              VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE special_sales
    ADD CONSTRAINT jt020_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE special_sales
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE special_sales COMMENT = '特殊売上'
;
ALTER TABLE special_sales MODIFY no VARCHAR(7) NOT NULL  COMMENT '特殊売上№'
;
ALTER TABLE special_sales MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE arrivals
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE arrivals
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE arrivals COMMENT = '入荷見出し'
;
ALTER TABLE arrivals MODIFY no VARCHAR(7) NOT NULL  COMMENT '入荷№'
;
ALTER TABLE arrivals MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
CREATE TABLE arrival_details
(
    no                              VARCHAR(7) NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    arrival_line                    SMALLINT(6) DEFAULT 0 NOT NULL,
    arrival_no                      VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE arrival_details
    ADD CONSTRAINT ft012_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE arrival_details
    ADD CONSTRAINT  PRIMARY KEY  (no, line, arrival_line)
;
ALTER TABLE arrival_details COMMENT = '入荷明細'
;
ALTER TABLE arrival_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '発注№'
;
ALTER TABLE arrival_details MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '発注行'
;
ALTER TABLE arrival_details MODIFY arrival_line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '入荷行'
;
ALTER TABLE arrival_details MODIFY arrival_no VARCHAR(7) NOT NULL  COMMENT '入荷№'
;
ALTER TABLE arrival_details MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
CREATE TABLE application_fiscal_exchange_rates
(
    currency                        CHAR(3) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE application_fiscal_exchange_rates
    ADD CONSTRAINT  PRIMARY KEY  (currency, fiscal_year)
;
ALTER TABLE application_fiscal_exchange_rates COMMENT = '年次為替レート'
;
ALTER TABLE application_fiscal_exchange_rates MODIFY currency CHAR(3) NOT NULL  COMMENT 'currency'
;
ALTER TABLE application_fiscal_exchange_rates MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT 'fiscal_year'
;
CREATE TABLE fiscal_summaries
(
    year                            SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE fiscal_summaries
    ADD CONSTRAINT  PRIMARY KEY  (year)
;
ALTER TABLE fiscal_summaries COMMENT = '年次取引sum'
;
ALTER TABLE fiscal_summaries MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE accounts_payable_records
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL,
    payment_request_no              VARCHAR(7),
    dtcreate                        TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexct100withdtcreate
    ON accounts_payable_records (dtcreate)
;
CREATE INDEX indexct100withnrsiharaiirai
    ON accounts_payable_records (payment_request_no)
;
CREATE INDEX indexct100withnrtorihikikanri_nrsiire
    ON accounts_payable_records (transaction_no, no)
;
CREATE INDEX indexct100withnrtorihikisaki
    ON accounts_payable_records (vendor_no)
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE accounts_payable_records COMMENT = '買掛増減履歴'
;
ALTER TABLE accounts_payable_records MODIFY no VARCHAR(7) NOT NULL  COMMENT '買掛増減№'
;
ALTER TABLE accounts_payable_records MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE accounts_payable_records MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE accounts_payable_records MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE accounts_payable_records MODIFY payment_request_no VARCHAR(7) COMMENT '支払依頼№'
;
ALTER TABLE accounts_payable_records MODIFY dtcreate TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '記録日時'
;
ALTER TABLE accounts_payable_records MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE accounts_payable_records MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE accounts_payable_records MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE accounts_receivable_records
(
    no                              VARCHAR(7) NOT NULL,
    partner_no                      VARCHAR(8) NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    request_no                      VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL,
    dtcreate                        TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    year                            SMALLINT(6) DEFAULT 0 NOT NULL,
    month                           SMALLINT(6) DEFAULT 0 NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL,
    fiscal_year                     SMALLINT(6) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexdt100withdtcreate
    ON accounts_receivable_records (dtcreate)
;
CREATE INDEX indexdt100withnrtorihikikanri_nruriage
    ON accounts_receivable_records (transaction_no, no)
;
CREATE INDEX indexdt100withnrtorihikisaki
    ON accounts_receivable_records (partner_no)
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE accounts_receivable_records COMMENT = '売掛増減履歴'
;
ALTER TABLE accounts_receivable_records MODIFY no VARCHAR(7) NOT NULL  COMMENT '売掛増減№'
;
ALTER TABLE accounts_receivable_records MODIFY partner_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE accounts_receivable_records MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE accounts_receivable_records MODIFY request_no VARCHAR(7) NOT NULL  COMMENT '請求№'
;
ALTER TABLE accounts_receivable_records MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE accounts_receivable_records MODIFY dtcreate TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '記録日時'
;
ALTER TABLE accounts_receivable_records MODIFY year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引年度'
;
ALTER TABLE accounts_receivable_records MODIFY month SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '取引月序'
;
ALTER TABLE accounts_receivable_records MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
ALTER TABLE accounts_receivable_records MODIFY fiscal_year SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '年度'
;
CREATE TABLE transfer_sales
(
    no                              VARCHAR(7) NOT NULL,
    transaction_no                  VARCHAR(7) NOT NULL,
    customer_no                     VARCHAR(8) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE transfer_sales
    ADD CONSTRAINT jt010_sk1 UNIQUE  (transaction_no)
;
ALTER TABLE transfer_sales
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE transfer_sales COMMENT = '売上振替'
;
ALTER TABLE transfer_sales MODIFY no VARCHAR(7) NOT NULL  COMMENT '売上振替№'
;
ALTER TABLE transfer_sales MODIFY transaction_no VARCHAR(7) NOT NULL  COMMENT '取引管理№'
;
ALTER TABLE transfer_sales MODIFY customer_no VARCHAR(8) NOT NULL  COMMENT '顧客№'
;
CREATE TABLE orders
(
    no                              VARCHAR(7) NOT NULL,
    vendor_no                       VARCHAR(8) NOT NULL,
    employee_no                     VARCHAR(5) NOT NULL,
    warehouse_no                    VARCHAR(5) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE orders
    ADD CONSTRAINT  PRIMARY KEY  (no)
;
ALTER TABLE orders COMMENT = '発注見出し'
;
ALTER TABLE orders MODIFY no VARCHAR(7) NOT NULL  COMMENT '発注№'
;
ALTER TABLE orders MODIFY vendor_no VARCHAR(8) NOT NULL  COMMENT '仕入先№'
;
ALTER TABLE orders MODIFY employee_no VARCHAR(5) NOT NULL  COMMENT '従業員№'
;
ALTER TABLE orders MODIFY warehouse_no VARCHAR(5) NOT NULL  COMMENT '倉庫№'
;
CREATE TABLE order_details
(
    no                              VARCHAR(7) NOT NULL,
    line                            SMALLINT(6) DEFAULT 0 NOT NULL,
    product_no                      VARCHAR(7) NOT NULL,
    price                           DECIMAL(10,2) DEFAULT 0.00 NOT NULL,
    amount                          INT(11) DEFAULT 0 NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE order_details
    ADD CONSTRAINT  PRIMARY KEY  (no, line)
;
ALTER TABLE order_details COMMENT = '発注明細'
;
ALTER TABLE order_details MODIFY no VARCHAR(7) NOT NULL  COMMENT '発注№'
;
ALTER TABLE order_details MODIFY line SMALLINT(6) NOT NULL  DEFAULT 0 COMMENT '発注行'
;
ALTER TABLE order_details MODIFY product_no VARCHAR(7) NOT NULL  COMMENT '内部商品№'
;
ALTER TABLE order_details MODIFY price DECIMAL(10,2) NOT NULL  DEFAULT 0.00 COMMENT '発注単価'
;
ALTER TABLE order_details MODIFY amount INT(11) NOT NULL  DEFAULT 0 COMMENT '発注数量'
;
CREATE TABLE departments
(
    code                            VARCHAR(5) NOT NULL,
    name                            VARCHAR(30) NOT NULL
)
ENGINE=InnoDB
;
ALTER TABLE departments
    ADD CONSTRAINT  PRIMARY KEY  (code)
;
ALTER TABLE departments COMMENT = '部門'
;
ALTER TABLE departments MODIFY code VARCHAR(5) NOT NULL  COMMENT '部門コード'
;
ALTER TABLE departments MODIFY name VARCHAR(30) NOT NULL  COMMENT '部門名'
;
CREATE TABLE department_structures
(
    department_code                 VARCHAR(5) NOT NULL,
    from_ym                         VARCHAR(6) NOT NULL,
    upper_department_code           VARCHAR(5) NOT NULL
)
ENGINE=InnoDB
;
CREATE INDEX indexat011withcdbumon
    ON department_structures (department_code)
;
CREATE INDEX indexat011withcdjyouibumon
    ON department_structures (upper_department_code)
;
ALTER TABLE department_structures
    ADD CONSTRAINT  PRIMARY KEY  (from_ym)
;
ALTER TABLE department_structures COMMENT = '部門構成'
;
ALTER TABLE department_structures MODIFY department_code VARCHAR(5) NOT NULL  COMMENT '部門コード'
;
ALTER TABLE department_structures MODIFY from_ym VARCHAR(6) NOT NULL  COMMENT '発効年月'
;
ALTER TABLE department_structures MODIFY upper_department_code VARCHAR(5) NOT NULL  COMMENT '上位部門コード'
;
ALTER TABLE department_structures
    ADD CONSTRAINT fk_departments_department_structures FOREIGN KEY(department_code) REFERENCES departments (code) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE employee_departments
    ADD CONSTRAINT fk_departments_employee_departments FOREIGN KEY(department_code) REFERENCES departments (code) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE employee_departments
    ADD CONSTRAINT fk_employees_employee_departments FOREIGN KEY(employee_no) REFERENCES employees (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE customers
    ADD CONSTRAINT fk_employees_customers FOREIGN KEY(employee_no) REFERENCES employees (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT fk_payment_requests_accounts_payable_records FOREIGN KEY(transaction_no) REFERENCES payment_requests (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT fk_arrival_details_accounts_payable_records FOREIGN KEY(transaction_no) REFERENCES arrival_details (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT fk_purchases_transfers_accounts_payable_records FOREIGN KEY(transaction_no) REFERENCES purchases_transfers (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT fk_special_purchases_accounts_payable_records FOREIGN KEY(transaction_no) REFERENCES special_purchases (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_dealing_by_vendors
    ADD CONSTRAINT fk_vendors_monthly_dealing_by_vendors FOREIGN KEY(vendor_no) REFERENCES vendors (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE product_details_by_vendors
    ADD CONSTRAINT fk_vendors_ct011 FOREIGN KEY(vendor_no) REFERENCES vendors (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE payment_requests
    ADD CONSTRAINT fk_payment_instructions_payment_requests FOREIGN KEY(payment_instruction_no) REFERENCES payment_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_receive_details_accounts_receivable_records FOREIGN KEY(transaction_no) REFERENCES receive_details (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_shipment_details_accounts_receivable_records FOREIGN KEY(transaction_no) REFERENCES shipment_details (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_transfer_sales_accounts_receivable_records FOREIGN KEY(transaction_no) REFERENCES transfer_sales (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_special_sales_accounts_receivable_records FOREIGN KEY(transaction_no) REFERENCES special_sales (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_request_instructions_accounts_receivable_records FOREIGN KEY(request_no) REFERENCES request_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE request_instructions
    ADD CONSTRAINT fk_customers_request_instructions FOREIGN KEY(customer_no) REFERENCES customers (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_customers
    ADD CONSTRAINT fk_customers_monthly_summary_by_customers FOREIGN KEY(customer_no) REFERENCES customers (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE destinations
    ADD CONSTRAINT fk_customers_destinations FOREIGN KEY(customer_no) REFERENCES customers (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE customers
    ADD CONSTRAINT fk_ratio_of_wholesale_price_to_retail_price_ranks_customers FOREIGN KEY(ratio_of_wholesale_price_to_retail_price_ranks_code) REFERENCES ratio_of_wholesale_price_to_retail_price_ranks (code) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_stocktaking_instructions_transaction_records FOREIGN KEY(transaction_no) REFERENCES stocktaking_instructions (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_stock_transfer_instructions_transaction_records FOREIGN KEY(transaction_no) REFERENCES stock_transfer_instructions (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_stock_transfers_transaction_records FOREIGN KEY(transaction_no) REFERENCES stock_transfers (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_special_purchases_transaction_records FOREIGN KEY(transaction_no) REFERENCES special_purchases (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_special_sales_transaction_records FOREIGN KEY(transaction_no) REFERENCES special_sales (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_arrival_details_transaction_records FOREIGN KEY(transaction_no) REFERENCES arrival_details (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_shipment_details_transaction_records FOREIGN KEY(transaction_no) REFERENCES shipment_details (transaction_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_set_instructions_transaction_records FOREIGN KEY(set_instruction_no) REFERENCES set_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_set_instruction_details_transaction_records FOREIGN KEY(set_instruction_no, set_instruction_no_line) REFERENCES set_instruction_details (no, line) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_records
    ADD CONSTRAINT fk_monthly_summary_by_warehouse_products_transaction_records FOREIGN KEY(year, month, product_no, warehouse_no, fiscal_year) REFERENCES monthly_summary_by_warehouse_products (year, month, product_no, warehouse_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_warehouse_products
    ADD CONSTRAINT fk_warehouse_stocks_monthly_summary_by_warehouse_products FOREIGN KEY(product_no) REFERENCES warehouse_stocks (product_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transaction_schedules
    ADD CONSTRAINT fk_warehouse_stocks_transaction_schedules FOREIGN KEY(product_no) REFERENCES warehouse_stocks (product_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE orders
    ADD CONSTRAINT fk_vendors_arrivals FOREIGN KEY(vendor_no) REFERENCES vendors (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE order_details
    ADD CONSTRAINT fk_orders_order_details FOREIGN KEY(no) REFERENCES orders (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE arrival_details
    ADD CONSTRAINT fk_order_details_arrival_details FOREIGN KEY(no, line) REFERENCES order_details (no, line) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE arrival_details
    ADD CONSTRAINT fk_arrivals_arrival_details FOREIGN KEY(arrival_no) REFERENCES arrivals (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE arrivals
    ADD CONSTRAINT fk_vendors_arrivals FOREIGN KEY(vendor_no) REFERENCES vendors (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE estimates
    ADD CONSTRAINT fk_destinations_estimates FOREIGN KEY(vendor_no, shipment_line, customer_no) REFERENCES destinations (no, line, customer_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE estimate_details
    ADD CONSTRAINT fk_estimates_estimate_details FOREIGN KEY(no, version) REFERENCES estimates (no, version) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE received_order_details
    ADD CONSTRAINT fk_received_orders_received_order_details FOREIGN KEY(no) REFERENCES received_orders (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE received_orders
    ADD CONSTRAINT fk_destinations_received_orders FOREIGN KEY(vendor_no, shipment_line, customer_no) REFERENCES destinations (no, line, customer_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE shipments
    ADD CONSTRAINT fk_request_instructions_shipments FOREIGN KEY(request_no) REFERENCES request_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE shipment_details
    ADD CONSTRAINT fk_shipments_shipment_details FOREIGN KEY(shipment_no) REFERENCES shipments (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE transfer_sales
    ADD CONSTRAINT fk_customers_transfer_sales FOREIGN KEY(customer_no) REFERENCES customers (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE stock_transfers
    ADD CONSTRAINT fk_products_stock_transfers FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE stocktaking_instruction_details
    ADD CONSTRAINT fk_stocktaking_instructions_stocktaking_instruction_details FOREIGN KEY(no) REFERENCES stocktaking_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE stock_transfer_instruction_details
    ADD CONSTRAINT fk_stock_transfer_instructions_stock_transfer_instruction_detail FOREIGN KEY(no) REFERENCES stock_transfer_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE stock_transfer_instruction_details
    ADD CONSTRAINT fk_transaction_schedules_stock_transfer_instruction_details FOREIGN KEY(transaction_no) REFERENCES transaction_schedules (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE set_instructions
    ADD CONSTRAINT fk_products_set_instructions FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE makers
    ADD CONSTRAINT fk_products_markers FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE product_sets
    ADD CONSTRAINT fk_products_product_sets FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE set_instruction_details
    ADD CONSTRAINT fk_set_instructions_set_instruction_details FOREIGN KEY(no) REFERENCES set_instructions (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_product_transaction_summaries
    ADD CONSTRAINT fk_products_product_monthly_transaction_summary FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE warehouse_stocks
    ADD CONSTRAINT fk_products_warehouse_stocks FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE warehouse_locations
    ADD CONSTRAINT fk_warehouse_warehouse_locations FOREIGN KEY(warehouse_no) REFERENCES warehouses (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE warehouse_stocks
    ADD CONSTRAINT fk_warehouses_warehouse_stocks FOREIGN KEY(warehouse_no) REFERENCES warehouses (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summaries
    ADD CONSTRAINT fk_fiscal_summary_monthly_summary FOREIGN KEY(fiscal_year) REFERENCES fiscal_summaries (year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_product_transaction_summaries
    ADD CONSTRAINT fk_monthly_summary_product_monthly_transaction_summary FOREIGN KEY(year, month, fiscal_year) REFERENCES monthly_summaries (year, month, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_warehouse_products
    ADD CONSTRAINT fk_monthly_product_transaction_summary_monthly_summary_by_wareho FOREIGN KEY(year, month, product_no, fiscal_year) REFERENCES monthly_product_transaction_summaries (year, month, product_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_dealing_by_vendors
    ADD CONSTRAINT fk_monthly_summary_monthly_dealing_by_vendors FOREIGN KEY(year, month, fiscal_year) REFERENCES monthly_summaries (year, month, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_vendor_products
    ADD CONSTRAINT fk_monthly_dealing_by_vendors_monthly_summary_by_vendor_products FOREIGN KEY(year, month, vendor_no, fiscal_year) REFERENCES monthly_dealing_by_vendors (year, month, vendor_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT fk_monthly_summary_by_vendor_products_accounts_payable_records FOREIGN KEY(year, month, vendor_no, product_no, fiscal_year) REFERENCES monthly_summary_by_vendor_products (year, month, vendor_no, product_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_payable_records
    ADD CONSTRAINT fk_monthly_dealing_by_vendors_accounts_payable_records FOREIGN KEY(year, month, vendor_no, fiscal_year) REFERENCES monthly_dealing_by_vendors (year, month, vendor_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_customers
    ADD CONSTRAINT fk_monthly_summary_monthly_summary_by_customers FOREIGN KEY(year, month, fiscal_year) REFERENCES monthly_summaries (year, month, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_monthly_summary_by_customer_products_accounts_receivable_reco FOREIGN KEY(year, month, partner_no, product_no, customer_no, fiscal_year) REFERENCES monthly_summary_by_customer_products (year, month, partner_no, product_no, customer_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE accounts_receivable_records
    ADD CONSTRAINT fk_monthly_summary_by_customers_accounts_receivable_records FOREIGN KEY(year, month, partner_no, customer_no, fiscal_year) REFERENCES monthly_summary_by_customers (year, month, partner_no, customer_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_sales_representatives
    ADD CONSTRAINT fk_monthly_summary_monthly_summary_by_sales_representatives FOREIGN KEY(year, month, fiscal_year) REFERENCES monthly_summaries (year, month, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE monthly_summary_by_customer_products
    ADD CONSTRAINT fk_monthly_summary_by_customers_monthly_summary_by_customer_prod FOREIGN KEY(year, month, partner_no, customer_no, fiscal_year) REFERENCES monthly_summary_by_customers (year, month, partner_no, customer_no, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE application_users
    ADD CONSTRAINT fk_employees_application_users FOREIGN KEY(employee_no) REFERENCES employees (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE application_user_filters
    ADD CONSTRAINT fk_application_users_application_user_filters FOREIGN KEY(application_users_id) REFERENCES application_users (id) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE application_sessions
    ADD CONSTRAINT fk_application_users_application_sessions FOREIGN KEY(application_users_id) REFERENCES application_users (id) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE application_session_details
    ADD CONSTRAINT fk_application_sessions_application_session_details FOREIGN KEY(session) REFERENCES application_sessions (session) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE application_monthly_exchange_rates
    ADD CONSTRAINT fk_system_fiscal_exchange_rates_system_monthly_exchange_rates FOREIGN KEY(currency, fiscal_year) REFERENCES application_fiscal_exchange_rates (currency, fiscal_year) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE shipments
    ADD CONSTRAINT fk_destinations_shipments FOREIGN KEY(vendor_no, shipment_line, customer_no) REFERENCES destinations (no, line, customer_no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE customers
    ADD CONSTRAINT fk_partners_customers FOREIGN KEY(partner_no) REFERENCES partners (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE vendors
    ADD CONSTRAINT fk_partners_vendors FOREIGN KEY(partner_no) REFERENCES partners (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE warehouse_stocks
    ADD CONSTRAINT fk_warehouse_locations_warehouse_stocks FOREIGN KEY(warehouse_no, no) REFERENCES warehouse_locations (warehouse_no, no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE product_details_by_vendors
    ADD CONSTRAINT fk_products_product_details_by_vendors FOREIGN KEY(product_no) REFERENCES products (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE arrival_details
    ADD CONSTRAINT fk_transaction_schedules_arrival_details FOREIGN KEY(transaction_no) REFERENCES transaction_schedules (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE shipment_details
    ADD CONSTRAINT fk_transaction_schedules_shipment_details FOREIGN KEY(transaction_no) REFERENCES transaction_schedules (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE purchases_transfers
    ADD CONSTRAINT fk_vendors_purchases_transfers FOREIGN KEY(vendor_no) REFERENCES vendors (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE special_purchases
    ADD CONSTRAINT fk_vendors_special_purchases FOREIGN KEY(vendor_no) REFERENCES vendors (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE set_instruction_details
    ADD CONSTRAINT fk_transaction_schedules_set_instruction_details FOREIGN KEY(transaction_no) REFERENCES transaction_schedules (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
ALTER TABLE set_instructions
    ADD CONSTRAINT fk_transaction_schedules_set_instructions FOREIGN KEY(transaction_no) REFERENCES transaction_schedules (no) ON UPDATE NO ACTION ON DELETE NO ACTION
;
